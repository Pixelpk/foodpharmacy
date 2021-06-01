// class SignUp {
//   SignUp({
//     this.status,
//     this.response,
//   });
//
//   String status;
//   Response response;
//
//   String name;
//   String email;
//   String password;
//   String phone;
//   String city;
//
//   factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
//         status: json["status"],
//         response: Response.fromJson(json["response"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": name == null ? null : name,
//         "email": email == null ? null : email,
//         "password": password == null ? null : password,
//         "phone": phone == null ? null : phone,
//         "city": city == null ? null : city,
//       };
// }
//
// class Response {
//   Response({
//     this.message,
//     this.user,
//   });
//
//   String message;
//   User user;
//
//   factory Response.fromJson(Map<String, dynamic> json) => Response(
//         message: json["message"],
//         user: User.fromJson(json["User"] == null ? null : json["User"]),
//       );
// }
//
// class User {
//   User({
//     this.name,
//     this.email,
//     this.phone,
//     this.city,
//     this.updatedAt,
//     this.createdAt,
//     this.id,
//   });
//
//   String name;
//   String email;
//   String phone;
//   String city;
//   DateTime updatedAt;
//   DateTime createdAt;
//   int id;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//         name: json["name"] == null ? null : json["name"],
//         email: json["email"] == null ? null : json["email"],
//         phone: json["phone"] == null ? null : json["phone"],
//         city: json["city"] == null ? null : json["city"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         createdAt: DateTime.parse(json["created_at"]),
//         id: json["id"] == null ? null : json["id"],
//       );
// }
class SignUp {
  SignUp({
    this.status,
    this.response,
  });

  String status;
  Response response;

  String name;
  String email;
  String password;
  String phone;
  String city;

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        status: json["status"] == null ? null : json["status"],
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "phone": phone == null ? null : phone,
        "city": city == null ? null : city,
      };
}

class Response {
  Response({
    this.message,
    this.user,
  });

  String message;
  User user;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        message: json["message"] == null ? null : json["message"],
        user: json["User"] == null ? null : User.fromJson(json["User"]),
      );
}

class User {
  User({
    this.name,
    this.email,
    this.phone,
    this.city,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String name;
  String email;
  String phone;
  String city;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        city: json["city"] == null ? null : json["city"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"] == null ? null : json["id"],
      );
}
