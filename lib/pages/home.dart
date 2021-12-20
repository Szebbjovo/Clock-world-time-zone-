import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String imageS = data['isDayTime'] ? 'day.jpg' : 'night.jpg';

    Color szin = Colors.black;

    return Scaffold(
      backgroundColor: szin,
      body: SafeArea(

          child:
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$imageS'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[

                  FlatButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.lightBlueAccent,
                    ),
                    label: Text('Edit location',
                    style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                            style: TextStyle(
                              fontSize: 30.0,
                              letterSpacing: 2.0,
                                color: Colors.white
                  ),
                      ),
]
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 70.0,
                      color: Colors.lightBlueAccent
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
