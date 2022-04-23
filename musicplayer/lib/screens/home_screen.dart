import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicplayer/cubit/homepage_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomepageCubit, HomepageState>(
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
              itemBuilder: (context, ind) => ListTile(
                leading: const Icon(Icons.library_music),
                title: Text(state.tracks[ind].track.trackName),
                subtitle: Text(state.tracks[ind].track.albumName),
                trailing: Text(state.tracks[ind].track.artistName),
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
      ),
    );
  }
}
