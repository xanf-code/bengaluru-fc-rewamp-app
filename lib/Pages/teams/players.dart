import 'package:bengaluru_fc/Pages/teams/detailed.dart';
import 'package:bengaluru_fc/Pages/teams/staffDetailed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class Players extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF011589),
          title: Text("Squad"),
          centerTitle: false,
          bottom: TabBar(
            labelStyle: TextStyle(
                //up to your taste
                fontWeight: FontWeight.w700),
            indicatorSize: TabBarIndicatorSize.label, //makes it better
            labelColor: Colors.white, //Google's sweet blue
            unselectedLabelColor: Colors.white60, //niceish grey
            isScrollable: true, //up to your taste
            indicator: MD2Indicator(
                //it begins here
                indicatorHeight: 3,
                indicatorColor: Colors.red,
                indicatorSize:
                    MD2IndicatorSize.full //3 different modes tiny-normal-full
                ),
            tabs: <Widget>[
              Tab(
                text: "First Team",
              ),
              Tab(
                text: "Staff",
              ),
              Tab(
                text: "U-18",
              ),
              Tab(
                text: "U-15",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MainPageTab(),
            StaffTab(context),
            Container(
              child: Center(
                child: Text("U-15"),
              ),
            ),
            Container(
              child: Center(
                child: Text("U-18"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView MainPageTab() {
    return ListView(
      children: [
        TextWidget(
          title: "Forwards",
        ),
        PositionWidget(
          position: "Forwards",
        ),
        TextWidget(
          title: "Midfielders",
        ),
        PositionWidget(
          position: "Midfielders",
        ),
        TextWidget(
          title: "GoalKeepers",
        ),
        PositionWidget(
          position: "Goalkeepers",
        ),
      ],
    );
  }

  StaffTab(context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: Firestore.instance.collection("Staff").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Image.asset("assets/loader/loader.gif"),
                  );
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => CoachDetailed(
                              image: snapshot.data.documents[index]["featured"],
                              name: snapshot.data.documents[index]["name"],
                              born: snapshot.data.documents[index]["born"],
                              joined: snapshot.data.documents[index]["joined"],
                              desc: snapshot.data.documents[index]["role"],
                              honours: snapshot.data.documents[index]["honors"],
                            ),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                snapshot.data.documents[index]["image"],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String title;
  const TextWidget({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        top: 10,
        bottom: 10,
      ),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: Color(0xFFd10a11),
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class PositionWidget extends StatelessWidget {
  final String position;
  const PositionWidget({
    Key key,
    this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      height: 450,
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: Firestore.instance.collection(position).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Image.asset("assets/loader/loader.gif"),
                  );
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ForwardPlayersDetailed(
                              image: snapshot.data.documents[index]["cover"],
                              name: snapshot.data.documents[index]["name"],
                              born: snapshot.data.documents[index]["born"],
                              joined: snapshot.data.documents[index]["joined"],
                              desc: snapshot.data.documents[index]["desc"],
                              debut: snapshot.data.documents[index]["debut"],
                              number: snapshot.data.documents[index]["jersey"],
                              honours: snapshot.data.documents[index]
                                  ["honours"],
                            ),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                snapshot.data.documents[index]["image"],
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                snapshot.data.documents[index]["jersey"],
                                style: GoogleFonts.abel(
                                  color: Color(0xFFd10a11),
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
