import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bengaluru_fc/Pages/YTDescription/DescriptionPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:octo_image/octo_image.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
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
                      child: Stack(
                        children: [
                          Container(
                            height: 260,
                            width: 190,
                            margin: EdgeInsets.only(
                              right: 10,
                              left: 10,
                              top: 5,
                            ),
                            child: OctoImage(
                              fit: BoxFit.cover,
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                              ),
                              image: CachedNetworkImageProvider(
                                data[index]["snippet"]["thumbnails"]
                                            ["maxres"] ==
                                        null
                                    ? "https://i.ibb.co/1npBMcW/placeholder.png"
                                    : data[index]["snippet"]["thumbnails"]
                                        ["maxres"]["url"],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 0,
                            child: Container(
                                height: 40,
                                width: 40,
                                color: Color(0xFF0033ff),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                )),
                          ),
                        ],
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
