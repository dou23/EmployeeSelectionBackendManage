import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../routers/app_pages.dart';

class RootDrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('评选管理'),
            onTap: () {
              Get.toNamed(Routes.SELECTIONS);
              //to close the drawer
              Get.back();
            },
          ),
          ListTile(
            title: Text('评选模板管理'),
            onTap: () {
              Get.toNamed(Routes.SELECTIONCONTENT);
              //to close the drawer
              Get.back();
            },
          ),
          ListTile(
            title: Text('员工管理'),
            onTap: () {
              Get.toNamed(Routes.EMPLYOEEMANAGEMENT);
              //to close the drawer
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
