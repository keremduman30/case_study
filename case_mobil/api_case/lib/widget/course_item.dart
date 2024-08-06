import 'package:api_case/model/course_model.dart';
import 'package:api_case/single_course.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CourseItem extends StatelessWidget {
  final CourseModel? model;
  const CourseItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime =
        DateTime.parse(model?.createdAt ?? DateTime.now().toString());
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    String formattedTime = DateFormat('HH:mm:ss').format(dateTime);

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleCourse(
                model: model, date: formattedDate, time: formattedTime),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(model?.title ?? "title")),
            Row(
              children: [
                Row(
                  children: [
                    const Text(
                      "Tarih : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(formattedDate),
                  ],
                ),
                const SizedBox(width: 30),
                Row(
                  children: [
                    const Text("Saat : ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(formattedTime),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
