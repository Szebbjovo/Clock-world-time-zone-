import 'package:flutter/material.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/pages/loading_screen.dart';
import 'package:world_clock/pages/location_select.dart';


void main() => runApp(MaterialApp(
initialRoute: '/home',
 routes: {
   '/': (context) => Loading(),
   '/home': (context) => Home(),
   '/location': (context) => ChooseLocation(),
 }
));

