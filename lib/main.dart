import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_ripples_code_tut/controller/counter_controller.dart';
import 'package:get_x_ripples_code_tut/controller/student_controller.dart';
import 'package:get_x_ripples_code_tut/models/student.dart';
import 'package:get_x_ripples_code_tut/routes.dart';
import 'package:get_x_ripples_code_tut/screens/screen_1.dart';
import 'package:get_x_ripples_code_tut/screens/screen_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: getPages,
      home:  HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

   var studentController = Get.put(StudentController());
   final counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
                ()=> Text('Count value is ${counterController.count}'),
            ),
            IconButton(onPressed: counterController.increment, icon: const Icon(Icons.add)),
            const Divider(),
             Obx(
                 ()=> Text(studentController.name)
             ),
             TextButton(onPressed: studentController.changeStudentName, child: const Text('Change student name'),),
             const Divider(),
             Text('This is Home Screen', style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
               color: Colors.blue,
            ),),
            const Divider(),
            TextButton(onPressed: () => Get.toNamed(ScreenOne.routeName), child: const Text('Screen 1')),
            TextButton(onPressed: () => Get.toNamed(ScreenTwo.routeName), child: const Text('Screen 2')),
          ],
        ),
      )
    );
  }
}

