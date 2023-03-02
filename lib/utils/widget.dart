import 'package:flutter/material.dart';

Widget text(TextEditingController a,String b)
{
  return TextField(
    controller: a,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white,fontSize: 15),
    decoration: InputDecoration(
      label: Text("$b",style: TextStyle(color: Colors.white)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
    ),
  );
}