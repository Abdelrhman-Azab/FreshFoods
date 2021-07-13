import 'package:flutter/material.dart';

class UserInformations {
  String email;
  String name;
  String id;
  UserInformations({required this.email, required this.name, required this.id});

  Map<String, String> toMap() {
    return {"email": email, "name": name, "id": id};
  }
}

late UserInformations user;
