import 'package:api_case/model/course_model.dart';
import 'package:api_case/service/course_service.dart';
import 'package:api_case/widget/course_item.dart';
import 'package:api_case/widget/img_info_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CourseService _service;
  @override
  void initState() {
    super.initState();
    _service = CourseService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Api Case")),
      body: Column(
        children: [
          const ImgInfoContainer(),
          Expanded(
            child: FutureBuilder<List<CourseModel>?>(
              future: _service.allCourseList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final courseList = snapshot.data;
                  return Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const Divider(color: Colors.grey, height: 2),
                      itemCount: courseList?.length ?? 0,
                      itemBuilder: (context, index) {
                        final courseModel = courseList?[index];
                        return CourseItem(model: courseModel);
                      },
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
