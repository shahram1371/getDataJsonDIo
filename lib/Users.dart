// ignore_for_file: file_names

class User {
  User({required this.data});
  Data data;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(data: Data.fromJson(json["data"]));

  Map<String, dynamic> tojson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data(
      {required this.id,
      required this.avatar,
      required this.email,
      required this.firstName,
      required this.lastName});
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      id: json["id"],
      avatar: json["avatar"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
