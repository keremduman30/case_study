import 'package:flutter/material.dart';

class ImgInfoContainer extends StatelessWidget {
  const ImgInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80), color: Colors.grey),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text("Ders Çizelgesi",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
