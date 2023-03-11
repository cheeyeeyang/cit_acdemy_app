class BillModel {
  int? id;
  String? code;
  int? userId;
  int? month;
  int? year;
  String? des;
  int? amount;
  String? note;
  String? createdAt;
  String? updatedAt;
  String? firstname;
  String? lastname;
  String? phone;

  BillModel(
      {this.id,
      this.code,
      this.userId,
      this.month,
      this.year,
      this.des,
      this.amount,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.firstname,
      this.lastname,
      this.phone});

  BillModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    userId = json['user_id'];
    month = json['month'];
    year = json['year'];
    des = json['des'];
    amount = json['amount'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['phone'];
  }
}