part of 'details_cubit.dart';

enum PageStatus { Initial, Loading, Loaded, Error }

class DetailsState extends Equatable {
  PageStatus pageStatus;
  int selectedTrack;
  late Lyric? lyric;
  late Track? track;
  late bool? loadingLyrics;

  DetailsState({
    required this.pageStatus,
    required this.selectedTrack,
    this.lyric,
    this.track,
    this.loadingLyrics,
  });

  DetailsState copyWith({
    PageStatus? pageStatus,
    int? selectedTrack,
    Lyric? lyric,
    Track? track,
    bool? loadingLyrics,
  }) {
    return DetailsState(
      pageStatus: pageStatus ?? this.pageStatus,
      selectedTrack: selectedTrack ?? this.selectedTrack,
      lyric: lyric ?? this.lyric,
      track: track ?? this.track,
      loadingLyrics: loadingLyrics ?? this.loadingLyrics,
    );
  }

  @override
  List<Object?> get props =>
      [pageStatus, selectedTrack, track, lyric, loadingLyrics];
}
