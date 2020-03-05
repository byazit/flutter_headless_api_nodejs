import 'package:flutter/material.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:headless_cms_nodejs/pages/home.dart';


class SecureHome extends StatefulWidget {
  @override
  _SecureHomeState createState() => _SecureHomeState();
}

class _SecureHomeState extends State<SecureHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkToken();
  }

  void checkToken() async{
    if(await FlutterKeychain.get(key: "authToken")=="null"){
      Navigator.pop(context);
    }
  }
  void logout()async{
    await FlutterKeychain.put(key:"authToken", value:"null");
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => Home()), (
        e) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[300],
        appBar: AppBar(
          title: Text('Secure Home'),
        ),
        drawer: new Drawer(
            child: new ListView(
              children: <Widget> [
                new DrawerHeader(child: new Text('Menu'),),
                new ListTile(
                  title: new Text('First Menu Item'),
                  onTap: () {},
                ),
                new ListTile(
                  title: new Text('Second Menu Item'),
                  onTap: () {},
                ),
                new Divider(),
                new ListTile(
                  title: new Text('Logout'),
                  onTap: () {
                    logout();
                  },
                ),
              ],
            )
        ),
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/tick.png',
                        height: 60.0,
                      ),
                      SizedBox(height: 20.0,),
                      Text('Login success'),
                    ],
                  ),
                ]
            )
        )
    );
  }
}

