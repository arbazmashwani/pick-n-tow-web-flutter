import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final List<ListTile> _selected = List.generate(
      50,
      (i) => const ListTile(
            title: Text("Drivers"),
          ));
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
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(5),
                                            hintText: "Search Driver"),
                                      )),
                                ),
                              )),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MaterialButton(
                                height: 60,
                                onPressed: () {},
                                color: const Color(0xffdc3545),
                                child: const Text(
                                  "search",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1000,
                      child: ListView.builder(
                        itemCount: _selected.length,
                        itemBuilder: ((context, index) {
                          return Card(
                            elevation: 10,
                            child: ListTile(
                              trailing: const Icon(Icons.message_outlined),
                              leading: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSPWhDcrmhvY86Q42jr73c-812hSyMhO3DxTXRt2H6uxgiLKsnktZsZfJ-14AvPaqR01k&usqp=CAU"),
                              ),
                              title: Row(
                                children: [
                                  Text("DRIVER $index"),
                                  const Icon(
                                    Icons.circle,
                                    color: Colors.red,
                                    size: 15,
                                  )
                                ],
                              ),
                              subtitle: Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            )),
            Expanded(
                child: Card(
              elevation: 10,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey[300],
                              child: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                          ),
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
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Driver 1",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.black12,
                      ),
                      const Text(
                        "Driver Details:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.black12,
                      ),
                      listtilewidget("Phone Number", "1261969"),
                      listtilewidget("Tips", "3"),
                      listtilewidget("Cnic", "42401-128981"),
                      listtilewidget("Vehicle Name", "Mehran"),
                      listtilewidget("Vehicle number", "62890120"),
                      listtilewidget("Vehicle Type", "Premium")
                    ],
                  ),
                ),
              ),
            ))
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
