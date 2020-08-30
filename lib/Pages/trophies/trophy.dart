import 'package:bengaluru_fc/Constants/Const.dart';
import 'package:bengaluru_fc/Pages/trophies/trophydesc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Trophies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          topWidget(context),
          middleWidget(context),
          bottomWidget(context),
        ],
      ),
    );
  }

  Container bottomWidget(BuildContext context) {
    return Container(
      height: 450,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFF232323),
      child: StreamBuilder(
          stream: Firestore.instance
              .collection("trophies")
              .orderBy("id")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Image.asset("assets/loader/loader.gif"),
              );
            } else {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      right: 12,
                      top: 25,
                      bottom: 25,
                    ),
                    child: Container(
                      width: 290,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            snapshot.data.documents[index]["image"],
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${snapshot.data.documents[index]["title"].toString().toUpperCase()}",
                            style: GoogleFonts.cabin(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            snapshot.data.documents[index]["subtitle"],
                            style: GoogleFonts.roboto(
                              color: Colors.white70,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => TrophiesDesc(
                                  title: snapshot.data.documents[index]
                                      ["title"],
                                  subtitle: snapshot.data.documents[index]
                                      ["subtitle"],
                                  featured: snapshot.data.documents[index]
                                      ["featured"],
                                  content: snapshot.data.documents[index]
                                      ["content"],
                                ),
                              ),
                            ),
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * .3,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                              ),
                              child: Center(
                                child: Text(
                                  "Know More",
                                  style: GoogleFonts.cabin(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }

  Padding middleWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
      child: Container(
        height: MediaQuery.of(context).size.height * .55,
        width: MediaQuery.of(context).size.width,
        child: Text(
          text,
          style: GoogleFonts.cabin(fontSize: 18, color: Colors.black54),
        ),
      ),
    );
  }

  Container topWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
          image: CachedNetworkImageProvider(
              "https://www.indiansuperleague.com/static-resources/waf-images/content/ae/43/93/0/vYAah2GPZq.jpg"),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 15.0,
          left: 12,
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "TROPHY ROOM",
            style: GoogleFonts.bebasNeue(
              color: Colors.white,
              fontSize: 45,
            ),
          ),
        ),
      ),
    );
  }
}
