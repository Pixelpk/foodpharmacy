class Login {
  Login({
    this.status,
    this.response,
    this.user,
  });

  String status;
  Response response;
  User user;

  String email;
  String password;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"] == null ? null : json["status"],
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "password": password == null ? null : password,
      };
}

class Response {
  Response({
    this.message,
    this.jwt,
  });

  String message;
  String jwt;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        message: json["message"] == null ? null : json["message"],
        jwt: json["jwt"] == null ? null : json["jwt"],
      );
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.city,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String name;
  String email;
  String phone;
  String city;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        city: json["city"] == null ? null : json["city"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}
