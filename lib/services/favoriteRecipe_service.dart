import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/recipe_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteRecipeProvider extends StateNotifier<List<RecipeModel>> {
  final _userData = FirebaseFirestore.instance;
  User? get currentUser => FirebaseAuth.instance.currentUser;

  FavoriteRecipeProvider() : super([RecipeModel(title: "", imgUrl: "")]);

  Future<void> addFavoriteRecipes(
      BuildContext context, title, String imgUrl) async {
    if (currentUser != null) {
      print("Adding favorite recipe:");
      print("Title: $title");
      print("User UID: ${currentUser!.uid}");

// Check for duplicates
      final duplicateCheck = await _userData
          .collection("users")
          .doc(currentUser!.uid)
          .collection('recipes')
          .where('title', isEqualTo: title)
          .get();

      if (duplicateCheck.docs.isNotEmpty) {
        // Show snackbar for duplicate video
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('A recipe with the same title already exists.'),
          ),
        );
        return; // Stop execution since it's a duplicate
      }

      await _userData.collection("users").doc(currentUser!.uid)
        ..collection('recipes').add({
          'title': title,
          'imgUrl': imgUrl,
        });
    }
    ;
  }

  Future<List<RecipeModel>> getFavoriteRecipes() async {
    if (currentUser != null) {
      try {
        final snapshot = await _userData
            .collection("users")
            .doc(currentUser!.uid)
            .collection('recipes')
            .get();

        final recipes = snapshot.docs.map((doc) {
          final data = doc.data();
          return RecipeModel(
            title: data['title'] as String,
            imgUrl: data['imgUrl'] as String,
          );
        }).toList();

        print("Fetching favorite recipes:");
        print("User UID: ${currentUser!.uid}");
        print(recipes);

        state = recipes;
        return recipes;
      } catch (e) {
        print('error mengambil data: $e');
        return [];
      }
    } else {
      return [];
    }
  }

  Future<void> deleteFavoriteRecipes(BuildContext context, title) async {
    if (currentUser != null) {
      try {
        // Find the document with the matching title
        final querySnapshot = await _userData
            .collection("users")
            .doc(currentUser!.uid)
            .collection('recipes')
            .where('title', isEqualTo: title)
            .get();

        for (var doc in querySnapshot.docs) {
          // Delete each document that matches the title
          await _userData
              .collection("users")
              .doc(currentUser!.uid)
              .collection('recipes')
              .doc(doc.id)
              .delete();
        }

        // Update the state to remove the deleted recipe(s)
        state = state.where((recipe) => recipe.title != title).toList();
        print("Recipe(s) deleted with title: $title");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Successfully deleted $title'),
          ),
        );
      } catch (e) {
        print('Error deleting recipe: $e');
      }
    }
  }
}

final recipeProvider =
    StateNotifierProvider<FavoriteRecipeProvider, List<RecipeModel>>((ref) {
  return FavoriteRecipeProvider();
});
