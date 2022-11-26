import 'dart:collection';
import 'dart:ffi';

import 'package:emplyoee_selection/app/modules/selection_content/connect/selection_content_provider.dart';
import 'package:get/get.dart';

import '../../../model/base_model.dart';
import '../model/selection_content_entity.dart';

class SelectionContentController extends GetxController {
  SelectionContentProvider provider = Get.find<SelectionContentProvider>();

  Rx<BaseResponse<List<SelectionContentEntity>>?> selectionContentList =
      new Rx(BaseResponse<List<SelectionContentEntity>>());

  RxInt change = 0.obs;

  void getSelectionContentList() async {
    var response = await provider.getSelectionContentList();
    selectionContentList.update((val) => response);
    refresh();
  }

  Future<BaseResponse> selectionContentCreate(
      String name, List<SelectionContentContentDetail> details) async {
    return await provider.selectionContentCreate(name, details);
  }

  Future<BaseResponse> selectionContentDel(int id) async {
    return await provider.selectionContentDel(id);
  }

  Future<BaseResponse> selectionContentEdit(
      int id, String name, List<SelectionContentContentDetail> details) async {
    return await provider.selectionContentEdit(id, name, details);
  }
}
