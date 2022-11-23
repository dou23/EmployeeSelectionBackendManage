import 'package:emplyoee_selection/app/config/api_list.dart';
import 'package:emplyoee_selection/app/modules/employee_management/model/employee_list_entity.dart';
import 'package:emplyoee_selection/app/net/es_api.dart';
import 'package:get/get.dart';

import '../../../model/base_model.dart';

class EmployeeManagementProvider extends GetConnect {
  ///添加员工
  Future<BaseResponse> addEmployee(
      String account, String pwd, String username) async {
    var response = await http.post(ESApi.addEmployee, data: {
      "account": account,
      "password": pwd,
      "username": username,
    });
    print("请求数据:${BaseResponse.fromJson(response.data).toJson()}");
    return BaseResponse.fromJson(response.data);
  }

  ///删除员工
  Future<BaseResponse> delEmployee(String account) async {
    var response = await http.post(ESApi.delEmployee, data: {
      "account": account,
    });
    print("请求数据:${BaseResponse.fromJson(response.data).toJson()}");
    return BaseResponse.fromJson(response.data);
  }

  ///获取员工列表
  Future<BaseResponse<List<EmployeeListEntity>>> getEmployeeList() async {
    var response = await http.post(ESApi.employeeList);
    print(
        "请求数据:${BaseResponse<List<EmployeeListEntity>>.fromJson(response.data).toJson()}");

    return BaseResponse<List<EmployeeListEntity>>.fromJson(response.data);
  }

  ///添加员工
  Future<BaseResponse> editEmployee(
      int id,String account, String pwd, String username,int state) async {
    var response = await http.post(ESApi.editEmployee, data: {
      "id": id,
      "account": account,
      "password": pwd,
      "username": username,
      "state": state,
    });
    print("请求数据:${BaseResponse.fromJson(response.data).toJson()}");
    return BaseResponse.fromJson(response.data);
  }

}
