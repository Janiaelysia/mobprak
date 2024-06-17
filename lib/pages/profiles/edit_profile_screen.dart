import 'dart:io';

import 'package:activewell_new/pages/profiles/profile_image_picker.dart';
import 'package:activewell_new/services/user_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  File? _selectedImage;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String _fname = '';
  String _lname = '';

  void _updateProfile() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    final userData = ref.watch(userProvider);
    dynamic imageUrl;
    try {
      setState(() {
        _isLoading = true;
      });
      final storageRef =
          FirebaseStorage.instance.ref().child('users/${userData.uid}.jpg');

      if (_selectedImage == null) {
        imageUrl = userData.imageUrl;
      } else {
        await storageRef.putFile(_selectedImage!);
        imageUrl = await storageRef.getDownloadURL();
      }
      ref.watch(userProvider.notifier).setUser(
          uid: userData.uid,
          fname: _fname,
          lname: _lname,
          email: userData.email,
          imageUrl: imageUrl);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userData.uid)
          .update({
        'fname': _fname,
        'lname': _lname,
        'image_url': imageUrl,
      });
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          content: const Text('Update Success!'),
          showCloseIcon: true,
        ),
      );
      setState(() {
        _isLoading = false;
      });
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          content: const Text('Update Failed!'),
          showCloseIcon: true,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 237, 86, 59),
        title: const Center(
          child: Text(
            "Edit Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileImagePicker(onSelectImage: (image) {
                  _selectedImage = image;
                }),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: userData.email,
                  readOnly: true,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 12),
                      child: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: Text(
                    "First Name",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: userData.fname,
                  onSaved: (value) {
                    _fname = value!;
                  },
                  validator: (value) {
                    if (value == null || value.trim() == '') {
                      return 'nama tidak boleh kosong!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.edit_outlined),
                    ),
                    errorStyle: const TextStyle(color: Colors.red),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 12),
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: Text(
                    "Last Name",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: userData.lname,
                  validator: (value) {
                    if (value == null || value.trim() == '') {
                      return 'nama tidak boleh kosong!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _lname = value!;
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.edit_outlined),
                    ),
                    errorStyle: const TextStyle(color: Colors.red),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 12),
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "CANCEL",
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 2,
                                color: Color.fromARGB(255, 237, 86, 59),
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _updateProfile,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 237, 86, 59),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              "SAVE",
                              style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
