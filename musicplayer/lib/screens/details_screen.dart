import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicplayer/cubit/details_cubit.dart';
import 'package:musicplayer/cubit/internet_cubit.dart';
import 'package:musicplayer/injection_container.dart';

class DetailsScreen extends StatelessWidget {
  // final int selectedTrack;
  DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Details'),
      ),
      body: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, internet) {
          if (internet is Disconnected) {
            return const Center(
              child: Text('Internet Disconnected'),
            );
          }
          return BlocBuilder<DetailsCubit, DetailsState>(
            builder: (context, state) {
              print(state);
              if (state.pageStatus == PageStatus.Initial) {
                context.read<DetailsCubit>().loadDetails();
                context.read<DetailsCubit>().loadLyric();
              }
              if (state.pageStatus == PageStatus.Loaded) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text('Name',
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.start),
                        Text(state.track!.track.trackName,
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.start),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Artist',
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.start),
                        Text(state.track!.track.artistName,
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.start),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Album Name',
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.start),
                        Text(state.track!.track.albumName,
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.start),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Explicit',
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.start),
                        Text('${state.track!.track.explicit}',
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.start),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Rating',
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.start),
                        Text('${state.track!.track.trackRating}',
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.start),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('artist_name',
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.start),
                        Text(state.track!.track.artistName,
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.start),
                        const SizedBox(
                          height: 10,
                        ),
                        state.loadingLyrics!
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                state.lyric!.lyricsBody,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
