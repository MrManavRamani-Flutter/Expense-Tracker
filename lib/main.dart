import 'package:expense_tracker/views/screens/home_page.dart';
import 'package:expense_tracker/views/welcome_screen/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'welcome',
      routes: {
        'welcome': (context) => const SplashScreen(),
        '/': (context) => HomePage(),
      },
    );
  }
}
