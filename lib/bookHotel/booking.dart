import 'package:flutter/material.dart';
import 'confirmation_page.dart';
import 'constants.dart';
import 'hotel.dart';

class Booking extends StatefulWidget {
  Booking({Key key, this.hotelChosen}) : super(key: key);

  Hotel hotelChosen;

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  // Date that the user makes to book a hotel
  DateTime datePicked;
  // Booking message
  String booking = 'Booking was made for ';

  // Alerts user to make a booking if they try to continue without making one first
  Future<void> noBooking() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Missing'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please Make a booking'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

// Alerts that hotel rooms are full
  Future<void> noRooms() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hotel is Full'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('There are no rooms available'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  
  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make a Booking'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( datePicked == null ? 'You haven\'t booked anything yet' : booking + datePicked.month.toString() + "/" + datePicked.day.toString() + "/" +datePicked.year.toString(),
              style: resultTextStyle,
            ),

            FlatButton.icon(
              color: pageColor,
              icon: calenderIcon,
              label: Text('Make a Booking'),
              onPressed: (){
                showDatePicker(
                    context: context,
                    initialDate: datePicked == null ? DateTime.now() : datePicked,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030)
                ).then((date){
                  setState(() {
                    datePicked = date;
                  });
                });
              },
            ),
            Text('Available Rooms: ' + widget.hotelChosen.availableRooms.toString()),
            Text('Price: \$' + widget.hotelChosen.priceOfRoom.toString()),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: rightArrow,
        backgroundColor: pageColor,
        onPressed: (){
          if(datePicked == null){
            noBooking();
          }
          else if(widget.hotelChosen.availableRooms == 0){
            noRooms();
          }
          else{
            Navigator.push(
              context,
              MaterialPageRoute(builder:(context) {
                return ConfirmationScreen(datePicked);
              }),
            );
          }
        },
      ),
    );
  }
}


