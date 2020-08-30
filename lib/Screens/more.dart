import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  final String title;

  const MoreScreen({Key key, this.title}) : super(key: key);
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF011589),
        title: Text(widget.title),
        centerTitle: false,
      ),
      body: Center(
        child: Text("More"),
      ),
    );
  }
}
