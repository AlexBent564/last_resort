import 'package:flutter/material.dart';

class Hotel {
  String hotelName;
  int availableRooms = 2;
  int priceOfRoom = 10;

  Hotel({String name, int rooms, int price}){
    hotelName = name;
    availableRooms = rooms;
    priceOfRoom = price;
  }
}