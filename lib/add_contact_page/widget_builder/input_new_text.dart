import 'package:flutter/material.dart';

class InputNewText extends StatelessWidget {
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final IconData icon;
  final Color iconColor;
  final String labelText;
  final TextEditingController controller;
  final Function onFieldSubmitted;

  const InputNewText({
    super.key,
    required this.textInputType,
    required this.textInputAction,
    required this.icon,
    required this.iconColor,
    required this.labelText,
    required this.controller,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: TextFormField(
            controller: controller,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  gapPadding: 6,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: const OutlineInputBorder(
                gapPadding: 6,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.blue),
              ),
              icon: Icon(icon),
              iconColor: iconColor,
              labelText: labelText,
              labelStyle: TextStyle(fontSize: 16, color: Colors.grey[500]),
              contentPadding: const EdgeInsets.all(20),
            ),
            onFieldSubmitted: (value) {
              onFieldSubmitted;
            },
          ),
        ),
      ),
    );
  }
}