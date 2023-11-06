import 'package:flutter/material.dart';
import 'package:flutter_contact_ui/detail_contact_page/widget_builder/button_contact.dart';

// ignore: must_be_immutable
class MobileDetailContact extends StatefulWidget {
  String name;
  String phone;
  String avatarText;
  int index;

  MobileDetailContact({
    super.key,
    required this.name,
    required this.phone,
    required this.avatarText,
    required this.index,
  });

  @override
  State<MobileDetailContact> createState() => _MobileDetailContactState();
}

class _MobileDetailContactState extends State<MobileDetailContact> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 100,
                  child: Text(widget.avatarText,
                      style: const TextStyle(fontSize: 70)),
                ),
                const SizedBox(height: 20),
                Text(widget.name, style: const TextStyle(fontSize: 30)),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        ButtonContact(iconContact: Icons.call),
                        SizedBox(height: 10),
                        Text("Call")
                      ],
                    ),
                    Column(
                      children: [
                        ButtonContact(iconContact: Icons.message),
                        SizedBox(height: 10),
                        Text("Message")
                      ],
                    ),
                    Column(
                      children: [
                        ButtonContact(iconContact: Icons.videocam_rounded),
                        SizedBox(height: 10),
                        Text("Video")
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
            child: Text(
              "Contact Info",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ListTile(
                    leading:
                        const Icon(Icons.call, size: 38, color: Colors.black),
                    title: Text(
                      widget.phone,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "Phone Number",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
