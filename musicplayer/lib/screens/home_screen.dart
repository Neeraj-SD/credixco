import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicplayer/cubit/details_cubit.dart';
import 'package:musicplayer/cubit/homepage_cubit.dart';
import 'package:musicplayer/cubit/internet_cubit.dart';
import 'package:musicplayer/screens/details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, internet) {
          if (internet is Disconnected) {
            return const Center(child: Text('No internet connection'));
          }
          return BlocBuilder<HomepageCubit, HomepageState>(
            builder: (context, state) {
              print(state);
              if (state is Initial) {
                context.read<HomepageCubit>().loadTracks();
              }
              if (state is Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is Loaded) {
                return ListView.separated(
                  itemCount: state.tracks.length,
                  itemBuilder: (context, ind) =>
                      BlocBuilder<DetailsCubit, DetailsState>(
                    builder: (context, details) {
                      return ListTile(
                        leading: const Icon(Icons.library_music),
                        title: Text(state.tracks[ind].track.trackName),
                        subtitle: Text(state.tracks[ind].track.albumName),
                        trailing: Text(state.tracks[ind].track.artistName),
                        onTap: () async {
                          context
                              .read<DetailsCubit>()
                              .setTrack(state.tracks[ind].track.trackId);
                          await Navigator.of(context).pushNamed('/details');
                        },
                      );
                    },
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 3,
                  ),
                );
              }

              return const Center(
                child: Text('No data'),
              );
            },
          );
        },
      ),
    );
  }
}
