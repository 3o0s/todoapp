import 'package:flutter/material.dart';
const kBottomContainerPadding = EdgeInsets.only(
  top: 30,
  left: 30,
  right: 30,
  bottom: 30,
);
const kTasksContainerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30), topRight: Radius.circular(30)));
const kTextStyle = TextStyle(color: Colors.white, fontSize: 18.0);
const List<Widget> kupperBar = [
  CircleAvatar(
    radius: 30.0,
    backgroundColor: Colors.white,
    child: Icon(
      Icons.list,
      size: 30,
      color: Colors.lightBlueAccent,
    ),
  ),
  SizedBox(
    height: 10,
  ),
   
];
const kDateFormat = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 30,
      
    );
const monthsList = [' ', 'Jan', 'Feb', 'March', 'April', 'May', 'June', 'July', 'Aug', 'Sep', 'Oct', 'November', 'December'];