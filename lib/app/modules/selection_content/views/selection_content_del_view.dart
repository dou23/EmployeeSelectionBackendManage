import 'package:emplyoee_selection/app/modules/selection_content/controller/selection_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

import '../model/selection_content_entity.dart';

class SelectionContentDelView extends GetView<SelectionContentController> {
  SelectionContentEntity? entity;

  @override
  SelectionContentController get controller =>
      Get.find<SelectionContentController>();

  SelectionContentDelView(this.entity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            //设置四周边框
            border: new Border.all(width: 1, color: Colors.black),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(48, 48, 48, 0),
                child: Text("是否删除评选内容模板${entity!.name}？"),
              ),
              Padding(padding: EdgeInsets.fromLTRB(48, 48, 0, 0)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlinedButton(
                      onPressed: () async {
                        Get.back();
                      },
                      child: Text("取消")),
                  Padding(padding: EdgeInsets.fromLTRB(48, 0, 48, 0)),
                  OutlinedButton(
                      onPressed: () async {
                        var response = await controller
                            .selectionContentDel(entity?.iD?.toInt() ?? 0);
                        showToast(response?.msg ?? "");
                        if (response.success) {
                          controller.change.value++;
                          Get.back();
                        }
                      },
                      child: Text("确定")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
