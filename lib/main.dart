//FORMAT CODE SHORTCUT: ctrl+alt+L

import 'package:flutter/material.dart';
import 'package:schulte_table_game/Greet.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Flutter Game',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Schulte Table Oyunu'),
        ),
        body: Center(
            child: GreetPage(),
        )
      ),
    );
  }
}


