import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.color,
    required this.textColor,
    required this.iconColor,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final Function() onTap;
  final Color? color;
  final Color textColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(27, 8, 0, 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        height: size.height * 0.1,
        width: size.width * 0.48,
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 40,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
