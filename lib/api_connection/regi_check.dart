import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:headless_cms_nodejs/pages/regi_success.dart';

class RegiCheck{

  String firstName;
  String lastName;
  String email;
  String password;

  RegiCheck({this.firstName,this.lastName,this.email,this.password});

  Future<void> setRes()async {
    try{
      //make the request
      Response response=await post(
          'http://netbro.ddns.net:3000/api/v2/signup',
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            'firstname':'$firstName',
            'lastname':'$lastName',
            'username': '$email',
            'password':'$password'
          })
      );
      Map data = jsonDecode(response.body);
      await FlutterKeychain.put(key:"regStatusMsg", value:data['msg']);
      if(response.statusCode==201){
        await FlutterKeychain.put(key:"regStatus", value:"true");
      }else{
        await FlutterKeychain.put(key:"regStatus", value:"false");
      }
    }catch(e){
      print('Caught error: $e');
    }
  }

}