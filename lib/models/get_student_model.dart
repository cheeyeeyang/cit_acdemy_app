class GetStudentModel {
  int? id;
  String? firstname;
  String? lastname;
  String? bod;
  String? phone;
  String? size;
  int? number;
  String? address;
  int? villId;
  int? disId;
  int? proId;
  int? positionId;
  int? roleId;
  String? note;
  String? status;
  String? createdAt;
  String? updatedAt;

  GetStudentModel(
      {this.id,
      this.firstname,
      this.lastname,
      this.bod,
      this.phone,
      this.size,
      this.number,
      this.address,
      this.villId,
      this.disId,
      this.proId,
      this.positionId,
      this.roleId,
      this.note,
      this.status,
      this.createdAt,
      this.updatedAt});

  GetStudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    bod = json['bod'];
    phone = json['phone'];
    size = json['size'];
    number = json['number'];
    address = json['address'];
    villId = json['vill_id'];
    disId = json['dis_id'];
    proId = json['pro_id'];
    positionId = json['position_id'];
    roleId = json['role_id'];
    note = json['note'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['bod'] = this.bod;
    data['phone'] = this.phone;
    data['size'] = this.size;
    data['number'] = this.number;
    data['address'] = this.address;
    data['vill_id'] = this.villId;
    data['dis_id'] = this.disId;
    data['pro_id'] = this.proId;
    data['position_id'] = this.positionId;
    data['role_id'] = this.roleId;
    data['note'] = this.note;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}