import 'package:flutter/material.dart';
import 'package:schulte_table_game/Box.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ResultChart extends StatefulWidget {
  List<Box> data;
  ResultChart(this.data);
  @override
  _ResultChartState createState() => _ResultChartState(data);
}

class _ResultChartState extends State<ResultChart> {
  List<Box> data;

  _ResultChartState(this.data);

  @override
  Widget build(BuildContext context) {
    Comparator<Box> cmp = (a, b) => a.getNumber().compareTo(b.getNumber());
    data.sort(cmp);

    List<charts.Series<Box, String>> seri = [
      charts.Series(
          id: "Result",
          data: data,
          domainFn: (Box box, _) => box.number.toString(),
          measureFn: (Box box, _) => box.spentTime,
      )
    ];

    return Container(
      height: 200,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
                child: charts.BarChart(seri, animate: true,)
              )
        ),
      ),
    );
  }
}
