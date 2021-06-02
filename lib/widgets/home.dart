import 'package:coral_demo_app/widgets/grocery.dart';
import 'package:coral_demo_app/widgets/restaurant.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // This will disable back button on home screen
        onWillPop: () {
          return new Future.value(false);
        },
        // Tab content on home page
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurpleAccent,
              actions: <Widget>[
              ],
              bottom: TabBar(
                tabs: [
                  Tab(text: "Restaurant",),
                  Tab(text: "Grocery"),
                ],
              ),
              title: Text('Example Store'),
            ),
            body: TabBarView(
              children: [
                RestaurantWidget(),
                GroceryWidget(),
              ],
            ),
            /*
        floatingActionButton: FloatingActionButton (
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Icon(Icons.edit),
          backgroundColor: Colors.green,
        ),
         */
          ),
        )
    );
  }
}