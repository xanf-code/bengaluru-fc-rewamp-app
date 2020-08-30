import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';

class FortressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 450,
            stretch: true,
            backgroundColor: Colors.transparent,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
              ],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  OctoImage(
                    image: CachedNetworkImageProvider(
                        'https://i1.wp.com/www.bengalurufc.com/wp-content/uploads/2018/09/Fortress-Kanteerava.jpg?w=1500&ssl=1'),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                    ),
                    errorBuilder: OctoError.icon(color: Colors.red),
                    fit: BoxFit.cover,
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
                Content(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 8, top: 8),
          child: Text(
            'The Fortress',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 30,
              color: Color(0xFFec202a),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12),
          child: Text(
            "From the close and magical confines of the Bangalore Football Stadium where the Bengaluru FC dream began, the club moved to the significantly bigger Kanteerava Stadium with a capacity of 25,000 in the 2014-15 season amid a lot of apprehension, but also with large doses of ambition. The stadium, dubbed the Fortress, has been our stomping ground ever since.\n\nBFC’s first ever game at the Kanteerava was a goalless draw against Goan side Dempo SC on January 11, 2015, the memory of which captain Sunil Chhetri says he’s happy to erase after a rare missed penalty denied the Blues a dream start at their new home. The talisman has however made more than just amends since, treating the turf as his fiefdom and leading out a team of champions week in, week out of those passages painted blue, white and red.\n\nSuch has been Bengaluru’s dominance at home that former manager Albert Roca has never lost a game at the Fortress in AFC Cup competition across the two seasons he spent with the club.\n\nOn April 17, 2016 the Fortress had its moment of glory when the Blues lifted the I-League title beating Salgaocar 2-0 in front of frenzied home support and there have more than just a few special nights since. The 3-1 win against Johor Darul Ta’zim that sent the Blues to the AFC Cup final and into the history books, the 7-0 show against DSK Shivajians, the come-from-behind 3-1 win over East Bengal – the moments refuse to cease as does the magic.",
            style: GoogleFonts.poppins(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        CachedNetworkImage(
            imageUrl:
                "https://i0.wp.com/www.bengalurufc.com/wp-content/uploads/2018/09/Stadium-Map.jpg?resize=1067%2C800&ssl=1"),
      ],
    );
  }
}
