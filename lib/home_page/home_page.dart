import 'package:flutter/material.dart';
import 'package:flutter_contact_ui/add_contact_page/add_contact_page.dart';
import 'package:flutter_contact_ui/data/data.dart';
import 'package:flutter_contact_ui/detail_contact_page/detail_contact_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List foundUser = [];

  @override
  void initState() {
    foundUser = listData;
    super.initState();
  }

  void runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = listData;
    } else {
      results = listData.where((user) {
        return user['Name']
            .toLowerCase()
            .contains(enteredKeyword.toLowerCase());
      }).toList();
    }

    setState(() {
      foundUser = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 4,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
                  child: TextField(
                    onChanged: (value) => runFilter(value),
                    autocorrect: false,
                    textInputAction: TextInputAction.search,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        labelText: "Find here",
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: "Search name",
                        hintStyle: TextStyle(fontSize: 18),
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Colors.black),
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
          const SizedBox(height: 10),
          listData.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "No contact yet...",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: foundUser.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ListTile(
                              contentPadding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              leading: CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.blue[700],
                                child: Text(
                                  foundUser[index]['Name'][0]
                                      .toString()
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              title: Text(foundUser[index]['Name'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              subtitle: Text(
                                foundUser[index]['Phone'],
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              trailing: const Icon(Icons.keyboard_arrow_right),
                              onTap: () async {
                                final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailContactPage(
                                            name: foundUser[index]['Name'],
                                            phone: foundUser[index]['Phone'],
                                            avatarText: foundUser[index]['Name']
                                                    [0]
                                                .toString()
                                                .toUpperCase(),
                                            index: index)));
                                if (result != null) {
                                  final updatedName = result['Name'];
                                  final updatedPhone = result['Phone'];
                                  final updatedIndex = result['Index'];

                                  setState(() {
                                    listData[updatedIndex]['Name'] =
                                        updatedName;
                                    listData[updatedIndex]['Phone'] =
                                        updatedPhone;
                                  });
                                }
                              }),
                          const Divider(height: 1, indent: 1)
                        ],
                      );
                    },
                  ),
                ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
        child: SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
              onPressed: () {},
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddContactPage()));
                  },
                  icon: const Icon(Icons.group_add, size: 30))),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomAppBar(
            color: Colors.white,
            child: Container(height: 60),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
