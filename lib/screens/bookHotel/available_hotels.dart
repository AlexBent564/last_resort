import 'package:flutter/material.dart';
import 'booking.dart';
import 'hotel.dart';

class AvailableHotels extends StatefulWidget {
  AvailableHotels({this.hotelLocation});

  static const String id = 'available_hotels';

  final hotelLocation;

  @override
  _AvailableHotelsState createState() => _AvailableHotelsState();
}

class _AvailableHotelsState extends State<AvailableHotels> {
  String hotelName;
  String country;
  String state;
  String city;
  double hotelLat;
  double hotelLong;

  @override
  void initState() {
    super.initState();
    print(widget.hotelLocation);
    updateUI(widget.hotelLocation);
  }

  void updateUI(dynamic hotelData) {
    hotelName = hotelData["results"]["hotels"][0]["name"];
    country = hotelData["results"]["locations"][0]["countryIso"];
    state = hotelData["results"]["locations"][0]["state"];
    city = hotelData["results"]["locations"][0]["name"];
    hotelLat = hotelData["results"]["hotels"][0]["location"]["lat"];
    hotelLong = hotelData["results"]["hotels"][0]["location"]["lon"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: _hotelListView(context),
      ),
    );
  }

  Widget _hotelListView(BuildContext context) {
    List<Hotel> _availableHotels = [
      Hotel(name: 'First', rooms: 5, price: 100),
      Hotel(name: 'Second', rooms: 1, price: 80),
      Hotel(name: 'Third', rooms: 0, price: 50),
    ];

    Hotel chosenHotel;

    return ListView.builder(
      itemCount: _availableHotels.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_availableHotels[index].hotelName),
          onTap: () {
            chosenHotel = _availableHotels[index];
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Booking(hotelChosen: chosenHotel);
              }),
            );
          },
        );
      },
    );
  }
}
