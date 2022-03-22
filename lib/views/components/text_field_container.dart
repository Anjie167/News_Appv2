import 'package:flutter/material.dart';


class TextFieldContainer extends StatelessWidget {

  final Widget child;

  const TextFieldContainer({
     Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.06,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.brown[200],
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
