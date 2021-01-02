import 'package:flutter/material.dart';
import 'package:schulte_table_game/GamePage.dart';

class GreetPage extends StatefulWidget {
  GreetPage({Key key}) : super(key: key);

  @override
  _GreetPageState createState() => _GreetPageState();
}

class _GreetPageState extends State<GreetPage> {
  final _formKey = GlobalKey<FormState>();
  String rumuz;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Rumuz giriniz',
                focusColor: Colors.red,
              ),
              onChanged: (value){
                rumuz=value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>GamePage(name: rumuz))
                );
              },
              child: Text('Oyuna Gir'),
            ),
          ),
        ],
      ),
    );
  }
}
