import 'package:flutter/material.dart';
import  'package:get/get.dart';

import '../services/counter_service.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  static String routeName = '/services_screen';


  @override
  Widget build(BuildContext context) {

    // Get.putAsync<CounterController>(() async => CounterController());

    return  Scaffold(
      appBar: AppBar(
        title:  const Text('Services Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text('Increment counter in SharedPref'),
              onPressed: (){
                // Get.find<CounterController>();
               Get.find<CounterService>().incrementCounter();
              },
            ),
          ],
        ),
      ),
    );
  }
}
