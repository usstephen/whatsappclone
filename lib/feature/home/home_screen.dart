import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:whatsappclone/data/model/user/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserModel user;
  var box = Hive.box<UserModel>("user");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = box.get("current")!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(user.email)
      ),
    );
  }
}