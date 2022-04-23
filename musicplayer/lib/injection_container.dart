import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:musicplayer/repository/tracks_repository.dart';

import 'cubit/homepage_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - HomeScreen

  // Bloc
  sl.registerLazySingleton<HomepageCubit>(() => HomepageCubit(sl()));

  // Repository
  sl.registerLazySingleton<TracksRepository>(
      () => TracksRepositoryImpl(client: sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
}
