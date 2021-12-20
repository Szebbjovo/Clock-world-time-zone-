import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(url: 'Europe/Bucharest', location: 'Bucharest',flag: 'romania.png' ),
    WorldTime(url: 'Europe/Budapest', location: 'Budapest',flag: 'Budapest.png' ),
    WorldTime(url: 'Europe/Brussels', location: 'Brussels',flag: 'Brussels.jpg' ),
    WorldTime(url: 'Europe/Belgrade', location: 'Belgrade',flag: 'Belgrade.jpg' ),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.jpg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),

  ];

  void  updateTime(index) async{
    WorldTime updateTIme = locations[index];
    await updateTIme.getTime();


    //send beck us to home screen
    Navigator.pop(context, {
      'location': updateTIme.location,
      'flag': updateTIme.flag,
      'time': updateTIme.time,
      'isDayTime': updateTIme.isDayTime
    });

  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('choose The location'),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 80.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                   updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index].flag}'),)
                ),
              ),
            );
          }
      ),
    );
  }
}
