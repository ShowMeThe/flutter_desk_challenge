import 'package:flutter/material.dart';

import 'WindowSizeService.dart';
import 'ui/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var service = WindowSizeService();
    service.initialize();
    return MaterialApp(
      title: 'Flutter Weather',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: HomePage(),
      ),
    );
  }
}



