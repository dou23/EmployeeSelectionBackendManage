import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

import '../controller/employee_management_controller.dart';
import '../model/employee_list_entity.dart';

class EmployeeInfoEditView extends GetView<EmployeeManagementController> {
  EmployeeListEntity? entity;

  EmployeeInfoEditView(this.entity) {
    accountTextEditingController.text = entity?.account ?? "";
    pwdTextEditingController.text = entity?.password ?? "";
    usernameTextEditingController.text = entity?.username ?? "";
    controller.userState.value = entity?.state == 0;
    controller.userState.addListener(() {
      entity?.state = controller.userState.value ? 0 : 1;
      showToast("当前用户状态:" + (controller.userState.value ? "可用" : "禁用"));
    });
  }

  @override
  EmployeeManagementController get controller =>
      Get.find<EmployeeManagementController>();

  TextEditingController accountTextEditingController =
      new TextEditingController();
  TextEditingController pwdTextEditingController = new TextEditingController();
  TextEditingController usernameTextEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 500,
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
                child: TextField(
                  controller: usernameTextEditingController,
                  decoration: InputDecoration(
                      labelText: "员工姓名", icon: Icon(Icons.person_add_alt_1)),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(48, 48, 48, 0),
                child: TextField(
                  controller: accountTextEditingController,
                  decoration: InputDecoration(
                      labelText: "员工账号", icon: Icon(Icons.account_circle)),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(48, 48, 48, 0),
                child: TextField(
                  controller: pwdTextEditingController,
                  decoration: InputDecoration(
                      labelText: "员工密码", icon: Icon(Icons.password)),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 48, 48, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Obx(
                    () => SwitchListTile(
                      title: Text("员工状态"),
                      value: controller.userState.value,
                      onChanged: (value) {
                        controller.userState.value =
                            !controller.userState.value;
                      },
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(48, 48, 0, 0)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlinedButton(
                      onPressed: () async {
                        ++controller.addSuccess.value;
                        Get.back();
                      },
                      child: Text("取消")),
                  Padding(padding: EdgeInsets.fromLTRB(48, 0, 48, 0)),
                  OutlinedButton(
                      onPressed: () async {
                        if (accountTextEditingController.value.text.isEmpty ||
                            pwdTextEditingController.value.text.isEmpty ||
                            usernameTextEditingController.value.text.isEmpty) {
                          showToast("请输入对应信息");
                          return;
                        }
                        var addEmployee = await controller.editEmployee(
                          entity?.iD?.toInt() ?? 0,
                          accountTextEditingController.value.text,
                          pwdTextEditingController.value.text,
                          usernameTextEditingController.value.text,
                          entity?.state?.toInt() ?? 0,
                        );
                        if (addEmployee.success) {
                          ++controller.addSuccess.value;
                          showToast(
                              "员工${usernameTextEditingController.value.text}信息编辑成功");
                          Get.back();
                        } else {
                          showToast(addEmployee.msg!);
                        }
                      },
                      child: Text("确定")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
