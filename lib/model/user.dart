import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';


@HiveType(typeId: 0)
class UserModel{
  @HiveField(0)
  String uid;
  @HiveField(1)
  String username;
  @HiveField(2)
  String first;
  @HiveField(3)
  String last;
  @HiveField(4)
  String email;
  @HiveField(5)
  String phone;
  @HiveField(6)
  String password;
  @HiveField(7)
  String time;

  UserModel({
    required this.uid,
    required this.username,
    required this.first,
    required this.last,
    required this.email,
    required this.phone,
    required this.password,
    required this.time,
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        uid: json['uid'],
        username: json['username'],
        first: json['first'],
        last: json['last'],
        email: json['email'],
        phone: json['phone'],
        password: json['password'],
        time: json['time']
    );
  }

  Map<String, dynamic> toJsonAdd() {
    return {
      "uid":uid,
      "username" : username,
      "first" : first,
      "last" : last,
      "email" : email,
      "password" : password,
      "phone":phone,
      "time":time,
    };
  }
}