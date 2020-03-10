import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:headless_cms_nodejs/pages/registration.dart';
import 'package:headless_cms_nodejs/api_connection/login_check.dart';
import 'package:headless_cms_nodejs/securePages/s_home.dart';
import 'package:flutter_keychain/flutter_keychain.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //saving values
  final email = TextEditingController();
  final password = TextEditingController();

  bool _chkEmail = false;
  bool _chkPass = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Login failed!"),
          content: new Text("Wrong authentication!"),
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

  void sendInfo() async{
    ApiConn instance= ApiConn(email:email.text, password: password.text);
    await instance.getRes();
    if(await FlutterKeychain.get(key: "authToken")!="null") {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => SecureHome()), (
          e) => false);
    }else{
      _showDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 20.0,),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/login_icon.png',
                  height: 60.0,
                ),
                SizedBox(height: 20.0,),
                Text('ACCOUNT LOGIN'),
              ],
            ),
            SizedBox(height: 120.0,),
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email address',
                filled: true,
                errorText: _chkEmail ? 'Value Can\'t Be Empty' : null,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 12.0,),
            TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                errorText: _chkPass ? 'Value Can\'t Be Empty' : null,
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: Text('Login'),
                  onPressed: (){
                    email.text.isNotEmpty && password.text.isNotEmpty ? sendInfo() :
                    setState(() {
                      email.text.isEmpty ? _chkEmail = true : _chkEmail = false;
                      password.text.isEmpty ? _chkPass = true : _chkPass = false;
                    });
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>AppliBar()));
                  }
                ),
                RaisedButton(
                  child: Text('Sign Up'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
                  },
                ),
                RaisedButton(
                  child: Text('SecurePage'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SecureHome()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
