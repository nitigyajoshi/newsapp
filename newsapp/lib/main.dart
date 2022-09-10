import 'package:flutter/material.dart';
import 'package:newsapp/home.dart';
//flutter run --no-sound-null-safety
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home:Scaffold(
body:

HomePage()
// ]

)


      
    );
  }
}
