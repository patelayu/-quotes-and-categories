import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import '../Models/dbmodels.dart';
import '../Models/global.dart';

class APIHelpers {
  APIHelpers._();

  static APIHelpers apiHelpers = APIHelpers._();

  Future<List<Quotes>?> fetchQuotes({required tableName}) async {
    http.Response res = await http.get(
      Uri.parse((Global.author)
          ? "https://api.quotable.io/quotes/?author=$tableName"
          : "https://api.quotable.io/quotes/?tags=${(tableName == "Latest") ? "famous-quotes" : tableName}"),
    );

    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);

      List results = data["results"];
      List<Uint8List> images = [];

      for (int i = 0; i < results.length; i++) {
        http.Response image = await http.get(Uri.parse(
            "https://source.unsplash.com/random/${i + 1}?background,${(tableName == "Latest" || Global.author) ? "nature" : tableName} ,dark"));

        if (image.statusCode == 200) {
          images.add(image.bodyBytes);
        }
      }

      List<Quotes> quotesList = results
          .map((e) => Quotes.fromMap(e, images[results.indexOf(e)]))
          .toList();

      print(quotesList);

      return quotesList;
    }

    return null;
  }
}