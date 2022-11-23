import 'package:emplyoee_selection/app/config/constant_pool.dart';

import 'package:emplyoee_selection/app/routers/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oktoast/oktoast.dart';
import 'package:get/get.dart';

import '../../../config/storage_manage.dart';
import '../controllers/login_controller.dart';
import '../model/login_response_entity.dart';

class LoginView extends GetView<LoginController> {
  TextEditingController accountTextEditingController =
      new TextEditingController();
  TextEditingController pwdTextEditingController = new TextEditingController();

  @override
  get controller => Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    if (hiveBox.containsKey(StringPool.User)) {
      LoginEntity loginEntity = hiveBox.get(StringPool.User);
      accountTextEditingController.text = loginEntity.account ?? "";
    }
    return Scaffold(
      body: SafeArea(
          child: MediaQuery.removePadding(
        context: context,
        child: ListView(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: new EdgeInsets.fromLTRB(
                          0, MediaQuery.of(context).size.height / 3.5, 0, 0),
                    ),
                    Text(
                      '员工评选系统管理后台',
                      style: TextStyle(fontSize: 32),
                    ),
                    Padding(
                      padding: new EdgeInsets.fromLTRB(0, 48, 0, 0),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "用户名", icon: Icon(Icons.account_circle)),
                      controller: accountTextEditingController,
                    ),
                    Padding(
                      padding: new EdgeInsets.fromLTRB(0, 24, 0, 0),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "密码", icon: Icon(Icons.password)),
                      controller: pwdTextEditingController,
                    ),
                    Padding(
                      padding: new EdgeInsets.fromLTRB(0, 48, 0, 0),
                    ),
                    OutlinedButton(
                        onPressed: () async {
                          Get.defaultDialog(
                            title: "",
                            content: Text('登录中...'),
                          );
                          var adminLogin = await controller.adminLogin(
                              accountTextEditingController.value.text
                                  .toString(),
                              pwdTextEditingController.value.text.toString());
                          Get.back();
                          if (adminLogin.success) {
                            showToast("${adminLogin.data!.username}登录成功");
                            hiveBox.put(StringPool.User, adminLogin.data);
                            Get.toNamed(Routes.ROOT);
                          } else {
                            showToast("${adminLogin.msg}");
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue)),
                        child: Text(
                          "登陆",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
