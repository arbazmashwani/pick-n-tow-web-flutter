import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'package:webflutter/widgets/containers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ref = FirebaseDatabase.instance.ref("rideRequest");
  final driverRegisteredRefrence = FirebaseDatabase.instance.ref("drivers");
  final userRegisteredRefrence = FirebaseDatabase.instance.ref("users");
  final ridesRefrence = FirebaseDatabase.instance.ref("rideRequest");
  final availableDriversRefrence =
      FirebaseDatabase.instance.ref("driversAvailable");

  final driversnamelist = FirebaseDatabase.instance.ref();

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
        backgroundColor: Colors.grey[300],
        body: Card(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                            child: streamBuilderMethod(
                                driverRegisteredRefrence.onValue,
                                "Drivers Registered",
                                Icons.people,
                                const Color(0xff007bff))),
                        const SizedBox(width: 5),
                        Expanded(
                            child: streamBuilderMethod(
                                userRegisteredRefrence.onValue,
                                "Riders Registered",
                                Icons.people,
                                const Color(0xff28a745))),
                        const SizedBox(width: 5),
                        Expanded(
                            child: streamBuilderMethod(
                                ridesRefrence.onValue,
                                "Total Rides",
                                Icons.people,
                                const Color(0xffffc107))),
                        const SizedBox(width: 5),
                        Expanded(
                            child: streamBuilderMethod(
                                availableDriversRefrence.onValue,
                                "Available Drivers",
                                Icons.people,
                                const Color(0xffdc3545))),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 9, right: 9),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 8,
                            child: Card(
                                elevation: 100,
                                child: Container(
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      const Text("New Drivers Requests"),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                      Card(
                                        elevation: 5,
                                        child: ListTile(
                                          leading: circleavatarwidget(),
                                          title: const Text("ali khan"),
                                          subtitle: const Text(
                                              "hammad164598@yahoo.com"),
                                          trailing: MaterialButton(
                                            color: Colors.redAccent,
                                            onPressed: () {},
                                            child: const Text(
                                              "Approve",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        elevation: 5,
                                        child: ListTile(
                                          leading: circleavatarwidget(),
                                          title: const Text("ali khan"),
                                          subtitle: const Text(
                                              "hammad164598@yahoo.com"),
                                          trailing: MaterialButton(
                                            color: Colors.redAccent,
                                            onPressed: () {},
                                            child: const Text(
                                              "Approve",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        elevation: 5,
                                        child: ListTile(
                                          leading: circleavatarwidget(),
                                          title: const Text("ali khan"),
                                          subtitle: const Text(
                                              "hammad164598@yahoo.com"),
                                          trailing: MaterialButton(
                                            color: Colors.redAccent,
                                            onPressed: () {},
                                            child: const Text(
                                              "Approve",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        elevation: 5,
                                        child: ListTile(
                                          leading: circleavatarwidget(),
                                          title: const Text("ali khan"),
                                          subtitle: const Text(
                                              "hammad164598@yahoo.com"),
                                          trailing: MaterialButton(
                                            color: Colors.redAccent,
                                            onPressed: () {},
                                            child: const Text(
                                              "Approve",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        elevation: 5,
                                        child: ListTile(
                                          leading: circleavatarwidget(),
                                          title: const Text("ali khan"),
                                          subtitle: const Text(
                                              "hammad164598@yahoo.com"),
                                          trailing: MaterialButton(
                                            color: Colors.redAccent,
                                            onPressed: () {},
                                            child: const Text(
                                              "Approve",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        elevation: 5,
                                        child: ListTile(
                                          leading: circleavatarwidget(),
                                          title: const Text("ali khan"),
                                          subtitle: const Text(
                                              "hammad164598@yahoo.com"),
                                          trailing: MaterialButton(
                                            color: Colors.redAccent,
                                            onPressed: () {},
                                            child: const Text(
                                              "Approve",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ))),
                        Expanded(
                            flex: 3,
                            child: Card(
                              elevation: 100,
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    const Text(
                                      "Recent Rides Requests:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decorationColor: Colors.black,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 450,
                                      child: FirebaseAnimatedList(
                                          query: ref,
                                          itemBuilder: ((context, snapshot,
                                              animation, index) {
                                            return Card(
                                              elevation: 10,
                                              child: cardwidget(
                                                  snapshot
                                                      .child("rider_name")
                                                      .value
                                                      .toString(),
                                                  snapshot
                                                      .child(
                                                          "destination_address")
                                                      .value
                                                      .toString(),
                                                  Icons.done,
                                                  Colors.green),
                                            );
                                          })),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  cardwidget(String title, String address, IconData iconData, Color color) {
    return Card(
        elevation: 10,
        child: ListTile(
          leading: const Icon(Icons.maps_home_work),
          trailing: Icon(
            iconData,
            color: color,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              decorationColor: Colors.black,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
          subtitle: Text(address),
        ));
  }

  streamBuilderMethod(
      Stream stream, String name, IconData iconData, Color color) {
    return StreamBuilder(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return totalinfoContainer("error", name, iconData, color);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return totalinfoContainer("0", name, iconData, color);
          }

          final List<dynamic> storedocs = [];

          Map<String, dynamic>? map = snapshot.data.snapshot.value as dynamic;

          storedocs.clear();

          storedocs.add(map == null ? [] : map.values.toList());

          return totalinfoContainer(
              // ignore: unnecessary_null_comparison
              storedocs == null ? "0" : storedocs[0].length.toString(),
              name,
              iconData,
              color);
        });
  }

  circleavatarwidget() {
    return const CircleAvatar(
      backgroundImage: NetworkImage(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3WEmfJCME77ZGymWrlJkXRv5bWg9QQmQEzw&usqp=CAU"),
    );
  }
}
