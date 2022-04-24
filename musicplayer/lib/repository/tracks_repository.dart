import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:musicplayer/models/lyric.dart';

import '../core/Errors/failure.dart';
import '../models/track.dart';
import 'package:http/http.dart' as http;

abstract class TracksRepository {
  Future<Either<Failure, List<Track>>> getTracks();
  Future<Either<Failure, Track>> getTrackDetails(int trackId);
  Future<Either<Failure, Lyric>> getLyric(int trackId);
}

class TracksRepositoryImpl implements TracksRepository {
  final http.Client client;
  TracksRepositoryImpl({
    required this.client,
  });

  static const URL =
      'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7';
  @override
  Future<Either<Failure, List<Track>>> getTracks() async {
    try {
      final http.Response response = await client.get(Uri.parse(URL));
      final body = response.body;
      final decoded = json.decode(body);
      final tracks = trackFromJson(decoded['message']['body']['track_list']);
      // print(tracks);

      return Right(tracks);
    } catch (ex) {
      print(ex);
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, Track>> getTrackDetails(int trackId) async {
    final url =
        'https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackId&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7';

    try {
      final http.Response response = await client.get(Uri.parse(url));
      final body = response.body;
      final decoded = json.decode(body);

      final track = Track.fromJson(decoded['message']['body']);

      return Right(track);
    } catch (ex) {
      print(ex);
    }

    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, Lyric>> getLyric(int trackId) async {
    final url =
        'https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7';

    try {
      final http.Response response = await client.get(Uri.parse(url));
      final body = response.body;
      final decoded = json.decode(body);

      final lyric = Lyric.fromJson(decoded['message']['body']['lyrics']);
      print(lyric);

      return Right(lyric);
    } catch (ex) {
      print(ex);
    }

    return Left(ServerFailure());
  }
}
