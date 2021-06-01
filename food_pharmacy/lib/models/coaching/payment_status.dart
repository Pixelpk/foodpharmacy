class PaymentStatus {
  PaymentStatus({
    this.status,
    this.response,
  });

  String status;
  Response response;

  factory PaymentStatus.fromJson(Map<String, dynamic> json) => PaymentStatus(
        status: json["status"] == null ? null : json["status"],
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
      );
}

class Response {
  Response({
    this.message,
    this.status,
  });

  String message;
  String status;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        message: json["message"] == null ? null : json["message"],
        status: json["Status"] == null ? null : json["Status"],
      );
}
