// Obtain shared preferences.


import 'package:emplyoee_selection/app/modules/login/model/login_response_entity.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

late Box hiveBox;

Future init() async {
  await Hive.initFlutter();
  //flutter packages pub run build_runner build
  Hive.registerAdapter(LoginEntityAdapter());
  hiveBox = await Hive.openBox('peopleBox');
}
