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
      Hotel(name: hotelName, rooms: 5, price: 100, country: country, state: state, city: city, lat: hotelLat, long: hotelLong, img: 'images/hotel1.jpg'),
      Hotel(name: 'Meta', rooms: 2, price: 80, country: 'USA', state: 'AZ', city: 'Flagstaff', lat: 123, long: 456, img: 'images/hotel2.jpg'),
      Hotel(name: 'Madrid', rooms: 12, price: 50, country: 'Spain', state: 'State1', city: 'Madrid', lat: 789, long: 101, img: 'images/hotel3.jpg'),
      Hotel(name: 'London', rooms: 0, price: 50, country: 'England', state: 'State2', city: 'London', lat: 112, long: 131, img: 'images/hotel4.jpg'),
    ];

    Hotel chosenHotel;

    return ListView.builder(
      itemCount: _availableHotels.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(_availableHotels[index].image),
          ),
          title: Text(_availableHotels[index].hotelName + ', ' + _availableHotels[index].hotelCountry + ', Lat: ' + _availableHotels[index].hotelLat.toString() + ', Long: ' + _availableHotels[index].hotelLong.toString() ),
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
