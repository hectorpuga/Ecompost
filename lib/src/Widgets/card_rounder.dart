import 'package:flutter/material.dart';

class CardRounder extends StatelessWidget {
  final Widget componentes;
  final double sizeWidth;
  final double sizeHeight;
  const CardRounder(
      {required this.componentes,
      Key? key,
      required this.sizeWidth,
      required this.sizeHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child:
            SizedBox(width: sizeWidth, height: sizeHeight, child: componentes),
      ),
    );
  }
}
