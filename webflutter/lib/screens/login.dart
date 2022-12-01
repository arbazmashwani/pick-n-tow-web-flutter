// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webflutter/screens/drawer_screen.dart';

// ignore: camel_case_types
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller = TextEditingController();

  TextEditingController controller1 = TextEditingController();

  bool saveme = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff48546b).withOpacity(1),
        child: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Card(
            elevation: 10,
            child: SizedBox(
              child: Card(
                elevation: 10,
                child: SizedBox(
                  child: Row(
                    children: [
                      const Expanded(
                          child: SizedBox(
                        child: Image(image: AssetImage("assets/icon.png")),
                      )),
                      Expanded(
                          child: Card(
                        elevation: 10,
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.black12,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "UserName",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ],
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.black12)),
                                    child: TextField(
                                      controller: controller,
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.all(5),
                                          hintText: "Enter Email"),
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "Password",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ],
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.black12)),
                                    child: TextField(
                                      obscureText: true,
                                      controller: controller1,
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.all(5),
                                          hintText: "Enter Password"),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        value: saveme,
                                        onChanged: (valu) {
                                          setState(() {
                                            saveme = !saveme;
                                          });
                                        }),
                                    const Text("Remember")
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      height: 40,
                                      child: MaterialButton(
                                        onPressed: () async {
                                          if (saveme) {
                                            SharedPreferences pref =
                                                await SharedPreferences
                                                    .getInstance();
                                            if (controller.text == "admin" &&
                                                controller1.text == "admin") {
                                              pref.setString(
                                                  "email", controller.text);
                                              pref.setString(
                                                  "password", controller1.text);
                                              // ignore: use_build_context_synchronously
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const DrawerScreen()),
                                                (Route<dynamic> route) => false,
                                              );
                                            } else {
                                              FlutterError("message no found");
                                            }
                                          } else {
                                            if (controller.text == "admin" &&
                                                controller1.text == "admin") {
                                              // ignore: use_build_context_synchronously
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const DrawerScreen()),
                                                (Route<dynamic> route) => false,
                                              );
                                            } else {
                                              FlutterError("message no found");
                                            }
                                          }
                                        },
                                        color: const Color(0xff6610f2),
                                        child: const Text(
                                          "Login",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
