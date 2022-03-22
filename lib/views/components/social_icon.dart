import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final Function() press;
  const SocialIcon({
    Key? key, required this.icon, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Icon(icon, size: 30,),
    );
  }
}
