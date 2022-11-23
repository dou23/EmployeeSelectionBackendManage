import 'package:emplyoee_selection/app/modules/root/controller/root_controller.dart';
import 'package:emplyoee_selection/app/modules/root/views/drawer_view.dart';
import 'package:emplyoee_selection/app/routers/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return RouterOutlet.builder(
        delegate: Get.nestedKey(null),
        builder: (context) {

          final title = context.location;
          String titleStr = "";
          if (title.startsWith(Routes.SELECTIONS)) {
            titleStr = "评选管理";
          } else if (title.startsWith(Routes.SELECTIONCONTENT)) {
            titleStr = "评选模板管理";
          } else if (title.startsWith(Routes.EMPLYOEEMANAGEMENT)) {
            titleStr = "员工管理";
          }
          return Scaffold(
            drawer: RootDrawerView(),
            appBar: AppBar(
              title: Text("${titleStr}"),
              centerTitle: true,
            ),
            body: GetRouterOutlet(
                initialRoute: Routes.SELECTIONS,
                delegate: Get.nestedKey(null),
                anchorRoute: Routes.ROOT,
                filterPages: (afterAnchor) {
                  // print(afterAnchor);
                  // print('dddddddddddddddddd');
                  // print(afterAnchor.take(1));
                  return afterAnchor.take(1);
                }),
          );
        });
  }
}
