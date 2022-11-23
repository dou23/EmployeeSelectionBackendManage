
import 'package:get/get.dart';

import '../../../config/api_list.dart';
import '../../../model/base_model.dart';
import '../../../net/es_api.dart';
import '../model/login_response_entity.dart';

class LoginProvider extends GetConnect {
  Future<BaseResponse<LoginEntity>> adminLogin(String account, String password) async {
    var response = await http.post(ESApi.login, data: {
      "account": account,
      "password": password,
    });
    print("请求数据:${response}");
    // WrapResponseData<LoginEntity> wrapResponseData = jsonDecode(response.data);
    print("请求数据:${BaseResponse<LoginEntity>.fromJson(response.data).toJson()}");

    return BaseResponse<LoginEntity>.fromJson(response.data);
  }
}
