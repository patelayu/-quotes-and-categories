import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/dbmodels.dart';
import '../Models/global.dart';
import '../helpers/dbhelper.dart';

Widget carouselSlider({required double height, required double width}) {
  int index = 0;

  return FutureBuilder(
    future: DBHelper.dbHelper.fetchAllRecords(tableName: "Latest"),
    builder: (context, snapShot) {
      if (snapShot.hasError) {
        return Center(
          child: Text("${snapShot.error}"),
        );
      } else if (snapShot.hasData) {
        List<QuotesDB>? res = snapShot.data;

        return InkWell(
          onTap: () {
            Global.selectedQuote = res![index];
            Navigator.of(context).pushNamed("details_page");
          },
          child: CarouselSlider(
            options: CarouselOptions(
              height: height * 0.24,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 600),
            ),
            items: res?.map((e) {
              return Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6),
                      BlendMode.hardLight,
                    ),
                    fit: BoxFit.cover,
                    image: MemoryImage(
                      e.image,
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text(
                  e.quotes,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}