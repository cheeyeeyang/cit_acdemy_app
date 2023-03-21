import 'dart:convert';

import 'package:cit_academy_app/models/get_user_model.dart';
import 'package:cit_academy_app/models/land_model.dart';
import 'package:cit_academy_app/repository/repository.dart';
import 'package:get/get.dart';
class LandState extends GetxController {
  Repository repository = Repository();
  List<ProvinceModel> allProvinces = [];
  List<DistrictsModel> allDistricts = [];
  List<VillagesModel> allVillages = [];
  List<PositionModel> allPositions = [];
  List<SelectRoleModel> allselectroles = [];

  ProvinceModel? provinceSelect;
  DistrictsModel? districtSelect;
  VillagesModel? villageSelect;
  PositionModel? positionSelect;
  SelectRoleModel? selectRoleSelect;

  //for check when fecth data from database
  bool checkDataAllLand = false;

  //
  getAllLand() {
    getAllProvice();
    getPosition();
    getRole();
    update();
  }

  getPosition() async {
    allPositions = [];
    update();
    var res = await repository.get(
        url: repository.url + repository.getposition, auth: true);
    if (res.statusCode == 200) {
      for (var element in jsonDecode(res.body)['data']) {
        allPositions.add(PositionModel.fromMap(element));
      }
      update();
    } else {
      print('get position failed');
    }
  }

  updateDropDownPosition(PositionModel? postionModel) async {
    positionSelect = postionModel;
    update();
  }

  getRole() async {
    allselectroles = [];
    update();
    var res =
        await repository.get(url: repository.url + repository.role, auth: true);
    if (res.statusCode == 200) {
      for (var element in jsonDecode(res.body)['data']) {
        allselectroles.add(SelectRoleModel.fromMap(element));
      }
      update();
    } else {
      print('get roles failed');
    }
  }

  updateDropDownRole(SelectRoleModel? selectRoleModel) async {
    selectRoleSelect = selectRoleModel;
    update();
  }

  getAllProvice() async {
    allProvinces = [];
    var res = await repository.get(url: repository.url + repository.province);

    if (res.statusCode == 200) {
      for (var element in jsonDecode(res.body)['data']) {
        allProvinces.add(ProvinceModel.fromMap(element));
      }
    }
    update();
  }

  getAllDistrict(ProvinceModel provinceModel) async {
    allDistricts = [];
    var res = await repository.get(
        url:
            repository.url + repository.district + provinceModel.id.toString());

    if (res.statusCode == 200) {
      for (var element in jsonDecode(res.body)['data']) {
        allDistricts.add(DistrictsModel.fromMap(element));
      }
    }
    update();
    //getAllVillages();
  }

  getAllVillages(DistrictsModel districtsModel) async {
    allVillages = [];
    var res = await repository.get(
        url:
            repository.url + repository.village + districtsModel.id.toString());
    if (res.statusCode == 200) {
      for (var element in jsonDecode(res.body)['data']) {
        allVillages.add(VillagesModel.fromMap(element));
      }
    }
    update();
  }

  updateDropDownProvince(ProvinceModel? provinceModel) async {
    provinceSelect = provinceModel;
    districtSelect = null;
    villageSelect = null;
    update();
    if (provinceModel != null) {
      await getAllDistrict(provinceModel);
    }
  }

  updateDropDownDistrict(DistrictsModel? districtsModel) async {
    districtSelect = districtsModel;
    villageSelect = null;

    update();
    if (districtsModel != null) {
      await getAllVillages(districtsModel);
    }
  }

  updateDropDownVillage(VillagesModel? villagesModel) {
    villageSelect = villagesModel;
    update();
  }

  clearData() async {
    allDistricts = [];
    allVillages = [];
    provinceSelect = null;
    districtSelect = null;
    villageSelect = null;

    update();
  }

  setValueProDisVil(
      {ProvinceModel? provinceModel,
      DistrictsModel? districtsModel,
      VillagesModel? villagesModel}) async {
    checkDataAllLand = false;
    update();
    await getAllProvice();
    provinceSelect = provinceModel;
    districtSelect = districtsModel;
    villageSelect = villagesModel;

    if (provinceModel != null) {
      await getAllDistrict(provinceModel);

      if (districtsModel != null) {
        await getAllVillages(districtsModel);
        if (villagesModel != null) {
          villageSelect = villagesModel;
        }
      }
    }
    for (var element in allProvinces) {
      if (element.id == provinceModel?.id) {
        provinceSelect = element;
        break;
      }
    }
    for (var element in allDistricts) {
      if (element.id == districtsModel?.id) {
        districtSelect = element;
        break;
      }
    }
    for (var element in allVillages) {
      if (element.id == villagesModel?.id) {
        villageSelect = element;
        break;
      }
    }
    checkDataAllLand = true;
    update();
  }

  @override
  void onInit() {
    getAllLand();
    super.onInit();
  }

  setAddress(GetUserModel? userModel) async {
    await getAllLand();
    var getprovince = allProvinces.firstWhereOrNull(
      (element) => element.id == userModel?.proId,
    );
    if (getprovince != null) {
      updateDropDownProvince(getprovince);
    }
     var getdistrict = allDistricts.firstWhereOrNull(
      (element) => element.id == userModel?.disId,
    );
    if (getdistrict != null) {
      updateDropDownDistrict(getdistrict);
    }
     var getvillage = allVillages.firstWhereOrNull(
      (element) => element.id == userModel?.villId,
    );
    if (getvillage != null) {
      updateDropDownVillage(getvillage);
    }
  }
}
