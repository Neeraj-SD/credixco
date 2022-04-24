// To parse this JSON data, do
//
//     final lyric = lyricFromJson(jsonString);

import 'dart:convert';

Lyric lyricFromJson(String str) => Lyric.fromJson(json.decode(str));

String lyricToJson(Lyric data) => json.encode(data.toJson());

class Lyric {
  Lyric({
    required this.lyricsId,
    required this.explicit,
    required this.lyricsBody,
    required this.scriptTrackingUrl,
    required this.pixelTrackingUrl,
    required this.lyricsCopyright,
    required this.updatedTime,
  });

  int lyricsId;
  int explicit;
  String lyricsBody;
  String scriptTrackingUrl;
  String pixelTrackingUrl;
  String lyricsCopyright;
  DateTime updatedTime;

  factory Lyric.fromJson(Map<String, dynamic> json) => Lyric(
        lyricsId: json["lyrics_id"],
        explicit: json["explicit"],
        lyricsBody: json["lyrics_body"],
        scriptTrackingUrl: json["script_tracking_url"],
        pixelTrackingUrl: json["pixel_tracking_url"],
        lyricsCopyright: json["lyrics_copyright"],
        updatedTime: DateTime.parse(json["updated_time"]),
      );

  Map<String, dynamic> toJson() => {
        "lyrics_id": lyricsId,
        "explicit": explicit,
        "lyrics_body": lyricsBody,
        "script_tracking_url": scriptTrackingUrl,
        "pixel_tracking_url": pixelTrackingUrl,
        "lyrics_copyright": lyricsCopyright,
        "updated_time": updatedTime.toIso8601String(),
      };
}
