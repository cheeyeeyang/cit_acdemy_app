class SelectRoleModel {
  int? id;
  String? name;
  SelectRoleModel({this.id, this.name});
  SelectRoleModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
class PositionModel {
  int? id;
  String? name;
  PositionModel({this.id, this.name});
  PositionModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
class ProvinceModel {
  int? id;
  String? name;
  ProvinceModel({this.id, this.name});
  ProvinceModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}

class DistrictsModel {
  int? id;
  int? proId;
  String? name;
  DistrictsModel({
    this.id,
    this.proId,
    this.name,
  });
  DistrictsModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    proId = data['pro_id'];
    name = data['name'];
  }
}

class VillagesModel {
  int? id;
  int? proId;
  int? disId;
  String? name;
  VillagesModel({
    this.id,
    this.proId,
    this.disId,
    this.name,
  });
  VillagesModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    proId = data['pro_id'];
    disId = data['dis_id'];
    name = data['name'];
  }
}
