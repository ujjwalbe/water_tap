import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Container(
              child:
                  Center(child: Text('LOGO', style: TextStyle(fontSize: 30))),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.30),
            Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.3,
                    right: MediaQuery.of(context).size.width * 0.3),
                color: Colors.blue,
                child: Center(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/control');
                    },
                    child: Text('Register Device', style: TextStyle(fontSize: 17),),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
