import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintext,
    required this.label,
    this.maxLines = 1,
    this.controller,
    this.onChanged,
    required this.icon,
    this.keyboardType,
  });

  final String? hintext;
  final int maxLines;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Widget label;
  final Widget icon;
  final TextInputType? keyboardType;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 65,
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      // margin: EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        controller: widget.controller,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white60,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xFF018786),
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
