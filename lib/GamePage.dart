import 'dart:async';
import 'package:flutter/material.dart';
import 'package:schulte_table_game/Box.dart';
import 'package:schulte_table_game/Greet.dart';

class GamePage extends StatefulWidget {
  final String name;
  List<Box> boxList = new List<Box>();

  GamePage({this.name, this.boxList});

  @override
  _GamePageState createState() => _GamePageState(name, boxList);
}

class _GamePageState extends State<GamePage> {
  String name;
  List<Box> boxList = new List<Box>();
  int nextInt = 1;
  int puan = 0;
  int _timeCounter = 30;
  Timer _timer;

  _GamePageState(this.name, this.boxList);

  void _startGame() {
    _timeCounter = 30;
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

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      _timer.cancel();
      super.dispose();
    }

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Oyun Sayfası"),
        ),
        body: (puan == 250)
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Kazandın!\n\nPuanın: $puan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          nextInt = 1;
                          puan = 0;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Material(child: GreetPage())));
                        },
                        child: Text("Tekrar Oyna",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)))
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Text("SELAM $name!",
                              style: Theme.of(context).textTheme.headline5),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Center(
                              child: Text(
                                "30 saniye içerisinde 1'den 25'e kadar olan tüm sayıları seç! Bol şans!",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black45,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          (_timeCounter == 30)
                              ? ElevatedButton(
                                  onPressed: () => _startGame(),
                                  child: Text("Başla!",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)))
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
                      child: (_timeCounter != 0 && _timeCounter != 30)
                          ? GridView.count(
                              crossAxisCount: 5,
                              children: List.generate(25, (index) {
                                return GestureDetector(
                                  onTap: () => {
                                    if (boxList[index].getNumber() == nextInt)
                                      {
                                        setState(() {
                                          boxList[index].setIsFound(true);
                                          puan += 10;
                                          nextInt++;
                                        })
                                      }
                                  },
                                  child: MyBox(
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
                                      ? Column(
                                          children: [
                                            Text('Kaybettin!\n\nPuanın: $puan',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  nextInt = 1;
                                                  puan = 0;
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Material(
                                                                  child:
                                                                      GreetPage())));
                                                },
                                                child: Text("Tekrar Oyna",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)))
                                          ],
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

class MyBox extends StatelessWidget {
  int number;
  bool isFound;

  MyBox({this.number, this.isFound});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: (isFound)
            ? Container(
                child: Text(""),
              )
            : Container(
                child: Center(
                  child: Text(
                    "$number",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                color: Colors.orange,
                width: 60,
                height: 60,
              ),
      ),
      //   color: Colors.blue,
    );
  }
}
