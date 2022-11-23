import 'package:emplyoee_selection/app/routers/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/selection_management_controller.dart';

class SelectionManageManagementView
    extends GetView<SelectionManagementController> {
  @override
  get controller => Get.find<SelectionManagementController>();

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      routerDelegate: Get.nestedKey(Routes.SELECTIONS),
      builder: (context) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(48, 48, 0, 0),
                alignment: Alignment.topLeft,
                child:
                    OutlinedButton(onPressed: () async {}, child: Text("创建评选")),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(48, 24, 48, 0),
                child: Table(
                  children: [
                    TableRow(children: [
                      TableCell(child: Text("ID")),
                      TableCell(child: Text("活动标题")),
                      TableCell(child: Text("开始时间")),
                      TableCell(child: Text("结束时间")),
                      TableCell(child: Text("参与情况")),
                      TableCell(child: Text("统计数据")),
                      TableCell(child: Text("操作")),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
