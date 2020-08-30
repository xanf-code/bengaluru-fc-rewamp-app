import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class TrophiesDesc extends StatelessWidget {
  final String featured;
  final String title;
  final String subtitle;
  final String content;

  const TrophiesDesc(
      {Key key, this.featured, this.title, this.subtitle, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildNestedScrollView(),
    );
  }

  NestedScrollView buildNestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            snap: false,
            backgroundColor: Colors.transparent,
            expandedHeight: 500,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: featured,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Text(
              title,
              style: GoogleFonts.bebasNeue(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              subtitle,
              style: GoogleFonts.abel(
                color: Color(0xFFe31118),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              content,
              style: GoogleFonts.poppins(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
