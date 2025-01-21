import 'package:flutter/material.dart';
import 'custom_scaffold.dart';


class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
        title: "Settings screen",
        body:  Center(
        child: Text("Welcome to the settings screen ",style: TextStyle(fontSize: 20),)
        ) ,
    );
  }

}