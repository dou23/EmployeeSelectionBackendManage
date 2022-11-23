import 'package:emplyoee_selection/app/modules/root/connect/root_connect.dart';
import 'package:emplyoee_selection/app/modules/root/controller/root_controller.dart';
import 'package:get/get.dart';

class RootBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<RootController>(() => RootController()),
      Bind.lazyPut<RootProvider>(() => RootProvider()),
    ];
  }
}
