import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      username: json['username'] as String,
      first: json['first'] as String,
      last: json['last'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      time: json['time'] as String,
    );
  }

  Map<String, dynamic> toJsonAdd() {
    return {
      "uid": uid,
      "username": username,
      "first": first,
      "last": last,
      "email": email,
      "password": password,
      "phone": phone,
      "time": time,
    };
  }
}
