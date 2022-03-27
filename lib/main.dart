import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_ripples_code_tut/projects/basics/controllers/counter_controller.dart';
import 'package:get_x_ripples_code_tut/projects/basics/controllers/student_controller.dart';
import 'package:get_x_ripples_code_tut/projects/basics/langagues/messages.dart';
import 'package:get_x_ripples_code_tut/projects/basics/routes.dart';
import 'package:get_x_ripples_code_tut/projects/basics/screens/locale_screen.dart';
import 'package:get_x_ripples_code_tut/projects/basics/screens/products_listview.dart';
import 'package:get_x_ripples_code_tut/projects/basics/screens/services_screen.dart';
import 'package:get_x_ripples_code_tut/projects/basics/services/counter_service.dart';

Future<void> main() async {
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  print('>>> starting services...');
  await Get.putAsync<CounterService>(() async => CounterService());
  print('>>> All services started.');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var studentController = Get.put(StudentController());
  var counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      translations: Messages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      getPages: getPages,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('GetX'),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // GetX<CounterController>(
                  //   init: CounterController(),
                  //   builder: (controller) {
                  //     return Text('The value is ${controller.count}');
                  //   },
                  // ),
                  GetBuilder<CounterController>(
                      initState: (_) => counterController.incrementByTime(),
                      dispose: (_) => counterController.onClose(),
                      builder: (controller) {
                        return Text('${controller.count}');
                      }),
                  IconButton(
                      onPressed: () {
                        Get.find<CounterController>().increment();
                      },
                      icon: const Icon(Icons.add)),
                  const Divider(),
                  Obx(() => Text(studentController.name)),
                  TextButton(
                    onPressed: studentController.changeStudentName,
                    child: const Text('Change student name'),
                  ),
                  const Divider(),
                  Text(
                    'This is Home Screen',
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize,
                      color: Colors.blue,
                    ),
                  ),
                  const Divider(),
                  TextButton(
                      onPressed: () => Get.toNamed(Locale_Screen.routeName),
                      child: const Text('Locale Screen')),
                  TextButton(
                      onPressed: () => Get.toNamed(ScreenTwo.routeName),
                      child: const Text('Services Screen')),
                  TextButton(
                      onPressed: () => Get.toNamed(ProductListView.routeName),
                      child: const Text('Products Screen')),
                ],
              ),
            ),
          )),
    );
  }
}
