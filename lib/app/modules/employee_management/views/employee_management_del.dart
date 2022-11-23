import 'package:emplyoee_selection/app/modules/employee_management/controller/employee_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

import '../model/employee_list_entity.dart';

class EmployeeManagementDelView extends GetView<EmployeeManagementController> {

  EmployeeListEntity? entity;

  EmployeeManagementDelView(this.entity);

  @override
  // TODO: implement controller
  EmployeeManagementController get controller =>
      Get.find<EmployeeManagementController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          //设置四周边框
          border: new Border.all(width: 1, color: Colors.black),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(48, 48, 48, 0),
              child: Text("是否删除员工${entity!.username}？"),
            ),
            Padding(padding: EdgeInsets.fromLTRB(48, 48, 0, 0)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                    onPressed: () async {
                      controller.addSuccess.value++;
                      Get.back();
                    },
                    child: Text("取消")),
                Padding(padding: EdgeInsets.fromLTRB(48, 0, 48, 0)),
                OutlinedButton(
                    onPressed: () async {
                      var delEmployee =
                      await controller.delEmployee(entity!.account!);
                      showToast(delEmployee.msg!);
                      if (delEmployee.success) {
                        controller.addSuccess.value++;
                        Get.back();
                      }
                    },
                    child: Text("确定")),
              ],
            )
          ],
        ),
      ),),
    );
  }
}
