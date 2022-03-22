import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color, textColor;

  const RoundedButton({
    Key? key, required this.text, required this.press, this.color = Colors.blue, this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(29),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: size.width * 0.35,
      height: size.height * 0.06,
      child: Center(
        child: Text(
          text, style: TextStyle(color: textColor, fontSize: 20),),
      ),
    );
  }
}
