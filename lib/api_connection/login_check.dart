import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_keychain/flutter_keychain.dart';

class ApiConn{

  String email;
  String password;

  ApiConn({this.email, this.password});
  Future<void> getRes()async{
    //print('my key: $email and pass: $password');
    //saving token key
    // Write value

    try{
      //make the request
      Response response=await post(
        'http://netbro.ddns.net:3000/api/v2/signin',
        headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            'username': '$email',
            'password':'$password'
          })
      );
      Map data = jsonDecode(response.body);
      if(data['token'] !=null){//set authentication token
        await FlutterKeychain.put(key:"authToken", value:data['token']);
      }else{
        await FlutterKeychain.put(key:"authToken", value:"null");
        //print("fail login!");
      }
    }catch(e){
      print('Caught error: $e');
    }
  }
}