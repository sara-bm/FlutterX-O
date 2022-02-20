
import 'package:flutter/material.dart';

import 'first_page.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
 // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return new MaterialApp(
theme:new ThemeData(primaryColor:Colors.yellow),
debugShowCheckedModeBanner: false,

home:new HomePage(),
    );
      
  
  }
}
