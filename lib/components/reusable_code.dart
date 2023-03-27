import 'package:flutter/material.dart';
class ReusableCode extends StatelessWidget {

  ReusableCode({required this.colour,required this.childCard,required this.onPress});
  final Color colour ;
  final Widget childCard;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}