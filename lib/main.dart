import 'package:flutter/material.dart';
import 'package:my_github_api/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Github API App',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home:HomePage()
    );
  }
}