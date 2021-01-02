import 'dart:async';
import 'package:flutter/material.dart';
import 'package:schulte_table_game/Box.dart';

class GamePage extends StatefulWidget {
  final String name;

  GamePage({this.name});

  @override
  _GamePageState createState() => _GamePageState(name);
}

class _GamePageState extends State<GamePage> {
  String name;
  int nextInt = 1;
  int puan = 0;
  int _timeCounter = 60;
  Timer _timer;
  List<Box> boxList = new List<Box>();

  _GamePageState(this.name);

  void _startGame() {
    _timeCounter = 60;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeCounter > 0) {
          _timeCounter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void setBoxList(List boxList) {
    for (int i = 0; i < 25; i++) {
      Box temp = Box();
      temp.setIsFound(false);
      //    temp.setIsTouched(false);
      temp.setNumber(i + 1);
      boxList.add(temp);
    }
  }

  @override
  Widget build(BuildContext context) {
    setBoxList(boxList);
 //   boxList.shuffle(); //nedense karıştırma yaptığımda GestureDetector düzgün çalışmıyor

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Oyun Ekranı"),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text("Selam $name!",
                        style: Theme.of(context).textTheme.headline5),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(
                        child: Text(
                          "1 dakika içerisinde 1'den 25'e kadar olan tüm sayıları seç! Bol şans!",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    (_timeCounter == 60)
                        ? ElevatedButton(
                            onPressed: () => _startGame(),
                            child: Text("Başla!"))
                        : Text(
                            "$_timeCounter",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: (_timeCounter != 0 && _timeCounter != 60)
                    ? GridView.count(
                        crossAxisCount: 5,
                        // Generate 100 widgets that display their index in the List.
                        children: List.generate(25, (index) {
                          return GestureDetector(
                            onTap: () => {
                              if (boxList[index].getNumber()==nextInt){
                                  setState(() {
                                    boxList[index].setIsFound(true);
                                    puan += 10;
                                    nextInt++;
                                  })
                                }
                            },
                            child: BoxPage(
                              number: boxList[index].getNumber(),
                              isFound: boxList[index].getIsFound(),
                              //  isTouched: boxList[index].getIsTouched(),
                            ),
                          );
                        }),
                      )
                    : Center(
                        child: Column(
                          children: [
                            (_timeCounter == 0)
                                ? Text(
                                    "\nSüre Bitti!\n\nPuan: $puan",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  )
                                : Text(""),
                          ],
                        ),
                      ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Puan: $puan",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoxPage extends StatefulWidget {
  int number;
  bool isFound;

//  bool isTouched;

  BoxPage({this.number, this.isFound});

  @override
  _BoxPageState createState() => _BoxPageState(this.number, this.isFound);
}

class _BoxPageState extends State<BoxPage> {
  int number;
  bool isFound = false;

//  bool isTouched=false;

  _BoxPageState(this.number, this.isFound);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: (isFound) ? Text("") //burası neden çalışmıyor arkadaşa sor
              : Text("$number", style: Theme.of(context).textTheme.headline6,),
      ),
      //    color: isTouched ? Colors.green : Colors.white,
      color: Colors.greenAccent,

    );
  }
}
