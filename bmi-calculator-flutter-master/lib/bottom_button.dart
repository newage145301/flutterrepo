import 'package:flutter/material.dart';
import 'constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.label, this.onTap});
  final String label;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            label,
            style: kLargeButtonStyle,
          ),
        ),
      ),
    );
  }
}
