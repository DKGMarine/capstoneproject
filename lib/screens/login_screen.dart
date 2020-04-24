import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import './dashboard_screen.dart'; 
import 'registration_screen.dart';
import '../values/values.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scoutboard/widgets/globals.dart' as global;
import 'package:http/http.dart' as http;

class Album{

  final String ID;
  Album({this.ID});

  factory Album.fromJson(Map<String, dynamic> json){

    return Album(
      ID: json['scoutID'],
    );


  }
}

Future<Album> createAlbum(String email, String password) async {

  final http.Response response = await http.post(
      'https://capstoneproject-271322.appspot.com/login',

    body:

      {
        'Email':email,
        'password':password,
      }

  );

  print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
      return Album.fromJson(json.decode(response.body));

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
     throw Exception('Failed to load album');
  }
}

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  LoginScreen({Key key}) : super(key: key);

  _LoginScreen createState(){

    return _LoginScreen();
  }

}

class _LoginScreen extends State<LoginScreen> {


  void onSIGNUPPressed(BuildContext context) => Navigator.of(context).pushNamed(RegistrationScreen.routeName);
  void onRectangle14Pressed(BuildContext context) => Navigator.of(context).pushNamed(StatefulWidgetReg.routeName);
  
  Future<Album> futureAlbum;
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 250, 250, 250),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: -1,
              top: -50,
              right: -1,
              child: Image.asset(
                "assets/images/login_background.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: -1,
              top: 94,
              right: -1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Container(
                    width: 50,
                    height: 71,
                    child: Image.asset(
                        "assets/images/158335311763927743.png"
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 80,
                      height: 18,
                      margin: EdgeInsets.only(left: 47, top: 100),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 14,
                              height: 12,
                              margin: EdgeInsets.only(top: 2),
                              child: Image.asset(
                                "assets/images/group-2-2.png",
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Email",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 320,
                      height: 27,
                      margin: EdgeInsets.only(top: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: TextField(
                        controller: myController,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                        ),
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 73,
                      height: 18,
                      margin: EdgeInsets.only(left: 48, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 8,
                              height: 12,
                              margin: EdgeInsets.only(top: 4),
                              child: Image.asset(
                                "assets/images/union-7.png",
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 3),
                              child: Text(
                                "Password",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 320,
                      height: 24,
                      margin: EdgeInsets.only(top: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),

                      ),
                      child: TextField(
                        controller: myController2,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                        ),
                        obscureText: true,
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 38,
              top: 425,
              right: 38,
              bottom: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 300,
                    height: 42,
                    child: FlatButton(
                      onPressed: () {

                        email = myController.text;
                        password = myController2.text;


                            createAlbum(email, password).then((futureAlbum) {
                              if (futureAlbum.ID != null) {
                                global.userID = futureAlbum.ID;
                                this.onRectangle14Pressed(context);
                              }
                            }
                            ).catchError((e){
                              Fluttertoast.showToast(
                                msg: 'Incorrect username/password',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.TOP,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                            });



                        },
                      color: AppColors.secondaryElement,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.all(0),
                      child: Text(
                        "LOGIN",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(top: 10, right: 4),
                      child: Text(
                        "Forgot Password ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),

                  Container(
                    height: 16,
                    margin: EdgeInsets.only(left: 38, right: 57),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Don't Have an Account ?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 219, 219, 219),
                              fontFamily: "Ubuntu",
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 15,
                              margin: EdgeInsets.only(left: 20, bottom: 1),
                              child: FlatButton(
                                onPressed: () {
                                  this.onSIGNUPPressed(context);
                                },
                                color: Color.fromARGB(0, 0, 0, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(0)),
                                ),
                                textColor: Color.fromARGB(255, 255, 255, 255),
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  "SIGN UP",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Ubuntu",
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}