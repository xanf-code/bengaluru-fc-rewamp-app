import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForwardPlayersDetailed extends StatelessWidget {
  final String image;
  final String name;
  final String joined;
  final String born;
  final String debut;
  final String desc;
  final String number;
  final String honours;
  const ForwardPlayersDetailed(
      {Key key,
      this.image,
      this.name,
      this.joined,
      this.born,
      this.debut,
      this.desc,
      this.number,
      this.honours})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: nested(context),
    );
  }

  nested(context) {
    return NestedScrollView(
      headerSliverBuilder: (context, bool scrolled) {
        return [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height,
            floating: false,
            pinned: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.darken),
                    image: CachedNetworkImageProvider(image),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Text(
                            name,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_downward,
                      color: Colors.white54,
                      size: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ];
      },
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Text(
            "Number",
            style: GoogleFonts.bebasNeue(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
          ),
          Text(
            number,
            style: GoogleFonts.cabin(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Joined",
            style: GoogleFonts.bebasNeue(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
          ),
          Text(
            joined,
            style: GoogleFonts.poppins(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Born",
            style: GoogleFonts.bebasNeue(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
          ),
          Text(
            born,
            style: GoogleFonts.poppins(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Debut",
            style: GoogleFonts.bebasNeue(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
          ),
          Text(
            debut,
            style: GoogleFonts.poppins(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "About",
            style: GoogleFonts.bebasNeue(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
          ),
          Text(
            desc,
            style: GoogleFonts.poppins(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "honours",
            style: GoogleFonts.bebasNeue(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
          ),
          Text(
            honours,
            style: GoogleFonts.poppins(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
