import'package:flutter/material.dart';

class GameButton {
final id; //_text underscroll mean that variable is private 
String text;
Color bg;
bool enabled;
GameButton(
  { @required this.id,this.text="",this.bg=Colors.blueGrey,this.enabled=true });
// constructor for private variable if test is private Gamebutton(string text=""){} :_test=test;
}