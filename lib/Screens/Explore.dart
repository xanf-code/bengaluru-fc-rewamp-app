import 'package:bengaluru_fc/Pages/NewsPage.dart';
import 'package:bengaluru_fc/Pages/Standings/standings.dart';
import 'package:bengaluru_fc/Pages/stadium/fortess.dart';
import 'package:bengaluru_fc/Pages/teams/players.dart';
import 'package:bengaluru_fc/Pages/trophies/trophy.dart';
import 'package:bengaluru_fc/Screens/watch.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreScreen extends StatefulWidget {
  final String title;

  const ExploreScreen({Key key, this.title}) : super(key: key);
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF011589),
        title: Text(widget.title),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => NewsPage(),
                          ),
                        ),
                        child: Boxes(
                          image:
                              "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2018/09/30/737761-bengaluru-fc-pti.jpg",
                          title: "News",
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Players(),
                          ),
                        ),
                        child: Boxes(
                          image:
                              "https://images.outlookindia.com/public/uploads/articles/2019/11/9/Bengaluru-FC-Twitter-2_571_855.jpg",
                          title: "Team",
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () => launch(
                            "https://www.youtube.com/channel/UC2BEzuBTbjuVzEdDD5Z6-Nw"),
                        child: Boxes(
                          image:
                              "https://assets.khelnow.com/news/uploads/2019/10/RON_2610.jpg",
                          title: "BFC TV",
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        child: Boxes(
                          image:
                              "https://images.outlookindia.com/public/uploads/articles/2020/6/5/Bengaluru-FC-ISL_571_855.jpg",
                          title: "Fixtures",
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Standings(),
                          ),
                        ),
                        child: Boxes(
                          image:
                              "https://images.outlookindia.com/public/uploads/articles/2020/6/5/Bengaluru-FC-ISL_571_855.jpg",
                          title: "Standings",
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => FortressPage(),
                          ),
                        ),
                        child: Boxes(
                          image:
                              "https://i1.wp.com/www.bengalurufc.com/wp-content/uploads/2018/09/Fortress-Kanteerava.jpg?fit=1500%2C700&ssl=1",
                          title: "Fortress",
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: InkWell(
                        child: Boxes(
                          image:
                              "https://cdn.shopify.com/s/files/1/1612/0223/products/Bengaluru-FC-Jersey-Home-Kit-2019-20-Front-Design-Kit-GalaxT_1024x1024.jpg?v=1570436466",
                          title: "Shop",
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Trophies(),
                          ),
                        ),
                        child: Boxes(
                          image:
                              "https://statics.sportskeeda.com/wp-content/uploads/2013/10/bengaluru-fc-john-johnson-1973420.jpg",
                          title: "Trophies",
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () => launch("https://www.bengalurufc.com/"),
                        child: Boxes(
                          image:
                              "https://i1.wp.com/www.bengalurufc.com/wp-content/uploads/2019/05/A.jpg?fit=1500%2C800&ssl=1",
                          title: "Website",
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () => launch("https://www.bengalurufc.com/"),
                        child: Boxes(
                          image:
                              "https://pbs.twimg.com/media/EgXP9CWUYAArgtT.jpg",
                          title: "Help",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//News
//Team
//BFCTV
//FixtureTables
//Shop
//History
//Help
//Website

class Boxes extends StatelessWidget {
  final String image;
  final String title;

  const Boxes({
    Key key,
    this.image,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(image),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          bottom: 10,
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: GoogleFonts.abel(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
