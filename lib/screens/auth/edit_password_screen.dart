import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _isOldPasswordSecure = true;
  bool _isNewPasswordSecure = true;
  bool _isConfirmPasswordSecure = true;

  void _toggleOldPasswordVisibility() {
    setState(() {
      _isOldPasswordSecure = !_isOldPasswordSecure;
    });
  }

  void _toggleNewPasswordVisibility() {
    setState(() {
      _isNewPasswordSecure = !_isNewPasswordSecure;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordSecure = !_isConfirmPasswordSecure;
    });
  }

  Future<void> _changePassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Reauthenticate the user
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: _oldPasswordController.text,
        );
        await user.reauthenticateWithCredential(credential);

        // Update the password
        await user.updatePassword(_newPasswordController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password updated successfully!')),
        );
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update password: ${e.message}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 237, 86, 59),
        title: const Center(
          child: Text(
            "Edit Password",
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
                _buildLabel('Password Lama'),
                _buildOldPasswordField(),
                SizedBox(height: 10),
                _buildLabel('Password Baru'),
                _buildNewPasswordField(),
                SizedBox(height: 10),
                _buildLabel('Konfirmasi Password Baru'),
                _buildConfirmPasswordField(),
                SizedBox(height: 40),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _buildButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildOldPasswordField() {
    return TextFormField(
      controller: _oldPasswordController,
      obscureText: _isOldPasswordSecure,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Password lama tidak boleh kosong!';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _isOldPasswordSecure ? Icons.visibility_off : Icons.visibility,
            color: Colors.black,
          ),
          onPressed: _toggleOldPasswordVisibility,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 12),
          child: Icon(Icons.lock, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildNewPasswordField() {
    return TextFormField(
      controller: _newPasswordController,
      obscureText: _isNewPasswordSecure,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Password baru tidak boleh kosong!';
        }
        if (value.length < 6) {
          return 'Password baru harus minimal 6 karakter!';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _isNewPasswordSecure ? Icons.visibility_off : Icons.visibility,
            color: Colors.black,
          ),
          onPressed: _toggleNewPasswordVisibility,
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
          child: Icon(Icons.lock, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: _isConfirmPasswordSecure,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Konfirmasi password tidak boleh kosong!';
        }
        if (value != _newPasswordController.text) {
          return 'Password tidak cocok!';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _isConfirmPasswordSecure ? Icons.visibility_off : Icons.visibility,
            color: Colors.black,
          ),
          onPressed: _toggleConfirmPasswordVisibility,
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
          child: Icon(Icons.lock, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
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
            padding: const EdgeInsets.symmetric(horizontal: 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _changePassword,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 237, 86, 59),
            padding: const EdgeInsets.symmetric(horizontal: 50),
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
    );
  }
}
