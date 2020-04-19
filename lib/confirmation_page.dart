import 'package:flutter/material.dart';
import 'thank_you_page.dart';

class ConfirmationScreen extends StatefulWidget {
  // dateChosen will be the variable passed in
  DateTime dateChosen;

  ConfirmationScreen(dateChosen){
    this.dateChosen = dateChosen;
  }

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  // A list of the months to display the date a little better for the user
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
      backgroundColor: Color(0xFFf75336),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                    // Message to the user to confirm their date
                    'Confirm Your Book Date: ',
                    style: TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 20.0
                    )
                ),
              ],
            ),
            Text(
                // The day of the month chosen will display here
                widget.dateChosen.day.toString(),
                style: TextStyle(
                  fontFamily: 'Spartan MB',
                  fontSize: 60.0
                )
            ),
            Text(
                // The month chosen will display here
                months[widget.dateChosen.month] + ",",
                style: TextStyle(
                    fontFamily: 'Spartan MB',
                    fontSize: 60.0
                )
            ),
            Text(
               // The year chosen will display here
                widget.dateChosen.year.toString(),
                style: TextStyle(
                    fontFamily: 'Spartan MB',
                    fontSize: 60.0
                )
            ),
            RaisedButton(
              // Button to confirm the date is here
              child: Text('Confirm'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                ThankYouPage()),);
              },
            RaisedButton(
              // If user made a mistake then go back to previous page
              child: Text('Go Back'),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
