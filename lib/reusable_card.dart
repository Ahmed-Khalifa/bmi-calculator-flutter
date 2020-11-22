import 'package:flutter/material.dart';

class ReusbleCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  ReusbleCard({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        child: this.cardChild,
        height: 200.0,
        width: 170.0,
        margin: EdgeInsets.only(left: 15.0, top: 15.0),
        decoration: BoxDecoration(
          color: this.colour,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
