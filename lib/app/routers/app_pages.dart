import 'package:emplyoee_selection/app/modules/employee_management/bindings/employee_bindings.dart';
import 'package:emplyoee_selection/app/modules/employee_management/views/employee_management_view.dart';
import 'package:emplyoee_selection/app/modules/root/views/root_view.dart';
import 'package:emplyoee_selection/app/modules/selection_content/bindings/selection_content_binding.dart';
import 'package:emplyoee_selection/app/modules/selection_content/views/selection_content_view.dart';
import 'package:get/get.dart';

import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/root/bindings/root_bindings.dart';
import '../modules/selection/bindings/selection_management_bindings.dart';
import '../modules/selection/views/selection_management.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
        name: _Paths.ROOT,
        page: () => RootView(),
        bindings: [
          RootBindings(),
        ],
        participatesInRootNavigator: true,
        preventDuplicates: true,
        children: [
          GetPage(
            name: _Paths.SELECTIONS,
            preventDuplicates: true,
            page: () => SelectionManageManagementView(),
            bindings: [SelectionManagementBinding()],
          ),
          GetPage(
            name: _Paths.SELECTIONCONTENT,
            preventDuplicates: true,
            page: () => SelectionContentView(),
            bindings: [SelectionContentBinding()],
          ),
          GetPage(
            name: _Paths.EMPLYOEEMANAGEMENT,
            participatesInRootNavigator: false,
            page: () => EmployeeManagementView(),
            bindings: [EmployeeManagementBinding()],
          ),
        ]),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      bindings: [
        LoginBinding(),
      ],
    ),
  ];
}
