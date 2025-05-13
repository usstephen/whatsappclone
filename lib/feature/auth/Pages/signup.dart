import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import 'package:whatsappclone/Common/Utils/Coloors.dart';
import 'package:whatsappclone/data/model/response/response.dart';
import 'package:whatsappclone/data/services/user/user_service.dart';
import 'package:whatsappclone/feature/home/home_screen.dart';
import 'package:whatsappclone/data/model/user/user.dart';


import '../../../Common/Utils/widgets/custom_elevated_button/custom_elevated_button.dart';
import '../../../resouces/service.dart';
import '../widgets/custom_text-field.dart';

class Signup extends StatefulWidget {
  final String phone;

  const Signup({super.key, required this.phone});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late TextEditingController _username;
  late TextEditingController _first;
  late TextEditingController _last;
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _confirm;
  File? _image;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _first = TextEditingController();
    _last = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirm = TextEditingController();
  }

  @override
  void dispose() {
    _username.dispose();
    _first.dispose();
    _last.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 450,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Please enter your user details below.",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Coloors.greyDark,
                      backgroundImage: _image != null ? FileImage(_image!) : null,
                      child: _image == null
                          ? const Icon(CupertinoIcons.person, color: Colors.white)
                          : null,
                    ),
                    Positioned(
                      bottom: -5,
                      right: -9,
                      child: IconButton(
                        onPressed: _pickImage,
                        icon: const Icon(Icons.add_a_photo),
                        color: Coloors.greenDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(hintText: "Username", controller: _username),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                          hintText: "First Name", controller: _first),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                          hintText: "Last Name", controller: _last),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: "Email Address",
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: _password,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: _confirm,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: _registerUser,
        text: 'Next',
        buttonWidth: 90,
      ),
    );
  }

  void _registerUser() async {
    if (_username.text.isEmpty ||
        _first.text.isEmpty ||
        _last.text.isEmpty ||
        _email.text.isEmpty ||
        _password.text.isEmpty ||
        _confirm.text.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields.");
      return;
    }

    if (_password.text != _confirm.text) {
      Get.snackbar("Error", "Passwords do not match.");
      return;
    }

    UserModel _user = UserModel(
      uid: '',
      username: _username.text.trim(),
      first: _first.text.trim(),
      last: _last.text.trim(),
      email: _email.text.trim(),
      phone: widget.phone,
      password: _password.text,
      time: DateTime.now().toIso8601String(),
    );

    final ApiResponse response = await UserService.registerUser(_user);
    print('Response:${response.toJson()}');
    if(response.success == true){
      Get.snackbar("Success", "User created successfully");
    } else {
      Get.snackbar("Error", response.message!);
    }
  }
}