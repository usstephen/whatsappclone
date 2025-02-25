class UserModel {
  String uid;
  String username;
  String first;
  String last;
  String email;
  String phone;
  String password;

  UserModel({
    required this.uid,
    required this.username,
    required this.first,
    required this.last,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      username: json['username'],
      first: json['first'],
      last: json['last'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'first': first,
      'last': last,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  UserModel copyWith({
    String? uid,
    String? username,
    String? first,
    String? last,
    String? email,
    String? phone,
    String? password,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      first: first ?? this.first,
      last: last ?? this.last,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }
}
