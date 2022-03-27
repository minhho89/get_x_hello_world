import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/message_controller.dart';

class Locale_Screen extends StatelessWidget {
   Locale_Screen({Key? key}) : super(key: key);

  static String routeName = '/locale_screen';

   // final _messageController = MessageController();
   final _messageController = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: const Text('Locale Translation',),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('hello'.tr),
              Divider(),
              TextButton(onPressed: ()=> _messageController.changeLanage(langCode: 'vi', countryCode: 'VI'),
                  child: const Text('vi_VI'),),
              TextButton(onPressed: ()=> _messageController.changeLanage(langCode: 'ja', countryCode: 'JA'),
                child: const Text('jp_JP'),),
              TextButton(onPressed: ()=> _messageController.changeLanage(langCode: 'en', countryCode: 'US'),
                child: const Text('en_US'),),
            ],
          ),
        ),
    );
  }
}
