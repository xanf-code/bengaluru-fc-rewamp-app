import 'package:bengaluru_fc/Model/leaguetable.dart';
import 'package:bengaluru_fc/helper/table.dart';
import 'package:flutter/material.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class Standings extends StatefulWidget {
  @override
  _StandingsState createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  bool _loading = true;
  List<TableModel> tables = new List<TableModel>();

  getTable() async {
    Standing tableClass = Standing();
    await tableClass.getStandings();
    tables = tableClass.table;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    getTable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF011589),
          title: Text(
            "Standings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
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
                text: "Season 2019-2020",
              ),
              Tab(
                text: "Season 2020-2021",
              ),
            ],
          ),
        ),
        body: _loading
            ?Center(
          child: Image.asset("assets/loader/loader.gif"),
        )
            : TabBarView(
                children: [
                  buildTable(),
                  Center(
                    child: Text("2020-2021"),
                  ),
                ],
              ),
      ),
    );
  }

  SingleChildScrollView buildTable() {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: tables.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Text(tables[index].name),
                    title: Text(
                      tables[index].played.toString(),
                    ),
                    trailing: Text(
                      tables[index].win.toString(),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
