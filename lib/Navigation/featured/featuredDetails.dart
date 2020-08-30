import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class FeaturedDetails extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final String url;
  final String date;
  const FeaturedDetails(
      {Key key, this.image, this.title, this.content, this.url, this.date})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: nested(context),
    );
  }

  nested(context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () => Share.share(
                    'check out this article by Bengaluru FC ${url}'),
                child: Icon(Ionicons.ios_share_alt),
              ),
            ),
          ],
          snap: false,
          backgroundColor: Colors.transparent,
          expandedHeight: 500,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
            ],
            background: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CachedNetworkImage(
                      imageUrl: "https://i.ibb.co/1npBMcW/placeholder.png"),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, 0.5),
                      end: Alignment(0.0, 0.0),
                      colors: <Color>[
                        Color(0x60000000),
                        Color(0x00000000),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              PostWidget(date: date, title: title, content: content),
            ],
          ),
        ),
      ],
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key key,
    @required this.date,
    @required this.title,
    @required this.content,
  }) : super(key: key);

  final String date;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 12,
            left: 12.0,
            right: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 7,
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
                        "${date}",
                        style: GoogleFonts.montserrat(
                          color: Colors.blueAccent,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                title,
                style: GoogleFonts.cabin(
                  color: Color(0xFF011589),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 3),
                child: Container(
                  height: 7,
                  width: MediaQuery.of(context).size.width * .35,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Html(
            data: content,
            onLinkTap: (url) {
              launch(url);
            },
            style: {
              "h3": Style.fromTextStyle(
                GoogleFonts.openSans(
                  fontSize: 17,
                  color: Colors.black87,
                ),
              ),
              "p": Style.fromTextStyle(
                GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            },
          ),
        ),
      ],
    );
  }
}
