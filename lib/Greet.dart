import 'package:flutter/material.dart';
import 'package:schulte_table_game/GamePage.dart';
import 'package:schulte_table_game/Box.dart';

class GreetPage extends StatefulWidget {
  GreetPage({String oldname});

  @override
  _GreetPageState createState() => _GreetPageState();
}

class _GreetPageState extends State<GreetPage> {
  String rumuz;

  List<Box> setBoxList() {
    List<Box> boxList = new List<Box>();
    for (int i = 0; i < 25; i++) {
      Box temp = Box();
      temp.setIsFound(false);
      //    temp.setIsTouched(false);
      temp.setNumber(i + 1);
      boxList.add(temp);
    }
    boxList.shuffle();
    return boxList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dikkat Ölçme Oyunu'),
        ),
        body: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/brain-logo.png", width: 100,),
              Text("BRAIN STORM",style: TextStyle(color:Colors.orange)),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Rumuz giriniz',
                  ),
                  onChanged: (value) {
                    rumuz = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    List<Box> boxList = setBoxList();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            GamePage(name: rumuz, boxList: boxList)));
                  },
                  child: Text('Oyuna Gir',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ));
  }
}
