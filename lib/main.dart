import 'package:emplyoee_selection/app/config/storage_manage.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:get/get.dart';

import 'app/routers/app_pages.dart';

main() async {
  await init();
  runApp(
    OKToast(
      child: GetMaterialApp(
        title: '员工评选',
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,
      ),
    ),
  );
}
