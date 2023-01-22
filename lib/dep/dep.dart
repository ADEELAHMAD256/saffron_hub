import 'package:get/get.dart';
import 'package:saffron_hub/controller/home_controller.dart';

class Dep extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
