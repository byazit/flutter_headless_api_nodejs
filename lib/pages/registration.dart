import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:headless_cms_nodejs/api_connection/regi_check.dart';
import 'package:headless_cms_nodejs/pages/regi_success.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}
String key;

class _RegistrationState extends State<Registration> {

  //saving values
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();


  bool _chkEmail = false;
  bool _chkPass = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void showUserLogin() async{
    //ApiConn instance= ApiConn(userName:'test@email.com', password: '12345678');
    //await instance.getRes();
    //print(await storage.read(key: "password");)

    String authToken = await FlutterKeychain.get(key: "authToken");
    print("my value: "+authToken);
  }
  void sendInfo() async{
    RegiCheck instance = RegiCheck(firstName: firstName.text,lastName: lastName.text,email: email.text,password: password.text);
    await instance.setRes();
    if(await FlutterKeychain.get(key: "regStatus")=="true") {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => RegSuccess()), (
          e) => false);
    }else{
      _showDialog(await FlutterKeychain.get(key: "regStatusMsg"));
    }
  }

  void _showDialog(msg) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Registration failed!"),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //showUserLogin();
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
                    controller: firstName,
                    decoration: InputDecoration(
                      labelText: 'First Name (optional)',
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
                    controller: lastName,
                    decoration: InputDecoration(
                      labelText: 'Last Name (optional)',
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
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email (required)',
                      filled: true,
                      errorText: _chkEmail ? 'Value Can\'t Be Empty' : null,
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
                    controller: password,
                    decoration: InputDecoration(
                      labelText: 'Password (required)',
                      filled: true,
                      errorText: _chkPass ? 'Value Can\'t Be Empty' : null,
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
                        sendInfo();
                        setState(() {
                          email.text.isEmpty ? _chkEmail = true : _chkEmail = false;
                          password.text.isEmpty ? _chkPass = true : _chkPass = false;
                        });
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
