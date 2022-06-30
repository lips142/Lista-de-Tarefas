import 'package:flutter/material.dart';
import 'package:flutter_application_1/initial/initial_view.dart';
import 'package:flutter_application_1/List/toDo_list_page.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
