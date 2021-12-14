import 'package:http/http.dart';
import 'dart:convert';


class WorldTime {

  late String location;//location name for the UI
  late String time; // the time in thtat location
  late String flag; //flag assets
  late String url; //location url api

  WorldTime({required this.location, required this.flag, required this.url});

  void getTime() async {


    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));

    Map data = jsonDecode(response.body);

    //print(data);


    //get properties from fata
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    //print(datetime);
    //print(offset);

    //date time object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));


    //set
    time = now.toString();
  }


}




