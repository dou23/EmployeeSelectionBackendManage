import 'dart:collection';

import 'package:emplyoee_selection/app/modules/selection_content/controller/selection_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

import '../model/selection_content_entity.dart';

class SelectionContentCreateView extends GetView<SelectionContentController> {
  @override
  SelectionContentController get controller =>
      Get.find<SelectionContentController>();

  TextEditingController textEditingController = TextEditingController();

  RxInt contentNum = 1.obs;

  Map<int, SelectionContentContentDetail> selectionContentCreateMap = HashMap();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            //设置四周边框
            border: new Border.all(width: 1, color: Colors.black),
          ),
          width: 800,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(51, 24, 24, 6),
                  width: 150,
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      labelText: "评选内容模板名称",
                      border: OutlineInputBorder(
                        ///设置边框四个角的弧度
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                        ///用来配置边框的样式
                        borderSide: BorderSide(
                          ///设置边框的颜色
                          color: Colors.red,

                          ///设置边框的粗细
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Obx(() => ListView.builder(
                      itemCount: contentNum.value,
                      itemBuilder: (context, index) {
                        return SelectionContentCreateItem(
                            index, selectionContentCreateMap);
                      },
                    )),
              ),
              OutlinedButton(
                  onPressed: () async {
                    contentNum.obs.value++;
                  },
                  child: Text("添加一条")),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
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
                        var response = await controller.selectionContentCreate(
                            textEditingController.text,
                            selectionContentCreateMap.values.toList());
                        showToast(response.msg ?? "");
                        if (response.success) {
                          controller.change.value++;
                          Get.back();
                        }
                      },
                      child: Text("添加")),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectionContentCreateItem extends GetView {
  int index;

  Map<int, SelectionContentContentDetail>? selectionContentCreateMap;

  SelectionContentCreateItem(this.index, this.selectionContentCreateMap) {
    contentTextEditingController.addListener(() {
      selectionContentCreateMap?.putIfAbsent(
          index, () => new SelectionContentContentDetail());
      selectionContentCreateMap?[index]?.name =
          contentTextEditingController.text;
    });
    descriptionTextEditingController.addListener(() {
      selectionContentCreateMap?.putIfAbsent(
          index, () => new SelectionContentContentDetail());
      selectionContentCreateMap?[index]?.description =
          descriptionTextEditingController.text;
    });
    highestScoreTextEditingController.addListener(() {
      selectionContentCreateMap?.putIfAbsent(
          index, () => new SelectionContentContentDetail());
      if (highestScoreTextEditingController.text != null &&
          highestScoreTextEditingController.text != "") {
        if (int.parse(highestScoreTextEditingController.text.toString()) > 5) {
          highestScoreTextEditingController.text = "5";
        }
        selectionContentCreateMap?[index]?.highestScore =
            int.parse(highestScoreTextEditingController.text);
      } else {
        selectionContentCreateMap?[index]?.highestScore = 0;
      }
    });
    lowestScoreTextEditingController.addListener(() {
      selectionContentCreateMap?.putIfAbsent(
          index, () => new SelectionContentContentDetail());
      if (lowestScoreTextEditingController.text != null &&
          lowestScoreTextEditingController.text != "") {
        if (int.parse(lowestScoreTextEditingController.text.toString()) > 5) {
          lowestScoreTextEditingController.text = "5";
        } else if (int.parse(lowestScoreTextEditingController.text.toString()) <
            1) {
          lowestScoreTextEditingController.text = "1";
        }
        selectionContentCreateMap?[index]?.lowestScore =
            int.parse(lowestScoreTextEditingController.text);
      } else {
        selectionContentCreateMap?[index]?.lowestScore = 0;
      }
    });
  }

  //评选内容
  TextEditingController contentTextEditingController = TextEditingController();

  //评选备注
  TextEditingController descriptionTextEditingController =
      TextEditingController();

  //最高分
  TextEditingController highestScoreTextEditingController =
      TextEditingController();

  //最低分
  TextEditingController lowestScoreTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
          width: 150,
          child: TextField(
            controller: contentTextEditingController,
            decoration: InputDecoration(
              labelText: "评选内容",
              border: OutlineInputBorder(
                ///设置边框四个角的弧度
                borderRadius: BorderRadius.all(Radius.circular(10)),

                ///用来配置边框的样式
                borderSide: BorderSide(
                  ///设置边框的颜色
                  color: Colors.red,

                  ///设置边框的粗细
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
          width: 150,
          child: TextField(
            controller: descriptionTextEditingController,
            decoration: InputDecoration(
              labelText: "评选备注",
              border: OutlineInputBorder(
                ///设置边框四个角的弧度
                borderRadius: BorderRadius.all(Radius.circular(10)),

                ///用来配置边框的样式
                borderSide: BorderSide(
                  ///设置边框的颜色
                  color: Colors.red,

                  ///设置边框的粗细
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
          width: 150,
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: highestScoreTextEditingController,
            decoration: InputDecoration(
              labelText: "最高分",
              hintText: "最高5分",
              border: OutlineInputBorder(
                ///设置边框四个角的弧度
                borderRadius: BorderRadius.all(Radius.circular(10)),

                ///用来配置边框的样式
                borderSide: BorderSide(
                  ///设置边框的颜色
                  color: Colors.red,

                  ///设置边框的粗细
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
          width: 150,
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: lowestScoreTextEditingController,
            decoration: InputDecoration(
              labelText: "最低分",
              hintText: "最低1分",
              border: OutlineInputBorder(
                ///设置边框四个角的弧度
                borderRadius: BorderRadius.all(Radius.circular(10)),

                ///用来配置边框的样式
                borderSide: BorderSide(
                  ///设置边框的颜色
                  color: Colors.red,

                  ///设置边框的粗细
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
