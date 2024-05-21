import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/video_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteVideoProvider extends StateNotifier<List<VideoModel>> {
  final _userData = FirebaseFirestore.instance;
  final User? _currentUser = FirebaseAuth.instance.currentUser;
  User? get currentUser => _currentUser;

  FavoriteVideoProvider()
      : super([
          VideoModel(title: "", description: "", videoUrl: "", thumbnailUrl: "")
        ]);

  Future<void> addFavoriteVideos(BuildContext context, title,
      String description, String videoUrl, String thumbnailUrl) async {
    if (_currentUser != null) {
      print("ini add");
      print(title);
      print(_currentUser.uid);

      // Check for duplicates
      final duplicateCheck = await _userData
          .collection("users")
          .doc(_currentUser!.uid)
          .collection('videos')
          .where('title', isEqualTo: title)
          .get();

      if (duplicateCheck.docs.isNotEmpty) {
        // Show snackbar for duplicate video
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('A video with the same title already exists.'),
          ),
        );
        return; // Stop execution since it's a duplicate
      }

      // Add new video if no duplicates found
      await _userData.collection("users").doc(_currentUser.uid)
        ..collection('videos').add({
          'title': title,
          'description': description,
          'videoUrl': videoUrl,
          'thumbnailUrl': thumbnailUrl,
        });
    }
    ;
  }

  Future<List<VideoModel>> getFavoriteVideos() async {
    if (_currentUser != null) {
      try {
        final snapshot = await _userData
            .collection("users")
            .doc(_currentUser!.uid)
            .collection('videos')
            .get();

        final videos = snapshot.docs.map((doc) {
          final data = doc.data();
          return VideoModel(
            title: data['title'] as String,
            description: data['description'] as String,
            videoUrl: data['videoUrl'] as String,
            thumbnailUrl: data['thumbnailUrl'] as String,
          );
        }).toList();

        print("INI GET");
        print(_currentUser.uid);
        print(videos);
        state = videos;
        return videos;
      } catch (e) {
        print('error mengambil data: $e');
        return [];
      }
    } else {
      return [];
    }
  }

  Future<void> deleteFavoriteVideos(BuildContext context, String title) async {
    if (_currentUser != null) {
      try {
        // Find the document with the matching title
        final querySnapshot = await _userData
            .collection("users")
            .doc(_currentUser!.uid)
            .collection('videos')
            .where('title', isEqualTo: title)
            .get();

        for (var doc in querySnapshot.docs) {
          // Delete each document that matches thes title
          await _userData
              .collection("users")
              .doc(_currentUser!.uid)
              .collection('videos')
              .doc(doc.id)
              .delete();
        }

        // Update the state to remove the deleted recipe(s)
        state = state.where((video) => video.title != title).toList();
        print("Video(s) deleted with title: $title");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Successfully deleted $title'),
          ),
        );
      } catch (e) {
        print('Error deleting video: $e');
      }
    }
  }
}

final videoProvider =
    StateNotifierProvider<FavoriteVideoProvider, List<VideoModel>>((ref) {
  return FavoriteVideoProvider();
});
