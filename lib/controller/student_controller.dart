import 'package:get/get.dart';

import '../models/student.dart';

class StudentController extends GetxController {

  var _student = Student(name: 'Tom', age: 27).obs;

  String get name {
    return _student.value.name;
  }

  int get age {
    return _student.value.age;
  }

  void changeStudentName() {
    if (_student.value.name == 'Jack') {
      _student.update((val) =>_student.value.name = 'Tom');
    } else {
      _student.update((val) => _student.value.name = 'Jack');
    }
  }


}