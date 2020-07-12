import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_task/widgets/button-date.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  DateTime _currentTime = DateTime.now();
  List _currentTimeList = new List();

  @override
  void initState() {
    // Initialize _currentTimeList value
    for (var x = -1; x < 6; x++) {
      _currentTimeList.add({
        'date': _currentTime.add(Duration(days: x)),
        'selected': x == 0 ? true : false
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 35.0, top: 100.0, right: 35.0),
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: '${DateFormat('dd MMMM y').format(_currentTime)}\n',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                height: 1.5,
                color: Colors.grey),
            children: <TextSpan>[
              TextSpan(
                  text: 'Daily Lunch\n',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.black)),
              TextSpan(
                  text:
                      'Plan your daily lunch based on the contents of your fridge',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                      color: Colors.grey[800])),
            ],
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _currentTimeList.length,
              itemBuilder: (BuildContext ctx, int index) {
                return ButtonDate(
                  dateTime: _currentTimeList[index]['date'],
                  selected: _currentTimeList[index]['selected'],
                );
              }),
        ),
        FlatButton(
            onPressed: () {},
            child: Text('Get Recommendation',
                style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ))
      ],
    );
  }
}
