import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintext,
    required this.label,
    this.maxLines = 1,
    this.controller,
    this.onChanged,
    required this.icon,
  });

  final String hintext;
  final int maxLines;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Widget label;
  final Widget icon;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: widget.controller,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white60,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.grey,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          prefixIcon: widget.icon,
          label: widget.label,
          hintText: widget.hintext,
        ),
      ),
    );
  }
}
