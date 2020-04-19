import 'package:flutter/material.dart';
import 'confirmation_page.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  // Date that the user makes to book a hotel
  DateTime datePicked;
  // Booking message
  String booking = 'Booking was made for ';

  // Alerts user to make a booking if they try to continue without making one first
  Future<void> showAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make a Booking'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Message that changes depending on whether or not a booking has been made
            Text( datePicked == null ? 'You haven\'t booked anything yet' : booking + datePicked.month.toString() + "/" + datePicked.day.toString() + "/" +datePicked.year.toString()),
            RaisedButton(
              child: Text('Make a Booking'),
              // When button is pressed a calender will appear where the user can choose a date
              onPressed: (){
                showDatePicker(
                    context: context,
                    // Date will always start at the current day if nothing is picked
                    initialDate: datePicked == null ? DateTime.now() : datePicked,
                    // The dates on the calender will range from 2020 to 2030
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030)
                ).then((date){
                  setState(() {
                    // The date chosen will be saved to the datePicked variable
                    datePicked = date;
                  });
                });
              },
            ),
            RaisedButton(
              // Once the date is picked the user can continue
              child: Text('Next'),
              onPressed: (){
                if(datePicked != null) {
                  // The user will be taken to the Confirmation Screen with the date passed in
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) {
                      return ConfirmationScreen(datePicked);
                    }),
                  );
                }
                else{
                  // If there is no date picked then a message will pop up
                  showAlert();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
