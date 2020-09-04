import 'package:bengaluru_fc/Model/ArticleModel.dart';
import 'package:bengaluru_fc/Navigation/featured/featuredDetails.dart';
import 'package:bengaluru_fc/helper/featured.dart';
import 'package:bengaluru_fc/helper/posts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:jiffy/jiffy.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:share/share.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';

class NewsScreen extends StatefulWidget {
  final String title;

  const NewsScreen({Key key, this.title}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool _loading = true;
  List<PostModel> articles = new List<PostModel>();
  List<FeaturedModel> features = new List<FeaturedModel>();

  @override
  void initState() {
    super.initState();
    featuredposts();
    getPosts();
  }

  //Featured : class name
  //featured : class list name
  //features : List name
  featuredposts() async {
    Featured featureClass = Featured();
    await featureClass.getFeaturedPosts();
    features = featureClass.featured;
    setState(() {
      _loading = false;
    });
  }

  getPosts() async {
    Posts postsClass = Posts();
    await postsClass.getPosts();
    articles = postsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF011589),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
                height: 35,
                width: 35,
                imageUrl:
                    "https://upload.wikimedia.org/wikipedia/en/thumb/5/52/Bengaluru_FC_logo.svg/1200px-Bengaluru_FC_logo.svg.png"),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: Image.asset("assets/loader/loader.gif"),
            )
          : RefreshIndicator(
              onRefresh: () => getPosts(),
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildStories(),
                    FeatureWidget(),
                    LatestNewsWidget(),
                    LatestNews(),
                  ],
                ),
              ),
            ),
    );
  }

  Container FeatureWidget() {
    return Container(
      height: 450,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: features.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => FeaturedDetails(
                  image: features[index].url,
                  title: features[index].title,
                  content: features[index].content,
                  url: features[index].link,
                  date: Jiffy(features[index].date).yMMMMd,
                ),
              ),
            ),
            child: Container(
              height: 450,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                  image: CachedNetworkImageProvider(
                    features[index].url,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 25,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xFFe20302),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "Featured",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            features[index].title,
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ListView LatestNews() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => FeaturedDetails(
                image: articles[index].url,
                title: articles[index].title,
                content: articles[index].content,
                url: articles[index].link,
                date: Jiffy(articles[index].date).yMMMMd,
              ),
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 3,
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      image: CachedNetworkImageProvider(
                        articles[index].url,
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () => Share.share(articles[index].link),
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
                  articles[index].title,
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
                  "${parse(articles[index].excerpt.toString()).documentElement.text}..",
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
                  right: 10,
                  bottom: 18,
                ),
                child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        "${Jiffy(articles[index].date).yMMMMd}",
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

  Column LatestNewsWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            top: 12,
          ),
          child: Text(
            "Latest News",
            style: GoogleFonts.ubuntu(
              color: Color(0xFF011589),
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 12.0,
            left: 8,
            top: 3,
          ),
          child: Container(
            height: 5,
            width: MediaQuery.of(context).size.width * .1,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }

  buildStories() {
    return Container(
      height: 110,
      child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("stories").snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length == null
                    ? 0
                    : snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  if (snapshot.data == null) {
                    return Center(
                      child: Image.asset("assets/loader/loader.gif"),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 8.0,
                      ),
                      child: Stories(
                        circlePadding: 2,
                        displayProgress: true,
                        storyCircleTextStyle: GoogleFonts.cabin(),
                        storyItemList: [
                          StoryItem(
                            name: snapshot.data.documents[index]["name"],
                            thumbnail: CachedNetworkImageProvider(
                              snapshot.data.documents[index]["thumbnails"],
                            ),
                            stories: [
                              Scaffold(
                                body: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                        snapshot.data.documents[index]["image"],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Scaffold(
                                body: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                        snapshot.data.documents[index]
                                            ["image2"],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                });
          }),
    );
  }
}
