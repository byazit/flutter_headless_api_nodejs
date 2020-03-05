import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0,),
            Column(
              children: <Widget>[
                Image.asset('assets/login_icon.png'),
                SizedBox(height: 20.0,),
                Text('ACCOUNT LOGIN'),
              ],
            ),
            SizedBox(height: 120.0,),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email address',
                filled: true,
              ),
            ),
            SizedBox(height: 12.0,),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
              ),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
