import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterController extends GetxController {

  var count = 0;

  void increment() {
    count++;
    update(); // Nếu các variables ở trên ko .obs thì cần update, UI dùng GetBuilder
  }

  void incrementByTime() async {
    while (count <= 100) {
      await Future.delayed(const Duration(seconds: 1));
      count++;
      update();
    }
  }

  // void incrementWithSharedPref() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int counter = (prefs.getInt('counter') ?? 0) + 1;
  //   print('Pressed $counter times');
  //   await prefs.setInt('counter', counter);
  // }

  @override
  void onInit() {
    print('CounterController init');
    super.onInit();
  }

  @override
  void onClose() {
    print('CounterController colosed');
    super.onClose();
  }
}