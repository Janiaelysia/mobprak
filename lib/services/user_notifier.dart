import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<Map<String, String>> {
  UserNotifier() : super({});

  String? get imageUrl => state['image_url']; // Define the imageUrl getter

  void setUser(
      {required String uid,
      required String fname,
      required String lname,
      required String email,
      String? imageUrl}) {
    state = {
      'uid': uid,
      'fname': fname,
      'lname': lname,
      'email': email,
      'image_url': imageUrl ?? "",
    };
  }

  void clear() {
    state = {};
  }
}

final userProvider =
    StateNotifierProvider<UserNotifier, Map<String, String>>((ref) {
  return UserNotifier();
});
