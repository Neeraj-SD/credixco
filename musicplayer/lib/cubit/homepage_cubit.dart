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

  Future<void> loadTracks() async {
    print('fetching tracks');
    await Future.delayed(const Duration(seconds: 0));
    emit(Loading());
    final result = await repository.getTracks();
    result.fold((l) => print(l), (r) => emit(Loaded(tracks: r)));
    print('Loaded');
  }
}
