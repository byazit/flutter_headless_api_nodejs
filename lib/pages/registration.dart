import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_keychain/flutter_keychain.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}
String key;

class _RegistrationState extends State<Registration> {
  void showUserLogin() async{
    //ApiConn instance= ApiConn(userName:'test@email.com', password: '12345678');
    //await instance.getRes();
    //print(await storage.read(key: "password");)

    String authToken = await FlutterKeychain.get(key: "authToken");
    print("my value: "+authToken);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              //color: Colors.amber[500],
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              //color: Colors.amber[500],
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                    ),
                  )
                ],
              ),
            ),Container(
              padding: EdgeInsets.all(5.0),
              //color: Colors.amber[500],
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              //color: Colors.amber[500],
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,//for password
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              //color: Colors.amber[500],
              child: Column(
                children: <Widget>[
                  RaisedButton(
                      child: Text('Sign Up'),
                      onPressed: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>AppliBar()));
                      }
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
