import 'package:flutter/material.dart';
import 'package:headless_cms_nodejs/pages/home.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
    '/':(context)=>Home(),
  },
));
