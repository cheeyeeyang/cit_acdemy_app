class ExpenseModel {
  int? id;
  int? amount;
  String? des;
  int? userId;
  String? createdAt;
  String? updatedAt;

  ExpenseModel(
      {this.id,
      this.amount,
      this.des,
      this.userId,
      this.createdAt,
      this.updatedAt});

  ExpenseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    des = json['des'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['amount'] = amount;
    data['des'] = des;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}