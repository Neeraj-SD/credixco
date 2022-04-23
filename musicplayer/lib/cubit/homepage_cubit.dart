import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musicplayer/models/track.dart';
import 'package:musicplayer/repository/tracks_repository.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  final TracksRepository repository;
  HomepageCubit(
    this.repository,
  ) : super(Initial());

  void loadTracks() {
    emit(Loading());
    // Fetch from repository
    emit(Loaded(tracks: []));
  }
}
