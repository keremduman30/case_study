import 'dart:convert';

import 'package:api_case/model/course_model.dart';
import 'package:api_case/network/network_manager.dart';

class CourseService {
  final dio = NetworkManager.instance.dio;

  Future<List<CourseModel>?> allCourseList() async {
    try {
      final response = await dio.get("/webinars");
      if (response.statusCode == 200) {
        final Iterable jsonList =
            response.data is String ? jsonDecode(response.data) : response.data;
        if (jsonList is List) {
          final courseList = List<CourseModel>.from(
              jsonList.map((course) => CourseModel.fromJson(course)));
          return courseList;
        }
      }
      return [];
    } catch (e) {
      return null;
    }
  }
}
