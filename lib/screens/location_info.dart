import 'package:flutter/material.dart';
import '../constants.dart';
import '../Components/weathermodel.dart';
import 'searchscreen.dart';

class location_info extends StatefulWidget {

  var weatherdata;

  location_info({required this.weatherdata}){}

  @override
  State<location_info> createState() => _location_infoState();
}

class _location_infoState extends State<location_info> {

 late double temp;
 late String city;
  late int id;
  late String Condition;
  late String Situation;

 @override
  void initState() {
    updateUI(widget.weatherdata);
    super.initState();
  }

  void updateUI(dynamic data){
   setState(() {

     if(data == null){
       temp = 0;
       Condition= "Error";
       Situation = "Error";
       city = '';
     }
     temp = data['main']['temp'];
     city = data['name'];
     id = data['weather'][0]['id'];

     weathermodel weather = weathermodel();

     Condition = weather.getWeatherIcon(id);
     Situation = weather.getMessage(temp.toInt());
   });

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/b10b15fa148da29f315cf93607ab1765.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async{

                      updateUI(await weathermodel().getLocation());
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
               TextButton(
                    onPressed: () async{
                     var cityName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return searchScreen();
                      },),);
                     if(cityName!=null){
                    var weatherdata =  await  weathermodel().getCityLocation(cityName);
                    updateUI(weatherdata);
                     }
                    },
                    child: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      temp.toString(),
                      style: kTempTextStyle,
                    ),
                    Text(
                      Condition,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0,bottom: 15.0,left: 5.0),
                child: Text(
                  "$Situation in $city!",

                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
