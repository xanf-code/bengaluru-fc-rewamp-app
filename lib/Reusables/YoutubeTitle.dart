import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
        left: 10,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF011589),
        ),
      ),
    );
  }
}
