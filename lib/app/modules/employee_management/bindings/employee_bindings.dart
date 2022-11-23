import 'package:emplyoee_selection/app/modules/employee_management/connect/employee_management_connect.dart';
import 'package:emplyoee_selection/app/modules/employee_management/controller/employee_management_controller.dart';
import 'package:get/get.dart';

class EmployeeManagementBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<EmployeeManagementController>(
          () => EmployeeManagementController()),
      Bind.lazyPut<EmployeeManagementProvider>(
          () => EmployeeManagementProvider()),
    ];
  }
}
