import 'package:api_task/views/components/text_field_container.dart';
import 'package:flutter/material.dart';


class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  const RoundedPasswordField({
    Key? key, required this.onChanged, required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        style: const TextStyle(color: Colors.white),
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.white),
            hintText: hintText,
            border: InputBorder.none
        ),
      ),
    );
  }
}
