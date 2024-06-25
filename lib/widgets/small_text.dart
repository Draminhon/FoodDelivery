import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
   Color? color;
  final String? text;
  double size;
  double height;
  TextAlign textalign;
   SmallText({super.key,  this.color = const Color(0xFFccc7c5),
   required this.text,
this.height = 1.2,
    this.size =12,
    this.textalign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
       text!,
       
       style: TextStyle(color: color, fontFamily: 'Roboto', fontSize: size, height: height,),
       textAlign: textalign,
    );
  }
}