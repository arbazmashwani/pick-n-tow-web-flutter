// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({super.key});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  //search and driver id var string
  // ignore: non_constant_identifier_names
  String SearchDriver = "";
  // ignore: non_constant_identifier_names
  String DriverId = "o";

  //fetch all drivers and data refrence

  final drivers = FirebaseDatabase.instance.ref("drivers");
  DatabaseReference userRef = FirebaseDatabase.instance.ref("drivers");

  DatabaseReference availability =
      FirebaseDatabase.instance.ref("driversAvailable");

  //var for drivers info
  var email, driverName, phone, vehicletype, vehicleNumber, vehicleColor;
  Color ratingTitleC = Colors.black;
  double starCounter = 0;
  int tripCounter = 0;
  String earnings = '---';
  String driverOnline = '';

  //delete driver
  deletemethod() {
    userRef.child(DriverId).remove();
  }

  //list for selecting and changing listtile color

  List<bool> _selected = List.generate(1000, (i) => false);

  //fetch data method

  void retrieveDriverInfoyInfo(context) {
    //fetch user data
    userRef.child(DriverId).once().then((DatabaseEvent databaseEvent) {
      if (databaseEvent.snapshot.value != null) {
        setState(() {
          driverName =
              databaseEvent.snapshot.child("fullname").value.toString();
          email = databaseEvent.snapshot.child("email").value.toString();
          phone = databaseEvent.snapshot.child("phone").value.toString();
          vehicletype = databaseEvent.snapshot
              .child("vehicle_details")
              .child("car_type")
              .value
              .toString();
          vehicleColor = databaseEvent.snapshot
              .child("vehicle_details")
              .child("car_color")
              .value
              .toString();
          vehicleNumber = databaseEvent.snapshot
              .child("vehicle_details")
              .child("vehicle_number")
              .value
              .toString();
        });
      }
    });

    //rating fetching
    userRef
        .child(DriverId)
        .child('ratings')
        .once()
        .then((DatabaseEvent databaseEvent) {
      if (databaseEvent.snapshot.value != null) {
        double ratings = double.parse(databaseEvent.snapshot.value.toString());
        setState(() {
          starCounter = ratings;
        });
      }
    });

    //check driver availability
    availability.child(DriverId).once().then((DatabaseEvent databaseEvent) {
      if (databaseEvent.snapshot.value != null) {
        setState(() {
          driverOnline = "Online";
        });
      } else {
        setState(() {
          driverOnline = "Offline";
        });
      }
    });

    //retrieve and display Earnings
    userRef
        .child(DriverId)
        .child('earnings')
        .once()
        .then((DatabaseEvent databaseEvent) {
      if (databaseEvent.snapshot.value != null) {
        setState(() {
          earnings = databaseEvent.snapshot.value.toString();
        });
      }
    });

    //retrieve and display Trip History
    userRef
        .child(DriverId)
        .child('history')
        .once()
        .then((DatabaseEvent databaseEvent) {
      if (databaseEvent.snapshot.value != null) {
        //update total number of trip counts to provider
        Map<dynamic, dynamic> keys = databaseEvent.snapshot.value as Map;
        setState(() {
          tripCounter = keys.length;
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
                                            hintText: "Search Driver"),
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
                            query: drivers,
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
                                              DriverId =
                                                  snapshot.key.toString();
                                              retrieveDriverInfoyInfo(context);

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
                                            Text(
                                                "$index---${snapshot.child("fullname").value.toString()}"),
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
                                              DriverId =
                                                  snapshot.key.toString();
                                              retrieveDriverInfoyInfo(context);

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
                                            Text(
                                                "$index---${snapshot.child("fullname").value.toString()}"),
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
                    child: DriverId == "o"
                        ? const SizedBox(
                            child: Center(
                              child: Text(
                                "Select Driver",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black38),
                              ),
                            ),
                          )
                        : SizedBox(
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
                                            child: CircleAvatar(
                                              radius: 25,
                                              backgroundColor: Colors.grey[300],
                                              child: const Icon(
                                                Icons.map,
                                                color: Colors.green,
                                                size: 25,
                                              ),
                                            )),
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
                                                    DriverId = "o";
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
                                    DriverId == "o"
                                        ? Container()
                                        : Container(
                                            color: driverOnline == "Online"
                                                ? Colors.green
                                                : Colors.red,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  driverOnline,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                    const Divider(
                                      thickness: 1,
                                      color: Colors.black12,
                                    ),
                                    listtilewidget(
                                        "Driver Name",
                                        driverName.toString() == "null"
                                            ? "-"
                                            : driverName.toString()),
                                    listtilewidget(
                                        "Driver phone",
                                        phone.toString() == "null"
                                            ? "-"
                                            : phone.toString()),
                                    listtilewidget(
                                        "Driver Email",
                                        email.toString() == "null"
                                            ? "-"
                                            : email.toString()),
                                    listtilewidget(
                                        "Vehicle Number",
                                        vehicleNumber.toString() == "null"
                                            ? "-"
                                            : vehicleNumber.toString()),
                                    listtilewidget(
                                        "Vehicle colour",
                                        vehicleColor.toString() == "null"
                                            ? "-"
                                            : vehicleColor.toString()),
                                    listtilewidget(
                                        "Vehicle Type",
                                        vehicletype.toString() == "null"
                                            ? "-"
                                            : vehicletype.toString()),
                                    listtilewidget(
                                        "Rating Star", starCounter.toString()),
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
