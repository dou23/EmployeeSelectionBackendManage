import 'package:emplyoee_selection/app/modules/employee_management/controller/employee_management_controller.dart';
import 'package:emplyoee_selection/app/modules/employee_management/model/employee_list_entity.dart';
import 'package:emplyoee_selection/app/modules/employee_management/views/employee_management_add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'employee_management_del.dart';
import 'employee_management_edit.dart';

class EmployeeManagementView extends GetView<EmployeeManagementController> {
  @override
  EmployeeManagementController get controller =>
      Get.find<EmployeeManagementController>();

  EmployeeManagementView() {
    Future.sync(() => {
          controller.getEmployeeList(),
        });
    controller.addSuccess.addListener(() {
      Future.sync(() => {
        controller.getEmployeeList(),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(48, 48, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OutlinedButton(
                      onPressed: () async {
                        Get.dialog(EmployeeManagementAdd());
                      },
                      child: Text("添加员工")),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(48, 16, 48, 0),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                defaultColumnWidth: FlexColumnWidth(),
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Text('ID'),
                      verticalAlignment: TableCellVerticalAlignment.middle,
                    ),
                    TableCell(
                      child: Text('员工姓名'),
                      verticalAlignment: TableCellVerticalAlignment.middle,
                    ),
                    TableCell(
                      child: Text('员工账号'),
                      verticalAlignment: TableCellVerticalAlignment.middle,
                    ),
                    TableCell(
                      child: Text('员工密码'),
                      verticalAlignment: TableCellVerticalAlignment.middle,
                    ),
                    TableCell(
                      child: Text('账号状态'),
                      verticalAlignment: TableCellVerticalAlignment.middle,
                    ),
                    TableCell(
                      child: Text('操作'),
                      verticalAlignment: TableCellVerticalAlignment.middle,
                    ),
                  ])
                ],
              ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: controller.employees.value.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return EmployeeManagementItem(
                      index,
                      controller.employees.value.data?.elementAt(index),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeManagementItem extends GetView {
  int index;
  EmployeeListEntity? entity;

  EmployeeManagementItem(this.index, this.entity);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(48, 16, 48, 0),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        defaultColumnWidth: FlexColumnWidth(),
        children: [
          TableRow(children: [
            TableCell(
              child: Text((++index).toString()),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
            TableCell(
              child: Text(entity?.username ?? ""),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
            TableCell(
              child: Text(entity?.account ?? ""),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
            TableCell(
              child: Text(entity?.password ?? ""),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
            TableCell(
              child: Text(entity?.state == 0 ? "使用中" : "停用"),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
            TableCell(
              child: Row(
                children: [
                  OutlinedButton(
                      onPressed: () async {
                        Get.dialog(
                          EmployeeInfoEditView(entity),
                        );
                      },
                      child: Text("编辑")),
                  Padding(padding: EdgeInsets.fromLTRB(6, 48, 0, 0)),
                  OutlinedButton(
                      onPressed: () async {
                        Get.dialog(
                          EmployeeManagementDelView(entity),
                        );
                      },
                      child: Text("删除"))
                ],
              ),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
          ])
        ],
      ),
    );
  }
}
