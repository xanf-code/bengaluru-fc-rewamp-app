import 'package:bengaluru_fc/Navigation/featured/featuredDetails.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'dart:convert' as convert;

import 'package:share/share.dart';

class TabsCategories extends StatefulWidget {
  final String url;

  const TabsCategories({Key key, this.url}) : super(key: key);

  @override
  _TabsCategoriesState createState() => _TabsCategoriesState();
}

class _TabsCategoriesState extends State<TabsCategories>
    with AutomaticKeepAliveClientMixin<TabsCategories> {
  List data;
  bool _loading = true;

  @override
  void initState() {
    getTabsData();
    super.initState();
  }

  getTabsData() async {
    var url = widget.url;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      data = jsonResponse;
      setState(() {
        _loading = false;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: _loading
          ? Center(
              child: Image.asset("assets/loader/loader.gif"),
            )
          : _buildListView(),
    );
  }

  _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length == null ? 0 : data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => FeaturedDetails(
                image: data[index]["jetpack_featured_media_url"],
                title: data[index]["title"]["rendered"],
                content: data[index]["content"]["rendered"],
                url: data[index]["link"],
                date: Jiffy(data[index]["date"]).yMMMMd,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 0,
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      image: CachedNetworkImageProvider(
                        data[index]["jetpack_featured_media_url"],
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () => Share.share(data[index]["link"]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Ionicons.ios_share_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                  top: 10,
                ),
                child: Text(
                  data[index]["title"]["rendered"],
                  style: GoogleFonts.ptSans(
                    color: Color(0xFF011589),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 10.0,
                  right: 10,
                ),
                child: Text(
                  "${parse(data[index]["excerpt"]["rendered"].toString()).documentElement.text}..",
                  maxLines: 2,
                  style: GoogleFonts.montserrat(
                    color: Colors.blueGrey,
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 6,
                  left: 10.0,
                  bottom: 18,
                ),
                child: Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width * .3,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LineAwesomeIcons.clock_o,
                        color: Colors.blueAccent,
                        size: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${Jiffy(data[index]["date"]).yMMMMd}",
                        style: GoogleFonts.montserrat(
                          color: Colors.blueAccent,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
