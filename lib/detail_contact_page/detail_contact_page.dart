import 'package:flutter/material.dart';
import 'package:flutter_contact_ui/add_contact_page/add_contact_page.dart';
import 'package:flutter_contact_ui/data/data.dart';
import 'package:flutter_contact_ui/detail_contact_page/features_device/mobile_details_contact.dart';
import 'package:flutter_contact_ui/detail_contact_page/features_device/website_details_contact.dart';
import 'package:flutter_contact_ui/home_page/home_page.dart';

// ignore: must_be_immutable
class DetailContactPage extends StatefulWidget {
  String name;
  String phone;
  String avatarText;
  int index;

  DetailContactPage(
      {super.key,
      required this.name,
      required this.phone,
      required this.avatarText,
      required this.index});

  @override
  State<DetailContactPage> createState() => _DetailContactPageState();
}

class _DetailContactPageState extends State<DetailContactPage> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void updateContact(String updatedName, String updatedPhone) {
    setState(() {
      widget.name = updatedName;
      widget.phone = updatedPhone;
      widget.avatarText = updatedName[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 70,
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                splashRadius: 22,
                color: const Color.fromRGBO(0, 0, 0, 1),
                onPressed: () {
                  Navigator.pop(context, {
                    'Name': widget.name,
                    'Phone': widget.phone,
                    'Index': widget.index,
                  });
                },
                icon: const Icon(Icons.arrow_back_ios_rounded, size: 28)),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: IconButton(
                    splashRadius: 22,
                    color: Colors.black,
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddContactPage(
                            contactData: {
                              'Name': widget.name,
                              'Phone': widget.phone,
                            },
                          ),
                        ),
                      );
                      if (result != null) {
                        updateContact(result['Name'], result['Phone']);

                        _scaffoldMessengerKey.currentState?.showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            behavior: SnackBarBehavior.floating,
                            margin: const EdgeInsets.all(20),
                            backgroundColor: Colors.grey[200],
                            content: const Text(
                              "Contact updated",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.edit, size: 28)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    splashRadius: 22,
                    color: Colors.black,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          title: const Text("Delete this contact?"),
                          content: const Text(
                              "All this contact data will be deleted"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel")),
                            ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)))),
                                onPressed: () {
                                  setState(() {
                                    listData.removeAt(widget.index);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MyHomePage(),
                                        ));
                                  });
                                  final scaffoldMessenger =
                                      ScaffoldMessenger.of(context);
                                  scaffoldMessenger.showSnackBar(
                                    SnackBar(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      behavior: SnackBarBehavior.floating,
                                      margin: const EdgeInsets.all(20),
                                      backgroundColor: Colors.white,
                                      content: const Text(
                                        "Contact deleted",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  );
                                },
                                child: const Text("Delete")),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete, size: 28)),
              ),
            ],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth <= 800) {
                return MobileDetailContact(
                    name: widget.name,
                    phone: widget.phone,
                    avatarText: widget.avatarText,
                    index: widget.index);
              } else {
                return WebsiteDetailContact(
                    name: widget.name,
                    phone: widget.phone,
                    avatarText: widget.avatarText,
                    index: widget.index);
              }
            },
          )),
    );
  }
}
