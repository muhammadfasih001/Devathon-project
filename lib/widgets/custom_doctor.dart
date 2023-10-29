import 'package:flutter/material.dart';

class CustomDoctor extends StatelessWidget {
  final String docName;
  final String docSub;
  final String image;
  final String starImage;
  const CustomDoctor(
      {super.key,
      required this.docName,
      required this.docSub,
      required this.image,
      required this.starImage});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            height: 100,
            width: 80,
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(image),
                    ),
                  ],
                ),
                Image.asset(starImage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
