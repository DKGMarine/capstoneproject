import 'package:flutter/material.dart';
import '../values/values.dart';
import './login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';


Future createAlbum(String firstName, String lastName, String dob, String email, String password) async {

  final http.Response response = await http.post(
      'http://scoutboard.appspot.com/signup',
      body:

      {
        'FirstName':firstName,
        'LastName':lastName,
        'DOB': dob,
        'Email': email,
        'Password': password,
      }

  );

  print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    return response.body;

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/registration-screen';
  String firstName;
  String lastName;
  String dob;
  String email;
  String password;
  String passwordConfirm;

  String message;

  final myControllerF = TextEditingController(); // controller for firstname
  final myControllerL = TextEditingController(); // controller for lastname
  final myControllerD = TextEditingController(); // controller for date of birth
  final myControllerE = TextEditingController(); // controller for email
  final myControllerP = TextEditingController(); // controller for password
  final myControllerPC = TextEditingController(); // controller for password confirm

   void onRectangle14Pressed(BuildContext context) => Navigator.of(context).pushNamed(LoginScreen.routeName);
  
  void onBackwardArrowPressed(BuildContext context) => Navigator.of(context).pushNamed(LoginScreen.routeName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "assets/images/registration_background.png",
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              left: 0,
              top: 50,
              right: 370,
              child: Container(
                width: 10,
                height: 17,
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                    this.onBackwardArrowPressed(context);
                  },
                  color: Color.fromARGB(0, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  textColor: Color.fromARGB(255, 0, 0, 0),
                  padding: EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/backward-arrow-4.png",),

                    ],
                  ),
                ),
              ),
            ),
              Positioned(
                left: 0,
                top: 80,
                right: 0,
              child: Container(
                margin: EdgeInsets.only(),
                child: Text(
                  "Create New Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w300,
                    fontSize: 27,
                  ),
                ),
              ),
              ),
            Positioned(
              left: -1,
              top: 80,
              right: -1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 80,
                      height: 18,
                      margin: EdgeInsets.only(left: 47, top: 75),
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
                              "First name",
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
                  SizedBox(height: 5,),
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
                        controller: myControllerF,
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 80,
                      height: 18,
                      margin: EdgeInsets.only(left: 47, top: 20),
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
                              "Last name",
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
                  SizedBox(height: 5,),
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
                        controller: myControllerL,
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 250,
                      height: 18,
                      margin: EdgeInsets.only(left: 47, top: 20),
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
                              "Date of Birth (MM/DD/YYYY)",
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
                  SizedBox(height: 5,),
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
                        controller: myControllerD,
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


                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 80,
                      height: 18,
                      margin: EdgeInsets.only(left: 47, top: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 14,
                              height: 12,
                              margin: EdgeInsets.only(top: 2, right: 2,),
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
                  SizedBox(height: 5,),
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
                        controller: myControllerE,
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
                  SizedBox(height: 5,),
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
                  SizedBox(height: 5,),
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
                        controller: myControllerP,
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
                  SizedBox(height: 5,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 250,
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
                                "Confirm Password",
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
                  SizedBox(height: 5,),
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
                        controller: myControllerPC,
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
              top: 600,
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

                        firstName = myControllerF.text;
                        lastName = myControllerL.text;
                        dob = myControllerD.text;
                        email = myControllerE.text;
                        password = myControllerP.text;
                        passwordConfirm = myControllerPC.text;

                      if(firstName.isEmpty) {
                        print('1');
                        Fluttertoast.showToast(
                          msg: 'Please enter your first name',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                        }
                        else if(lastName.isEmpty) {
                          Fluttertoast.showToast(
                          msg: 'Please enter your last name',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                        }
                      else if(dob.isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'Please enter your date of birth',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                      else if(!RegExp(r"^([0-9]{2})\/([0-9]{2})\/([0-9]{4})$").hasMatch(dob)){

                        Fluttertoast.showToast(
                          msg: 'Please enter a formatted date of birth',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                      else if(email.isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'Please enter your email',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                      else if(password.isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'Please enter a password',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                      else if(password.length < 8){
                        Fluttertoast.showToast(
                          msg: 'Password must be at least 8 characters long',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );


                      }
                      else if(password != passwordConfirm){
                        Fluttertoast.showToast(
                          msg: 'Passwords do not match!',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                      else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
                        Fluttertoast.showToast(
                          msg: 'Invalid Email',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }else {

                        createAlbum(firstName, lastName, dob, email, password).then((message) {
                          if(message == "Error Code 10 Email Duplicate"){
                            Fluttertoast.showToast(
                              msg: 'Email Duplicate',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                          }else {
                            this.onRectangle14Pressed(context);
                          }
                          }
                        ).catchError((e){
                          Fluttertoast.showToast(
                            msg: 'Error in registration',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                        });

                      }

                      },
                      color: AppColors.secondaryElement,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.all(0),
                      child: Text(
                        "REGISTER",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}