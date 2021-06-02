import 'package:coral_demo_app/client/client.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatefulWidget {

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget>{

  TextEditingController storeCodeController = new TextEditingController();
  TextEditingController pinController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final nameField = TextField (
      controller: storeCodeController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Store Code",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final phoneField = TextField (
      controller: pinController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "6 digit pin",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        minWidth: 300,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          String registerStatus = await DeviceAuthClient.login(storeCodeController.text, pinController.text);
          if ("SUCCESS" == registerStatus) {
            Navigator.pushNamed(context, '/', arguments:storeCodeController.text);
          }
          /*
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginWidget()),
          );*/
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold (
      body: Center (
        child: Container (
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 45.0),
                nameField,
                SizedBox(height: 25.0),
                phoneField,
                SizedBox(
                  height: 35.0,
                ),
                registerButton,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}