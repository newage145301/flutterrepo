import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({@required this.color, this.cardChild,this.onPress});

  final Widget cardChild;
  final Color color;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
        child: cardChild,
      ),
    );
  }
}