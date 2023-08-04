import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget categoryContainer({required double height, required String category}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://source.unsplash.com/random/?2background,$category,dark",
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          "$category Quotes",
          style: GoogleFonts.gotu(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}