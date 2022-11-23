
import 'package:get/get.dart';
import '../../../model/base_model.dart';
import '../connect/login_connect.dart';
import '../model/login_response_entity.dart';

class LoginController extends GetxController {
  LoginProvider rootProvider = Get.find<LoginProvider>();

  Future<BaseResponse<LoginEntity>> adminLogin(
      String account, String pwd) async {
    var adminLogin = await rootProvider.adminLogin(account, pwd);
    return adminLogin;
  }
}
