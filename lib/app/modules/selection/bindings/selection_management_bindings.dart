import 'package:emplyoee_selection/app/modules/selection/connect/selection_management_connect.dart';
import 'package:emplyoee_selection/app/modules/selection/controller/selection_management_controller.dart';
import 'package:get/get.dart';

class SelectionManagementBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<SelectionManagementController>(
          () => SelectionManagementController()),
      Bind.lazyPut<SelectionManagementProvider>(
          () => SelectionManagementProvider()),
    ];
  }
}
