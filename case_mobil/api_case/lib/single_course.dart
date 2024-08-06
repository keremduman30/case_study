import 'package:api_case/model/course_model.dart';
import 'package:api_case/widget/img_info_container.dart';
import 'package:flutter/material.dart';

class SingleCourse extends StatelessWidget {
  final CourseModel? model;
  final String date;
  final String time;
  const SingleCourse(
      {super.key, required this.model, required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Id : ${model?.id.toString()}"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: ImgInfoContainer(),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    model?.title ?? "title",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Webwinar konusu : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      model?.subtitle ?? "Özgür Özdemir",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Tarih : ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(date),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Saat : ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(time),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
