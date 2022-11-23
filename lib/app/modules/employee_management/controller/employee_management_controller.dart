import 'package:emplyoee_selection/app/modules/employee_management/connect/employee_management_connect.dart';
import 'package:emplyoee_selection/app/modules/employee_management/model/employee_list_entity.dart';
import 'package:get/get.dart';

import '../../../model/base_model.dart';

class EmployeeManagementController extends GetxController {
  EmployeeManagementProvider provider = Get.find<EmployeeManagementProvider>();
  Rx<BaseResponse<List<EmployeeListEntity>>> employees =
      new Rx<BaseResponse<List<EmployeeListEntity>>>(new BaseResponse());

  RxInt addSuccess = 0.obs;
  RxBool userState = false.obs;

  void getEmployeeList() {
    provider.getEmployeeList().then((value) => {
          employees.update((val) => value),
          employees.refresh(),
        });
  }

  Future<BaseResponse> addEmployee(
      String account, String pwd, String username) async {
    return await provider.addEmployee(account, pwd, username);
  }

  Future<BaseResponse> delEmployee(String account) async {
    return await provider.delEmployee(account);
  }

  Future<BaseResponse> editEmployee(
      int id, String account, String pwd, String username, int state) async {
    return await provider.editEmployee(id, account, pwd, username, state);
  }
}
