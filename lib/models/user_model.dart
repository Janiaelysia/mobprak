class UserModel {
  final String uid;
  final String fname;
  final String lname;
  final String email;
  final String? imageUrl;

  UserModel({
    required this.uid,
    required this.fname,
    required this.lname,
    required this.email,
    this.imageUrl,
  });

  UserModel copyWith({
    String? uid,
    String? fname,
    String? lname,
    String? email,
    String? imageUrl,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      fname: json['name'],
      email: json['email'],
      lname: json['lname'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        'fname': fname,
        'email': email,
        'lname': lname,
        'imageUrl': imageUrl,
      };
}
