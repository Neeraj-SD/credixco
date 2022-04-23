part of 'homepage_cubit.dart';

@immutable
abstract class HomepageState {}

class Initial extends HomepageState {}

class Loading extends HomepageState {}

class Loaded extends HomepageState {
  final List<Track> tracks;
  Loaded({
    required this.tracks,
  });
}

class HomepageError extends HomepageState {}
