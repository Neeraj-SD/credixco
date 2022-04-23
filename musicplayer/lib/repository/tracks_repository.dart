import 'dart:convert';
import 'dart:io';

import '../models/track.dart';
import 'package:http/http.dart' as http;

abstract class TracksRepository {
  Future<List<Track>> getTracks();
}

class TracksRepositoryImpl implements TracksRepository {
  final http.Client client;
  TracksRepositoryImpl({
    required this.client,
  });

  static const URL =
      'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7';
  @override
  Future<List<Track>> getTracks() async {
    try {
      final http.Response response = await client.get(Uri.parse(URL));
      final body = response.body;
      final decoded = json.decode(body);
      final tracks = trackFromJson(decoded['message']['body']['track_list']);
      // print(tracks);

      return tracks;
    } catch (ex) {
      print(ex);
    }

    return [];
  }
}
