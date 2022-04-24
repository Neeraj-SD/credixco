import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'cubit/details_cubit.dart';
import 'cubit/homepage_cubit.dart';
import 'cubit/internet_cubit.dart';
import '../core/network/network_info.dart';
import 'repository/tracks_repository.dart';
import './utils/router/app_router.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - HomeScreen, DetailsScreen

  // Bloc
  sl.registerLazySingleton<HomepageCubit>(() => HomepageCubit(sl()));
  sl.registerLazySingleton<InternetCubit>(() => InternetCubit(sl()));
  sl.registerFactory<DetailsCubit>(() => DetailsCubit(sl()));

  // Repository
  sl.registerLazySingleton<TracksRepository>(
      () => TracksRepositoryImpl(client: sl()));

  sl.registerLazySingleton<AppRouter>(() => AppRouter());

  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(
      () => (NetworkInfoImpl(connectionChecker: sl())));
}
