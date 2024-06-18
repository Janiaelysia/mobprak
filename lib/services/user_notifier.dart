import 'package:activewell_new/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier()
      : super(
          UserModel(
            uid: '',
            fname: '',
            lname: '',
            email: '',
          ),
        );

  void setUser(
      {required String uid,
      required String fname,
      required String lname,
      required String email,
      String? imageUrl}) {
    state = UserModel(
      uid: uid,
      fname: fname,
      lname: lname,
      email: email,
      imageUrl: imageUrl,
    );
  }

  void clear() {
    state = UserModel(
      uid: '',
      fname: '',
      lname: '',
      email: '',
    );
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) {
  return UserNotifier();
});
