import 'package:emplyoee_selection/app/modules/employee_management/controller/employee_management_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class EmployeeManagementAdd extends GetView<EmployeeManagementController> {
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
          height: MediaQuery.of(context).size.height / 1.5,
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
                        var addEmployee = await controller.addEmployee(
                          accountTextEditingController.value.text,
                          pwdTextEditingController.value.text,
                          usernameTextEditingController.value.text,
                        );
                        if (addEmployee.success) {
                          ++controller.addSuccess.value;
                          showToast(
                              "添加员工${usernameTextEditingController.value.text}成功");
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
