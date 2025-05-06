import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:whatsappclone/Common/Utils/Coloors.dart';
import 'package:uuid/uuid.dart';
import 'package:whatsappclone/feature/home/home_screen.dart';
import 'package:whatsappclone/model/user.dart';

import '../../../Common/Utils/widgets/custom_elevated_button/custom_elevated_button.dart';
import '../../../resouces/services.dart';
import '../widgets/custom_text-field.dart';
import 'package:hive_flutter/hive_flutter.dart';


class Signup extends StatefulWidget {
  String phone;
  Signup({super.key, required this.phone});

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

  @override
  void initState() {
    // TODO: implement initState
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
    // TODO: implement dispose
    super.dispose();
    _username.dispose();
    _first.dispose();
    _last.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 450,
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text(
                "Please enter your user details below.",
                style: TextStyle(color: Colors.blueGrey),
              ),
              SizedBox(height: 10,),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Coloors.greyDark,
                    child: Icon(CupertinoIcons.person, color: Colors.white,),
                  ),
                  Positioned(
                      bottom: -5,
                      right: -9,
                      child: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.add_a_photo),
                        color: Coloors.greenDark,
                      )
                  ),
                ],
              ),
              SizedBox(height: 20,),
              CustomTextField(
                hintText: "Username",
                controller: _username,
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: "First Name",
                      controller: _first,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomTextField(
                      hintText: "Last Name",
                      controller: _last,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              CustomTextField(
                hintText: "Email Address",
                keyboardType: TextInputType.emailAddress,
                controller: _email,
              ),
              SizedBox(height: 20,),
              CustomTextField(
                hintText: "Password",
                obscured: true,
                controller: _password,
              ),
              SizedBox(height: 20,),
              CustomTextField(
                hintText: "Confirm Password",
                obscured: true,
                controller: _confirm,
              ),
            ],
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

  void _registerUser()async{
    String uid = "";
    Uuid uuid = Uuid();
    uid = uuid.v1();
    var box = Hive.box<UserModel>("user");
    UserModel userModel = UserModel(
        uid: uid,
        username: _username.text,
        first: _first.text,
        last: _last.text,
        email: _email.text,
        phone: widget.phone,
        password: _password.text,
        time: ""
    );
    final response = await Services.registerUser(user: userModel);

    if (response['status']=="success"){
      box.put("current", userModel);
      Get.offAll(() => HomeScreen(), transition: Transition.rightToLeft);
      Get.snackbar("Success", response['message']);
    } else {
      Get.snackbar("Error", response['message']);
    }
  }
}
