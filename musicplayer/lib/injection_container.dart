import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:musicplayer/cubit/details_cubit.dart';
import 'package:musicplayer/repository/tracks_repository.dart';

import 'cubit/homepage_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - HomeScreen, DetailsScreen

  // Bloc
  sl.registerLazySingleton<HomepageCubit>(() => HomepageCubit(sl()));
  sl.registerFactory<DetailsCubit>(() => DetailsCubit(sl()));

  // Repository
  sl.registerLazySingleton<TracksRepository>(
      () => TracksRepositoryImpl(client: sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
}
