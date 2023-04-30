import 'package:devtools_flutter/data/data_service.dart';
import 'package:devtools_flutter/data/student.dart';
import 'package:devtools_flutter/ui/views/active_students.dart';
import 'package:devtools_flutter/ui/views/all_students.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  final service = DataService();

  int currentPageIndex = 0;

  final List<Widget> views = [
    const AllStudents(),
    const ActiveStudents(),
  ];

  Future<List<Student>> getStudents() async {
    return await service.fetchFileFromAssets('assets/data.json');
  }

  void changeTab(int i) {
    currentPageIndex = i;
  }
}
