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

  static const URL = '';
  @override
  Future<List<Track>> getTracks() async {
    try {
      final http.Response response = await client.get(Uri.parse(URL));
      final body = response.body;
      return [];
      print(body);
    } catch (ex) {
      print(ex);
    }

    return [];
  }
}
