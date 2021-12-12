import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';




class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  get http => null;


  void getTime() async {


    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/Europe/London"));

    Map data = jsonDecode(response.body);

    //print(data);

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
