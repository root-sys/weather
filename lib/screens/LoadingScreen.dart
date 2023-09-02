

import 'package:flutter/material.dart';
import '../Components/weathermodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_info.dart';


class LoadingScreen extends StatefulWidget {



  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


@override
  void initState() {
  getLocation();

    super.initState();
  }

  void getLocation() async{

  var data = await weathermodel().getLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return location_info(weatherdata: data);
  }));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "WEATHER"
          ),
        ),
      ),
      body: SpinKitSpinningLines(
        size: 100.0,
        color: Colors.white70,
      ),
    );
  }
}



