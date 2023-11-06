import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  final String url;
  final String text;
  const Categories({super.key, required this.url, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 0.5,
                style: BorderStyle.solid,
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 2),
                  color: Colors.grey[300]!,
                ),
              ]),
          child: Image.asset(
            url,
            height: 50,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
