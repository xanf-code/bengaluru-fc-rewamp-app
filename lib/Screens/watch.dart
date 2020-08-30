import 'dart:convert' as convert;
import 'package:bengaluru_fc/Constants/Const.dart';
import 'package:bengaluru_fc/Reusables/VidsBoxWidget.dart';
import 'package:bengaluru_fc/Reusables/YoutubeTitle.dart';
import 'package:bengaluru_fc/Reusables/YoutubeWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Watchpage extends StatefulWidget {
  final String title;

  const Watchpage({Key key, this.title}) : super(key: key);

  @override
  _WatchpageState createState() => _WatchpageState();
}

class _WatchpageState extends State<Watchpage>
    with AutomaticKeepAliveClientMixin<Watchpage> {
  bool _loading = true;
  List fortressData; //1
  List FOBFCdata; //2
  List Bulletins; //3
  List weAreBFC; //4
  List cares; //5
  List colts; //6
  List academy; //7
  List school; //8
  List kit; //9
  List focus; //10

  Future<String> AllYoutubeData() async {
    var fortessresponse = await http.get(firstUrl);
    if (fortessresponse.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(fortessresponse.body);
      fortressData = jsonResponse;
      setState(() {
        _loading = false;
      });
    }
    var fobfcResponse = await http.get(secondUrl);
    if (fobfcResponse.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(fobfcResponse.body);
      FOBFCdata = jsonResponse;
      setState(() {
        _loading = false;
      });
    }
    var bullteinResponse = await http.get(thirdUrl);
    if (bullteinResponse.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(bullteinResponse.body);
      Bulletins = jsonResponse;
      setState(() {
        _loading = false;
      });
    }
    var wearebfcresp = await http.get(fourthUrl);
    if (wearebfcresp.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(wearebfcresp.body);
      weAreBFC = jsonResponse;
      setState(() {
        _loading = false;
      });
    }
    var caresresp = await http.get(five);
    if (caresresp.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(caresresp.body);
      cares = jsonResponse;
      setState(() {
        _loading = false;
      });
    }
    var coltsresp = await http.get(six);
    if (coltsresp.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(coltsresp.body);
      colts = jsonResponse;
      setState(() {
        _loading = false;
      });
    }
    var acadresp = await http.get(seven);
    if (acadresp.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(acadresp.body);
      academy = jsonResponse;
      setState(() {
        _loading = false;
      });
    }
    var schoolresp = await http.get(eight);
    if (schoolresp.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(schoolresp.body);
      school = jsonResponse;
      setState(() {
        _loading = false;
      });
    }
    var kitresp = await http.get(nine);
    if (kitresp.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(kitresp.body);
      kit = jsonResponse;
      setState(() {
        _loading = false;
      });
    }
    var focusresp = await http.get(ten);
    if (focusresp.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(focusresp.body);
      focus = jsonResponse;
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    AllYoutubeData();
    super.initState();
  }

  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF011589),
        title: Text(widget.title),
        centerTitle: false,
      ),
      body: _loading
          ? Center(
              child: Image.asset("assets/loader/loader.gif"),
            )
          : ListView(
              children: [
                VidsBoxWidget(data: weAreBFC),
                TitleWidget(
                  title: "The Fortress",
                ),
                MainWidget(data: fortressData),
                TitleWidget(
                  title: "Friends of BFC",
                ),
                MainWidget(data: FOBFCdata),
                TitleWidget(
                  title: "Bulletins,Episodes,Updates",
                ),
                SizedBox(
                  height: 10,
                ),
                VidsBoxWidget(data: Bulletins),
                TitleWidget(
                  title: "BFC Cares",
                ),
                MainWidget(data: cares),
                TitleWidget(
                  title: "BFC Colts",
                ),
                MainWidget(data: colts),
                TitleWidget(
                  title: "Academy Diaries",
                ),
                SizedBox(
                  height: 10,
                ),
                VidsBoxWidget(data: academy),
                TitleWidget(
                  title: "Soccer Schools",
                ),
                MainWidget(data: school),
                TitleWidget(
                  title: "Kit Launch",
                ),
                MainWidget(data: kit),
                TitleWidget(
                  title: "Blues in focus",
                ),
                SizedBox(
                  height: 10,
                ),
                VidsBoxWidget(data: focus),
              ],
            ),
    );
  }
}
