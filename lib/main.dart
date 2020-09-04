import 'package:connection_status_bar/connection_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomePage/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, _) => Stack(
        children: [
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MyHomePage(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConnectionStatusBar(
              color: Colors.red,
              lookUpAddress: "google.com",
              height: 35,
              title: Material(
                color: Colors.transparent,
                child: Text(
                  "Please check your internet connection",
                  style: GoogleFonts.ubuntu(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
