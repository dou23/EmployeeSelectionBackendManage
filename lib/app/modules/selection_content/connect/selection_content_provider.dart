import 'package:emplyoee_selection/app/config/api_list.dart';
import 'package:emplyoee_selection/app/model/base_model.dart';
import 'package:emplyoee_selection/app/modules/selection_content/model/selection_content_entity.dart';
import 'package:emplyoee_selection/app/net/es_api.dart';
import 'package:get/get.dart';

class SelectionContentProvider extends GetConnect {
  Future<BaseResponse<List<SelectionContentEntity>>>
      getSelectionContentList() async {
    var response = await http.post(ESApi.selectionContentList);
    print("请求结果:${response.data}");
    return BaseResponse<List<SelectionContentEntity>>.fromJson(response.data);
  }

  Future<BaseResponse> selectionContentCreate(
      String name, List<SelectionContentContentDetail> details) async {
    var response = await http.post(ESApi.selectionContentCreate, data: {
      "name": name,
      "details": details,
    });
    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse> selectionContentDel(int id) async {
    var response = await http.post(ESApi.selectionContentDel, data: {
      "id": id,
    });
    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse> selectionContentEdit(
      int id, String name, List<SelectionContentContentDetail> details) async {
    var response = await http.post(ESApi.selectionContentEdit, data: {
      "id": id,
      "name": name,
      "details": details,
    });
    return BaseResponse.fromJson(response.data);
  }
}
