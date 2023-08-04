import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/global.dart';
import '../widgets/catogary_container.dart';
import '../widgets/container.dart';
import '../widgets/drwaer.dart';
import '../widgets/side.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Global.author = false;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffFFF9E3),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu, color: Colors.black),
          );
        }),
        backgroundColor:Color(0xffFFF9E3),
        elevation: 2,
        title: Text(
          "Life Quotes and Sayings",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                Navigator.of(context).pushNamed("AppRatingPage");
              });
            },
            child: const Image(
              image: AssetImage(
                "images/like.png",
              ),
              width: 30,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      drawer: drawer(context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              carouselSlider(height: h, width: w),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.of(context)
                                .pushNamed("TopicAndAuthorPage");
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff3B3131),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 60,
                          width: 60,
                          child: const Icon(Icons.grid_view_outlined,
                              color: Colors.white, size: 28),
                        ),
                      ),
                      Text(
                        "Categories",
                        style: GoogleFonts.gotu(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffFBD5AB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 60,
                          width: 60,
                          child: const Icon(Icons.photo_outlined,
                              color: Colors.black, size: 28),
                        ),
                      ),
                      Text(
                        "Pic Quotes",
                        style: GoogleFonts.gotu(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff8B8000),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 60,
                          width: 60,
                          child: const Icon(Icons.settings_rounded,
                              color: Colors.white, size: 28),
                        ),
                      ),
                      Text(
                        "Settings",
                        style: GoogleFonts.gotu(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.of(context)
                                .pushNamed("TopicAndAuthorPage");
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green.shade700,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 60,
                          width: 60,
                          child: const Icon(Icons.menu_book_outlined,
                              color: Colors.white, size: 28),
                        ),
                      ),
                      Text(
                        "Articles",
                        style: GoogleFonts.gotu(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Most Popular",
                style: GoogleFonts.gotu(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "happiness";
                        Navigator.of(context).pushNamed("QuotesPage");
                      },
                      child:
                      categoryContainer(height: h, category: "Happiness"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "success";
                        Navigator.of(context).pushNamed("QuotesPage");
                      },
                      child: categoryContainer(height: h, category: "Success"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "love";
                        Navigator.of(context).pushNamed("QuotesPage");
                      },
                      child: categoryContainer(height: h, category: "Love"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "truth";
                        Navigator.of(context).pushNamed("QuotesPage");
                      },
                      child: categoryContainer(height: h, category: "Truth"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Quotes by Category",
                    style: GoogleFonts.gotu(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Global.authorCategory = false;
                      Navigator.of(context)
                          .pushNamed("TopicAndAuthorPage");
                    },
                    child: Text(
                      "View All >",
                      style: GoogleFonts.gotu(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "sports";
                        Navigator.of(context).pushNamed("QuotesPage");
                      },
                      child: categoryContainer(height: h, category: "Sports"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "wisdom";
                        Navigator.of(context).pushNamed("QuotesPage");
                      },
                      child: categoryContainer(height: h, category: "Wisdom"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "life";
                        Navigator.of(context).pushNamed("QuotesPage");
                      },
                      child: categoryContainer(height: h, category: "Life"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "business";
                        Navigator.of(context).pushNamed("QuotesPage");
                      },
                      child: categoryContainer(height: h, category: "Business"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Quotes by Author",
                    style: GoogleFonts.gotu(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Global.authorCategory = true;
                      Navigator.of(context)
                          .pushNamed("TopicAndAuthorPage");
                    },
                    child: Text(
                      "View All >",
                      style: GoogleFonts.gotu(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.author = true;
                        Global.tableName = "abdul_kalam";
                        Navigator.of(context).pushNamed("QuotesPage");
                      },
                      child: authorContainer(
                          height: h,
                          color: Colors.primaries[Random().nextInt(Colors.accents.length)],
                          author: "Abdul Kalam"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.author = true;
                        Global.tableName = "anna_pavlova";
                        Navigator.of(context).pushNamed("QuotesPage");
                      },
                      child: authorContainer(
                          height: h,
                          color: Colors.accents[Random().nextInt(Colors.primaries.length)],
                          author: "Anna Pavlova"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.author = true;
                        Global.tableName = "chanakya";
                        Navigator.of(context).pushNamed("QuotesPage");
                      },
                      child: authorContainer(
                          height: h,
                          color: Colors.accents[Random().nextInt(Colors.accents.length)],
                          author: "Chanakya"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.author = true;
                        Global.tableName = "dr_seuss";
                        Navigator.of(context).pushNamed("QuotesPage");
                      },
                      child: authorContainer(
                          height: h,
                          color: Colors.accents[Random().nextInt(Colors.accents.length)],
                          author: "Rabindranath\nTagore"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );

  }
}