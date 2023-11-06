import 'package:flutter/material.dart';
import 'package:flutter_contact_ui/detail_contact_page/widget_builder/button_contact.dart';

// ignore: must_be_immutable
class WebsiteDetailContact extends StatefulWidget {
  String name;
  String phone;
  String avatarText;
  int index;

  WebsiteDetailContact({
    super.key,
    required this.name,
    required this.phone,
    required this.avatarText,
    required this.index,
  });

  @override
  State<WebsiteDetailContact> createState() => _WebsiteDetailContactState();
}

class _WebsiteDetailContactState extends State<WebsiteDetailContact> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 120,
                  child: Text(widget.avatarText,
                      style: const TextStyle(fontSize: 70)),
                ),
                const SizedBox(height: 20),
                Text(widget.name, style: const TextStyle(fontSize: 30)),
                const SizedBox(height: 30),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Text(
                    "Contact Info",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  constraints:
                      const BoxConstraints(maxWidth: 300, maxHeight: 80),
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.call,
                            size: 38, color: Colors.black),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          ButtonContact(iconContact: Icons.call),
                          SizedBox(height: 10),
                          Text("Call")
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          ButtonContact(iconContact: Icons.message),
                          SizedBox(height: 10),
                          Text("Message")
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          ButtonContact(iconContact: Icons.videocam_rounded),
                          SizedBox(height: 10),
                          Text("Video")
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
