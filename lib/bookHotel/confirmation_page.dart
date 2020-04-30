import 'package:flutter/material.dart';
import 'thank_you_page.dart';
import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConfirmationScreen extends StatefulWidget {
  DateTime dateChosen;

  ConfirmationScreen(dateChosen){
    this.dateChosen = dateChosen;
  }

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final _firestore = Firestore.instance;

  var months = {1:'January',
                2:'February',
                3:'March',
                4:'April',
                5:'May',
                6:'June',
                7:'July',
                8:'August',
                9:'September',
                10:'October',
                11:'November',
                12:'December',};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirmation'),),
        backgroundColor: confirmationColor,
      body: Container(
        child: Column(
          children: <Widget>[
            Text('Confirm Your Book Date: ',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Spartan MB',
                    fontSize: 30.0)
            ),
            Text(widget.dateChosen.day.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Spartan MB',
                    fontSize: 50.0)
            ),
            Text(months[widget.dateChosen.month] + ",",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Spartan MB',
                    fontSize: 50.0)
            ),
            Text(widget.dateChosen.year.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Spartan MB',
                    fontSize: 50.0)
            ),
            FlatButton.icon(
              color: Colors.white70,
              icon: check,
              label: Text('Confirm'),
              onPressed: (){
                _firestore.collection('bookings').add({
                  'Hotel Name': 'Sample',
                  'Rooms Booked': 2,
                  'DateBooked': widget.dateChosen,
                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    ThankYouPage()),);
              },
            )
          ],
        ),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: pageColor,
            borderRadius: BorderRadius.circular(10.0)
        ),
        height: 350,
        width: 450,
      ),
    );
  }
}
