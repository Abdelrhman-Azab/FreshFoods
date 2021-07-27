class UserInformations {
  String email;
  String name;
  String id;
  UserInformations({required this.email, required this.name, required this.id});

  Map<String, dynamic> toMap() {
    return {"email": email, "name": name, "id": id, "cart": []};
  }
}

late UserInformations user;
