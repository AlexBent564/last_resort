import 'package:flutter/material.dart';
import 'package:last_resort/screens/bookHotel/available_hotels.dart';
import '../components/location.dart';
import '../components/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = 'loading_screen';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;

  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    longitude = location.longitude;
    latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper(
        'http://engine.hotellook.com/api/v2/lookup.json?query=$latitude,$longitude&lang=ru&lookFor=both&limit=1&token=PasteYourTokenHere');

    var hotelData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AvailableHotels(hotelLocation: hotelData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitWave(
        color: Colors.red,
        size: 100,
      )),
    );
  }
}
