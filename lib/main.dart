import 'package:flutter/material.dart';
import 'package:google_maps/Screens/HomePage.dart';
import 'package:google_maps/Screens/UsersList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wine Maps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        '/wineMaps': (context) => HomePage(),
        '/usersList': (context) => UsersList(),
      },
      home: const HomePage(),
    );
  }
}
