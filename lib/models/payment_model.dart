class PaymentModel {
  int? id;
  int? month;
  String? code;
  int? year;
  String? des;
  String? note;
  int? amount;
  int? userId;
  String? createdAt;

  PaymentModel(
      {this.id,
      this.month,
      this.code,
      this.year,
      this.des,
      this.note,
      this.amount,
      this.userId,
      this.createdAt});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    month = json['month'];
    code = json['code'];
    year = json['year'];
    des = json['des'];
    note = json['note'];
    amount = json['amount'];
    userId = json['user_id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['month'] = month;
    data['code'] = code;
    data['year'] = year;
    data['des'] = des;
    data['note'] = note;
    data['amount'] = amount;
    data['user_id'] = userId;
    data['createdAt'] = createdAt;
    return data;
  }
}