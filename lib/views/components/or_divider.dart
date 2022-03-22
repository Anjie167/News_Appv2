import 'package:flutter/material.dart';

import '../../constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key, this.login = true}) : super(key: key);
 final bool login;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: [
          buildDivider(),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text( login ?'OR Sign In With' : 'OR Sign Up With', style: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),),
          ),
          buildDivider(),
        ],
      ),
    );
  }



  Expanded buildDivider() {
    return const Expanded(
      child: Divider(
        color: Color(0xFFD9D9D9),
        height: 1.5,
      ),
    );
  }
}
