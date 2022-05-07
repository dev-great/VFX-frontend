class Subscription {
  int? id;
  int? user;
  String? referenceCode;
  String? paystackAccessCode;
  String? paymentFor;
  String? amount;
  String? date;
  bool? active;
  int? duration;

  Subscription(
      {this.id,
      this.user,
      this.referenceCode,
      this.paystackAccessCode,
      this.paymentFor,
      this.amount,
      this.date,
      this.active,
      this.duration});

  Subscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    referenceCode = json['reference_code'];
    paystackAccessCode = json['paystack_access_code'];
    paymentFor = json['payment_for'];
    amount = json['amount'];
    date = json['date'];
    active = json['active'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user'] = user;
    data['reference_code'] = referenceCode;
    data['paystack_access_code'] = paystackAccessCode;
    data['payment_for'] = paymentFor;
    data['amount'] = amount;
    data['date'] = date;
    data['active'] = active;
    data['duration'] = duration;
    return data;
  }
}
