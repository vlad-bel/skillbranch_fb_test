import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:skillbox_fb_test/screens/details_screen.dart';
import 'package:skillbox_fb_test/screens/login_screen/login_screen.dart';
import 'package:skillbox_fb_test/screens/main_screen.dart';
import 'firebase_utls/analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      home: LoginScreen(),
    );
  }
}
