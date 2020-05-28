import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Fetch Data Example 1'),
          ),
          body: homeScreen()),
    );
  }
}

Widget homeScreen() {
  return Stack(children: <Widget>[
    _buildBackground(),
    _buildBalance(),
    _buildProfile(),
    _buildRechargeBtn(),
    Positioned(
      top: 1,
      height: 100,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.all(10.0),
      ),
    )
  ]);
}

Widget _buildBackground() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Expanded(
        flex: 1,
        child: Container(
          color: Colors.black,
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          color: Colors.green,
        ),
      )
    ],
  );
}

Widget _buildBalance() {
  TextStyle kTextStyle = TextStyle(color: Colors.white);

  return Positioned(
    top: 30,
    left: 15,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Your Balance is",
          style: kTextStyle,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Rs",
              style: kTextStyle,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "2000.02",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildProfile() {
  TextStyle kTextStyle = TextStyle(color: Colors.white);

  return Positioned(
    top: 30,
    right: 15,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Asif Rehman",
          style: kTextStyle,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "0333 9933886",
              style: kTextStyle,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildRechargeBtn() {
  return Positioned(
    top: 80.0,
    left: 10.0,
    right: 10.0,
    child: RaisedButton(
      color: Colors.yellow[700],
      child: Text("Tap To Recharge"),
      onPressed: () {
        print('button');
      },
    ),
  );
}
