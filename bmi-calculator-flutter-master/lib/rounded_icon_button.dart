import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({this.icon, this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
