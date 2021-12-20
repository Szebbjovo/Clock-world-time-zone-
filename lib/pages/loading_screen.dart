import 'dart:core';
import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';



class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  Future<void> setupWorldTIme() async {
    WorldTime instaLeves = WorldTime(location: 'Berlin', flag: 'Germany.png', url: 'Europe/Berlin');
    await instaLeves.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instaLeves.location,
      'flag': instaLeves.flag,
      'time': instaLeves.time
    });

  }


  @override
  void initState(){
    super.initState();
    setupWorldTIme();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('resoult'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('loading'),
      ),
    );
  }
}
