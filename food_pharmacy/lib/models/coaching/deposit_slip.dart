class DepositSlip {
  DepositSlip({
    this.status,
    this.response,
  });

  String status;
  String response;

  String email;
  String name;
  String amount;
  String package;
  String userId;
  String paymentSlip;

  factory DepositSlip.fromJson(Map<String, dynamic> json) => DepositSlip(
        status: json["status"] == null ? null : json["status"],
        response: json["response"] == null ? null : json["response"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "name": name == null ? null : name,
        "amount": amount == null ? null : amount,
        "package": package == null ? null : package,
        "user_id": userId == null ? null : paymentSlip,
        "payment_slip": paymentSlip == null ? null : paymentSlip,
      };
}
