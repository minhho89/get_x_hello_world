import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  void changeLanage({required String langCode, required String countryCode}) {
    var locale = Locale(langCode, countryCode);
    Get.updateLocale(locale);
  }
}