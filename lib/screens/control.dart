import 'package:flutter/material.dart';

class ControlCenter extends StatefulWidget {
  @override
  _ControlCenterState createState() => _ControlCenterState();
}

class _ControlCenterState extends State<ControlCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
          ),
          Container(
            child: Center(child: Text('LOGO', style: TextStyle(fontSize: 30))),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.30),
          Container(
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stream');
              },
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Text('TP1234'),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Icon(Icons.control_point),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
