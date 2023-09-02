import 'package:flutter/material.dart';
import '../constants.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({super.key});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  var cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Tree-Dark-Cloud-Extreme-Weather-4K-Ultra-HD-Mobile-Wallpaper-1152x2048.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(

                  style: TextStyle(
                    color: Colors.black,
                  ),

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.location_city_rounded,
                    color: Colors.white,
                  ),
                  hintText: "Enter City Name",
                  hintStyle: TextStyle(
                    color: Colors.grey
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  )

                ),
                  onChanged: (value){
                  cityName = value;

                  },

                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context,cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle1,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
