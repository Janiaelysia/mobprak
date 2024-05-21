import 'package:flutter/material.dart';

class VideoModel extends ChangeNotifier {
  String title;
  String description;
  String videoUrl;
  String thumbnailUrl;

  VideoModel({
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.thumbnailUrl,
  });

  toJson() => {
        'title': title,
        'description': description,
        'videoUrl': videoUrl,
        'thumbnailUrl': thumbnailUrl,
      };

  @override
  String toString() {
    return 'VideoModel(title: $title, description: $description, videoUrl: $videoUrl, thumbnailUrl: $thumbnailUrl)';
  }
}
