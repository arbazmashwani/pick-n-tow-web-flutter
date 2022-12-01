import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webflutter/screens/driver_scree.dart';
import 'package:webflutter/screens/homepage.dart';
import 'package:webflutter/screens/login.dart';
import 'package:webflutter/screens/riders_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final List<Widget> _screens = [
    const MyHomePage(),
    const DriverScreen(),
    const RiderScreen(),
    Container(
      color: Colors.green,
    ),
  ];

  int _selectedindex = 0;

  callScreens() {
    return _screens[_selectedindex];
  }

  final List<bool> _selected = List.generate(4, (i) => false);
  List options = ["Dashboard", "Drivers", "Riders", "Reports"];
  final List<Icon> iconslist = [
    const Icon(
      Icons.dashboard,
      color: Colors.white,
    ),
    const Icon(
      Icons.verified,
      color: Colors.white,
    ),
    const Icon(
      Icons.people,
      color: Colors.white,
    ),
    const Icon(
      Icons.report,
      color: Colors.white,
    )
  ];
  @override
  void initState() {
    _selected[0] = true;
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Scaffold(
                backgroundColor: const Color(0xff212529),
                appBar: AppBar(
                  backgroundColor: const Color(0xff212529),
                  title: Row(
                    children: const [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            "${(kDebugMode && kIsWeb) ? "" : "assets/"}icon.png"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Pick and Tow",
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  ),
                  toolbarHeight: 60,
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 6, right: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xff17a2b8),
                        ),
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            children: [
                              const Expanded(
                                  flex: 3,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSPWhDcrmhvY86Q42jr73c-812hSyMhO3DxTXRt2H6uxgiLKsnktZsZfJ-14AvPaqR01k&usqp=CAU"),
                                    radius: 40,
                                  )),
                              Expanded(
                                  flex: 6,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Welcome:",
                                        style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold,
                                          decorationColor: Colors.black,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                        ),
                                      ),
                                      Text(
                                        "Admin Tuaha",
                                        style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold,
                                          decorationColor: Colors.black,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: options.length,
                        itemBuilder: (_, i) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 5),
                            child: ListTile(
                              tileColor: _selected[i]
                                  ? const Color(0xff17a2b8)
                                  : null, // If current item is selected show blue color
                              title: Row(
                                children: [
                                  iconslist[i],
                                  const SizedBox(width: 15),
                                  Text(
                                    options[i],
                                    style: const TextStyle(
                                        letterSpacing: 3,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              onTap: () => setState(() {
                                _selected[0] = false;
                                _selected[1] = false;
                                _selected[2] = false;
                                _selected[3] = false;

                                _selected[i] = !_selected[i];

                                _selectedindex = i;
                                callScreens();
                              }), // Reverse bool value
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.white),
                        ),
                        onPressed: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.remove("email");
                          pref.remove("password");
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: const Text(
                          "logout",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              )),
          Expanded(flex: 10, child: callScreens())
        ],
      ),
    );
  }
}
