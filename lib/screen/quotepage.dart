import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/dbmodels.dart';
import '../Models/global.dart';
import '../helpers/dbhelper.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          Global.tableName,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: DBHelper.dbHelper.fetchAllRecords(tableName: Global.tableName),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Center(
              child: Text("${snapShot.error}"),
            );
          } else if (snapShot.hasData) {
            List<QuotesDB>? data = snapShot.data;

            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data!.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.all(15),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Global.selectedQuote = data[i];
                        Navigator.of(context).pushNamed("DetailsPage");
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          height: 420,
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: MemoryImage(
                                          data[i].image,
                                        ),
                                      ),
                                    ),
                                    height: 350,
                                    width: double.infinity,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      data[i].quotes,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 70,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.image,
                                        color: Colors.purple,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.copy_rounded,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.share,
                                        color: Colors.red,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.download,
                                        color: Colors.green,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.star_border,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}