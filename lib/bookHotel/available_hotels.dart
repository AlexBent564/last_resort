import 'package:flutter/material.dart';
import 'booking.dart';
import 'hotel.dart';

class AvailableHotels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _hotelListView(context),
    );
  }

  Widget _hotelListView(BuildContext context) {
    List<Hotel> _availableHotels = [
      Hotel(name:'First', rooms:5, price:100),
      Hotel(name:'Second', rooms:1, price:80),
      Hotel(name:'Third', rooms:0, price:50),
    ];

    Hotel chosenHotel;
    
    return ListView.builder(
      itemCount: _availableHotels.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(_availableHotels[index].hotelName),
          onTap: (){
            chosenHotel = _availableHotels[index];
            Navigator.push(
              context,
              MaterialPageRoute(builder:(context) {
                return Booking(hotelChosen: chosenHotel);
              }),
            );
          },
        );
      },
    );
  }
}

