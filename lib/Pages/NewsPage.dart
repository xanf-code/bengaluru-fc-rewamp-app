import 'package:bengaluru_fc/Pages/Nested/NestedTabsRoutes.dart';
import 'package:flutter/material.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF011589),
          title: Text("News"),
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
                indicatorHeight: 3,
                indicatorColor: Colors.red,
                indicatorSize:
                    MD2IndicatorSize.full //3 different modes tiny-normal-full
                ),
            tabs: <Widget>[
              Tab(
                text: "Academy",
              ),
              Tab(
                text: "BFC B",
              ),
              Tab(
                text: "ಕನ್ನಡ",
              ),
              Tab(
                text: "Club News",
              ),
              Tab(
                text: "Blueprint",
              ),
              Tab(
                text: "Matches",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabsCategories(
              url:
                  "https://www.bengalurufc.com/wp-json/wp/v2/posts?categories=152",
            ),
            TabsCategories(
              url:
                  "https://www.bengalurufc.com/wp-json/wp/v2/posts?categories=151",
            ),
            TabsCategories(
              url:
                  "https://www.bengalurufc.com/wp-json/wp/v2/posts?categories=232",
            ),
            TabsCategories(
              url:
                  "https://www.bengalurufc.com/wp-json/wp/v2/posts?categories=10",
            ),
            TabsCategories(
              url:
                  "https://www.bengalurufc.com/wp-json/wp/v2/posts?categories=304",
            ),
            TabsCategories(
              url:
                  "https://www.bengalurufc.com/wp-json/wp/v2/posts?categories=182",
            ),
          ],
        ),
      ),
    );
  }
}
