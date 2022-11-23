
import 'package:emplyoee_selection/app/modules/selection_content/connect/selection_content_provider.dart';
import 'package:emplyoee_selection/app/modules/selection_content/controller/selection_content_controller.dart';
import 'package:get/get.dart';

class SelectionContentBinding extends Binding {

  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<SelectionContentController>(() => SelectionContentController()),
      Bind.lazyPut<SelectionContentProvider>(() => SelectionContentProvider())
    ];
  }

}