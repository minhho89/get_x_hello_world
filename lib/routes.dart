 import 'package:get/get.dart';
import 'package:get_x_ripples_code_tut/main.dart';
import 'package:get_x_ripples_code_tut/screens/screen_1.dart';
import 'package:get_x_ripples_code_tut/screens/screen_2.dart';

List<GetPage> getPages = [
  GetPage(name: '/', page: () =>  HomeScreen()),
  GetPage(name: ScreenOne.routeName, page: ()=> const ScreenOne(), transition: Transition.leftToRight),
  GetPage(name: ScreenTwo.routeName, page: ()=> const ScreenTwo(), transition: Transition.circularReveal),
];