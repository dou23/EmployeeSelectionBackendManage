import 'package:emplyoee_selection/app/modules/selection_content/controller/selection_content_controller.dart';
import 'package:emplyoee_selection/app/modules/selection_content/model/selection_content_entity.dart';
import 'package:emplyoee_selection/app/modules/selection_content/views/selection_content_create_view.dart';
import 'package:emplyoee_selection/app/modules/selection_content/views/selection_content_edit_view.dart';
import 'package:emplyoee_selection/app/modules/selection_content/views/selection_content_del_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectionContentView extends GetView<SelectionContentController> {
  @override
  SelectionContentController get controller =>
      Get.find<SelectionContentController>();

  SelectionContentView() {
    Future.sync(() => {controller.getSelectionContentList()});
    controller.change.addListener(() {
      Future.sync(() => {controller.getSelectionContentList()});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(48, 48, 0, 0),
            alignment: Alignment.topLeft,
            child: OutlinedButton(
                onPressed: () async {
                  Get.dialog(SelectionContentCreateView());
                },
                child: Text("创建评选模板")),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(48, 24, 48, 0),
            child: Table(
              defaultColumnWidth: FlexColumnWidth(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  TableCell(child: Text("ID")),
                  TableCell(child: Text("模板名称")),
                  TableCell(child: Text("操作")),
                ]),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount:
                    controller.selectionContentList?.value?.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return SelectionContentItemView(
                      index,
                      controller.selectionContentList?.value?.data
                          ?.elementAt(index));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectionContentItemView extends GetView {
  int index;

  SelectionContentEntity? entity;

  SelectionContentItemView(this.index, this.entity);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(48, 16, 48, 0),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        defaultColumnWidth: FlexColumnWidth(),
        children: [
          TableRow(children: [
            TableCell(
              child: Text((++index).toString()),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
            TableCell(
              child: Text(entity?.name ?? ""),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
            TableCell(
              child: Row(
                children: [
                  OutlinedButton(
                      onPressed: () async {
                        Get.dialog(
                          SelectionContentEditView(entity),
                        );
                      },
                      child: Text("编辑")),
                  Padding(padding: EdgeInsets.fromLTRB(6, 48, 0, 0)),
                  OutlinedButton(
                      onPressed: () async {
                        Get.dialog(
                          SelectionContentDelView(entity),
                        );
                      },
                      child: Text("删除")),
                ],
              ),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
          ])
        ],
      ),
    );
  }
}
