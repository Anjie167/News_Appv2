import 'package:api_task/views/components/text_field_container.dart';
import 'package:flutter/material.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
     Key? key, required this.hintText, required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        style: const TextStyle(color: Colors.white),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white),
            hintText: hintText,
            border: InputBorder.none
        ),
      ),
    );
  }
}
