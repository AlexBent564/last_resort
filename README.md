# last_resort

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




Isai's Part
Made a few changes
 - Added Hotel class where you can set the name, rooms, and price of a hotel.
more can be added such as an image property to be displayed next to the hotel
 - Added available_hotels page which is just a list of available hotels, this page simply has a list of dummy hotel data. This page can be updated to reveice information from an api or firebase
- confirmation page looks a little better
- added a constants page for organized styles and colors
- booking page now recieves information from available page and has the ability to display 2 different alerts one if the user does not pick a date, and another if the hotel has no available rooms
 - Added some pubspec dependencies
 - note that the collection "bookings" will need to exist in the firebase firestore database
