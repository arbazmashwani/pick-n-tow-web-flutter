import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webflutter/firebase_options.dart';
import 'package:webflutter/screens/drawer_screen.dart';

import 'package:webflutter/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  var password = prefs.getString("password");
  runApp(MyApp(
    email: email,
    password: password,
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key, this.email, this.password});

  // ignore: prefer_typing_uninitialized_variables
  var email;
  // ignore: prefer_typing_uninitialized_variables
  var password;

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final Future<FirebaseApp> _initialize =
        Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
            future: _initialize,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.connectionState == ConnectionState.done) {
                  return email == null && password == null
                      ? const LoginPage()
                      : const DrawerScreen();
                }
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
