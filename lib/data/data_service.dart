import 'dart:convert';

import 'package:devtools_flutter/data/student.dart';
import 'package:flutter/services.dart';

class DataService {
  Future<List<Student>> fetchFileFromAssets(String assetsPath) async {
    final decodedJson = await rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
    return decodedJson.map<Student>((user) => Student.fromJson(user)).toList();
  }
}
