import 'package:get/get.dart';
import 'package:sakanle/controller/home/founded_results_controller.dart';

class FoundedResultsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoundedResultsControllerImp());
  }
}
