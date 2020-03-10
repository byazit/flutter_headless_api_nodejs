import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:headless_cms_nodejs/pages/home.dart';

class RegSuccess extends StatefulWidget {
  @override
  _RegSuccessState createState() => _RegSuccessState();
}

class _RegSuccessState extends State<RegSuccess> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Success'),
      ),
      body:Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
              padding: EdgeInsets.all(15.0),
              height: 50.0,
              width: 400.0,
              color: Colors.green,
              child: Text(
                'Registration success. Please check your email.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 0.0),
              child: ButtonBar(
                  children: <Widget>[
                    RaisedButton(
                        child: Text('Login'),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                        }
                    ),
                  ]
              ),
            )
          ],
        ),
      )
    );
  }
}

/*
* SizedBox(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('We send you and email. Please check your email.'),
        ),
      )
* */
