// @dart = 2.8
import 'package:flutter/material.dart';

import 'User.dart';
import 'package:lode/user_local_page.dart';




void main(){ runApp(MyApp());}

class MyApp extends StatelessWidget {
  static final String title = 'YellowClass';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primarySwatch: Colors.yellow,
      backgroundColor: Colors.yellow,
    ),
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {Future<List<User>> futureAlbum;

  @override
  Widget build(BuildContext context) => Scaffold(backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text('Yclasses'),
      ),
      body: UserLocalPage());
}
