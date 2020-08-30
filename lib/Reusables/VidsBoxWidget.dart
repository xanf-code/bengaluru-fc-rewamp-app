import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bengaluru_fc/Pages/YTDescription/DescriptionPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class VidsBoxWidget extends StatelessWidget {
  const VidsBoxWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: Row(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => DescPage(
                            title: data[index]["snippet"]["title"],
                            desc: data[index]["snippet"]["description"],
                            videoId: data[index]["contentDetails"]["videoId"],
                          ),
                        ),
                      ),
                      child: Container(
                        height: 260,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.darken),
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                              data[index]["snippet"]["thumbnails"]["maxres"] ==
                                      null
                                  ? "https://ss.thgim.com/football/article30810548.ece/alternates/FREE_380/bengaluru-fcjpg"
                                  : data[index]["snippet"]["thumbnails"]
                                      ["maxres"]["url"],
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            bottom: 15,
                            right: 8,
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              data[index]["snippet"]["title"],
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
