import 'package:flutter/material.dart';

class Hotel {
  String hotelName;
  int availableRooms;
  int priceOfRoom;
  String hotelCountry;
  String hotelState;
  String hotelCity;
  double hotelLat;
  double hotelLong;
  String image;
  



  Hotel({String name, int rooms, int price, String country, String state, String city, double lat, double long, String img}){
    hotelName = name;
    availableRooms = rooms;
    priceOfRoom = price;
    hotelCountry = country;
    hotelState = state;
    hotelCity = city;
    hotelLat = lat;
    hotelLong = long;
    image = img;
  } // hotelname, country, state, city, lat, long
}