import 'package:flutter/material.dart';

class WelcomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: RaisedButton(
          child: Text('Stream'),
          onPressed: () {
          Navigator.pushNamed(
            context,
          '/register');
        }),
      ),
    );
  }
}
