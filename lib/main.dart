
import 'package:flutter/material.dart';
import 'package:untitled5/screen/aboutpage.dart';
import 'package:untitled5/screen/apprating.dart';
import 'package:untitled5/screen/catogary.dart';
import 'package:untitled5/screen/ditale.dart';
import 'package:untitled5/screen/faviourie.dart';
import 'package:untitled5/screen/homepage.dart';
import 'package:untitled5/screen/quotepage.dart';
import 'package:untitled5/screen/splash.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        'HomePage': (context) => const HomePage(),
        'AboutPage': (context) => const AboutPage(),
        'QuotesPage': (context) => const QuotesPage(),
        'TopicAndAuthorPage': (context) => const TopicAndAuthorPage(),
        'AppRatingPage': (context) =>  const AppRatingPage(),
        'FavouritePage': (context) =>  const FavouritePage(),
        'DetailsPage': (context) =>  const DetailsPage(),
      },
    ),
  );
}