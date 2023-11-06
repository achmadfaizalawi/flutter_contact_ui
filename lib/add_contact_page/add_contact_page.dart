import 'package:flutter/material.dart';
import 'package:flutter_contact_ui/add_contact_page/widget_builder/input_new_text.dart';
import 'package:flutter_contact_ui/data/data.dart';
import 'package:flutter_contact_ui/home_page/home_page.dart';

// ignore: must_be_immutable
class AddContactPage extends StatefulWidget {
  Map? contactData;
  String pageTitle = "New Contact";

  AddContactPage({super.key, this.contactData});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.contactData != null) {
      final name = widget.contactData!['Name'] as String;
      final nameParts = name.split(' ');
      widget.pageTitle = "Edit Contact";

      if (nameParts.length >= 2) {
        firstNameController.text = nameParts[0];
        lastNameController.text = nameParts.sublist(1).join(' ');
      } else {
        firstNameController.text = name;
      }
      phoneNumberController.text = widget.contactData!['Phone'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 70,
          leading: IconButton(
              splashRadius: 22,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
          title: Text(
            widget.pageTitle,
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 700,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: CircleAvatar(
                      radius: 60,
                      child: Icon(Icons.person, size: 80),
                    ),
                  ),
                  InputNewText(
                      onFieldSubmitted: () {},
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      icon: Icons.person,
                      iconColor: Colors.black,
                      labelText: "First name",
                      controller: firstNameController),
                  InputNewText(
                      onFieldSubmitted: () {},
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      icon: Icons.person,
                      iconColor: Colors.white,
                      labelText: "Last name",
                      controller: lastNameController),
                  const SizedBox(height: 10),
                  InputNewText(
                      onFieldSubmitted: () {},
                      textInputType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      icon: Icons.call,
                      iconColor: Colors.black,
                      labelText: "Phone number",
                      controller: phoneNumberController),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              onPressed: () {
                                String firstName =
                                    firstNameController.text.trim();
                                String lastName =
                                    lastNameController.text.trim();
                                String phoneNumber =
                                    phoneNumberController.text.trim();

                                if (firstName.isNotEmpty &&
                                    phoneNumber.isNotEmpty) {
                                  String fullname = "$firstName $lastName";

                                  if (widget.contactData != null) {
                                    setState(() {
                                      final editedContact = {
                                        'Name': fullname,
                                        'Phone': phoneNumber
                                      };
                                      Navigator.pop(context, {
                                        'Name': editedContact['Name'],
                                        'Phone': editedContact['Phone'],
                                      });
                                    });
                                  } else {
                                    setState(() {
                                      listData.add({
                                        'Name': fullname,
                                        'Phone': phoneNumber
                                      });
                                      firstNameController.text = "";
                                      lastNameController.text = "";
                                      phoneNumberController.text = "";

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyHomePage()));
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
                                            "New contact created",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      );
                                    });
                                  }
                                }
                              },
                              child: const Text("Save",
                                  style: TextStyle(fontSize: 16))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
