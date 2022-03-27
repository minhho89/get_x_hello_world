import 'package:get/get.dart';
import 'package:get_x_ripples_code_tut/projects/basics/controllers/student_controller.dart';

import 'counter_controller.dart';
import 'message_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController>(() => CounterController());
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<StudentController>(() => StudentController());
  }



}