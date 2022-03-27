import 'package:get/get.dart';
import 'package:get_x_ripples_code_tut/projects/basics/screens/locale_screen.dart';
import 'package:get_x_ripples_code_tut/projects/basics/screens/products_listview.dart';
import 'package:get_x_ripples_code_tut/projects/basics/screens/services_screen.dart';

import '../../main.dart';
import 'controllers/message_controller.dart';

List<GetPage> getPages = [
  GetPage(name: '/', page: () => HomeScreen()),
  GetPage(
    name: Locale_Screen.routeName,
    page: () => Locale_Screen(),
    binding: MessageControllerBinding(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: ScreenTwo.routeName,
    page: () => const ScreenTwo(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: ProductListView.routeName,
    page: () => ProductListView(),
    transition: Transition.fadeIn,
  ),
];

class MessageControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController());
  }
}
