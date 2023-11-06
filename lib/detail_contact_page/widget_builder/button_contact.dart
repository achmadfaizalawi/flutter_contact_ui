import 'package:flutter/material.dart';

class ButtonContact extends StatelessWidget {
  final IconData iconContact;

  const ButtonContact({
    super.key,
    required this.iconContact,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: Colors.blue[700]),
      child: IconButton(
          onPressed: () {},
          icon: Icon(iconContact, color: Colors.white, size: 28)),
    );
  }
}