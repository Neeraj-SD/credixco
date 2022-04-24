import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:musicplayer/cubit/homepage_cubit.dart';
import 'package:musicplayer/repository/tracks_repository.dart';

import '../models/lyric.dart';
import '../models/track.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final TracksRepository repository;
  DetailsCubit(
    this.repository,
  ) : super(DetailsState(pageStatus: PageStatus.Initial, selectedTrack: -1));

  void setTrack(int id) =>
      emit(state.copyWith(selectedTrack: id, pageStatus: PageStatus.Initial));

  void loadLyric() async {
    emit(state.copyWith(loadingLyrics: true));
    final result = await repository.getLyric(state.selectedTrack);
    result.fold(
      (l) => emit(state.copyWith(pageStatus: PageStatus.Error)),
      (r) => emit(
        state.copyWith(loadingLyrics: false, lyric: r),
      ),
    );
  }

  void loadDetails() async {
    emit(state.copyWith(pageStatus: PageStatus.Loading));
    final result = await repository.getTrackDetails(state.selectedTrack);
    result.fold(
      (l) => emit(state.copyWith(pageStatus: PageStatus.Error)),
      (r) => emit(
        state.copyWith(pageStatus: PageStatus.Loaded, track: r),
      ),
    );
  }
}
