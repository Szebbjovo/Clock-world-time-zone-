import 'dart:core';
import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';



class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

void setupWorldTIme(){
  WorldTime instaLeves = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Eurome/Berlin');

}


  @override
  void initState(){
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}
