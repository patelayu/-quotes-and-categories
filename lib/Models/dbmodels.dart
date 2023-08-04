import 'dart:typed_data';

class Quotes {
  final String quotes;
  final String author;
  final Uint8List image;

  Quotes({required this.quotes, required this.author, required this.image});

  factory Quotes.fromMap(Map data, Uint8List image) {
    return Quotes(
        quotes: data["content"], author: data["author"], image: image);
  }
}

class QuotesDB {
  final String quotes;
  final String author;
  late Uint8List image;

  QuotesDB({required this.quotes, required this.author, required this.image});

  factory QuotesDB.fromMap(Map data) {
    return QuotesDB(
        quotes: data["quote"], author: data["author"], image: data["image"]);
  }
}