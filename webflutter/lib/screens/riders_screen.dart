// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RiderScreen extends StatefulWidget {
  const RiderScreen({super.key});

  @override
  State<RiderScreen> createState() => _RiderScreenState();
}

class _RiderScreenState extends State<RiderScreen> {
  //search and rider id var string
  // ignore: non_constant_identifier_names
  String SearchDriver = "";
  // ignore: non_constant_identifier_names
  String RiderId = "o";

  //fetch all riders and data refrence

  final riders = FirebaseDatabase.instance.ref("users");
  DatabaseReference userRef = FirebaseDatabase.instance.ref("users");

  //var for riders info
  var email, riderName, phone;

  //delete driver
  deletemethod() {
    userRef.child(RiderId).remove();
  }

  //list for selecting and changing listtile color

  List<bool> _selected = List.generate(1000, (i) => false);

  //fetch data method

  void retrieveRiderInfo(context) {
    //fetch user data
    userRef.child(RiderId).once().then((DatabaseEvent databaseEvent) {
      if (databaseEvent.snapshot.value != null) {
        setState(() {
          riderName = databaseEvent.snapshot.child("fullname").value.toString();
          email = databaseEvent.snapshot.child("email").value.toString();
          phone = databaseEvent.snapshot.child("phone").value.toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.message,
                    color: Colors.black,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notification_add,
                    color: Colors.black,
                  )),
            ),
          ],
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          title: Row(
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text("Home")),
              TextButton(onPressed: () {}, child: const Text("Contact"))
            ],
          ),
        ),
        body: Row(
          children: [
            Expanded(
                child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 9,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 10,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.black12)),
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            SearchDriver = value;
                                          });
                                        },
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(5),
                                            hintText: "Search Rider"),
                                      )),
                                ),
                              )),
                          Expanded(
                            flex: 3,
                            child: Card(
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(
                                  height: 40,
                                  onPressed: () {},
                                  color: const Color(0xffdc3545),
                                  child: const Text(
                                    "search",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 1000,
                        child: FirebaseAnimatedList(
                            query: riders,
                            itemBuilder:
                                ((context, snapshot, animation, index) {
                              if (SearchDriver.isEmpty) {
                                return GestureDetector(
                                  child: Card(
                                    elevation: 10,
                                    child: ListTile(
                                        onTap: () => setState(() {
                                              _selected = List<bool>.filled(
                                                  _selected.length, false);
                                              RiderId = snapshot.key.toString();
                                              retrieveRiderInfo(context);

                                              _selected[index] = true;
                                            }),
                                        tileColor: _selected[index]
                                            ? const Color(0xff17a2b8)
                                            : null,
                                        trailing:
                                            const Icon(Icons.message_outlined),
                                        leading: const CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSPWhDcrmhvY86Q42jr73c-812hSyMhO3DxTXRt2H6uxgiLKsnktZsZfJ-14AvPaqR01k&usqp=CAU"),
                                        ),
                                        title: Row(
                                          children: [
                                            Text(snapshot
                                                .child("fullname")
                                                .value
                                                .toString()),
                                          ],
                                        ),
                                        subtitle: Text(snapshot
                                            .child("email")
                                            .value
                                            .toString())),
                                  ),
                                );
                              }
                              if (snapshot
                                  .child("fullname")
                                  .value
                                  .toString()
                                  .toLowerCase()
                                  .contains(
                                      SearchDriver.toString().toLowerCase())) {
                                return GestureDetector(
                                  child: Card(
                                    elevation: 10,
                                    child: ListTile(
                                        onTap: () => setState(() {
                                              _selected = List<bool>.filled(
                                                  _selected.length, false);
                                              RiderId = snapshot.key.toString();
                                              retrieveRiderInfo(context);

                                              _selected[index] = true;
                                            }),
                                        tileColor: _selected[index]
                                            ? const Color(0xff17a2b8)
                                            : null,
                                        trailing:
                                            const Icon(Icons.message_outlined),
                                        leading: const CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSPWhDcrmhvY86Q42jr73c-812hSyMhO3DxTXRt2H6uxgiLKsnktZsZfJ-14AvPaqR01k&usqp=CAU"),
                                        ),
                                        title: Row(
                                          children: [
                                            Text(snapshot
                                                .child("fullname")
                                                .value
                                                .toString()),
                                          ],
                                        ),
                                        subtitle: Text(snapshot
                                            .child("email")
                                            .value
                                            .toString())),
                                  ),
                                );
                              }
                              return Container();
                            })))
                  ],
                ),
              ),
            )),
            Expanded(
                child: Card(
                    elevation: 10,
                    child: RiderId == "o"
                        ? const SizedBox(
                            child: Center(
                              child: Text(
                                "Select User",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black38),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container()),
                                        const CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSPWhDcrmhvY86Q42jr73c-812hSyMhO3DxTXRt2H6uxgiLKsnktZsZfJ-14AvPaqR01k&usqp=CAU"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(17.0),
                                          child: CircleAvatar(
                                              radius: 25,
                                              backgroundColor: Colors.grey[300],
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    deletemethod();
                                                    RiderId = "o";
                                                    _selected =
                                                        List<bool>.filled(
                                                            _selected.length,
                                                            false);
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      email.toString() == "null"
                                          ? ""
                                          : email.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: Colors.black12,
                                    ),
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [Text("Details")],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: Colors.black12,
                                    ),
                                    listtilewidget(
                                        "User Name",
                                        riderName.toString() == "null"
                                            ? "-"
                                            : riderName.toString()),
                                    listtilewidget(
                                        "User phone",
                                        phone.toString() == "null"
                                            ? "-"
                                            : phone.toString()),
                                    listtilewidget(
                                        "User Email",
                                        email.toString() == "null"
                                            ? "-"
                                            : email.toString()),
                                  ],
                                ),
                              ),
                            ),
                          )))
          ],
        ));
  }
}

listtilewidget(String text1, String text2) {
  return Card(
    elevation: 10,
    child: ListTile(
      dense: true,
      title: Text(text1),
      subtitle: Text(text2),
    ),
  );
}
