import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function () callback;

  const CalculatorButton({
    super.key, 
    required this.text,
    required this.fillColor,
    required this.textColor,
    required this.textSize, 
    required this.callback,
  });

  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
         width: 70,
         height: 70,
      child: ElevatedButton(
        onPressed: () => callback(),
          child: Text(
            text,
            style: TextStyle(
           fontSize: textSize, color: Colors.white,
          ),
        ),
          style: ElevatedButton.styleFrom(
            primary: Color(fillColor),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ), 
    );
  }
}