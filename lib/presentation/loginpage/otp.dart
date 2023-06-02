import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibit_test/core/colors/colors.dart';
import 'package:unibit_test/presentation/loginpage/widgets/splashimage.dart';
import 'package:unibit_test/presentation/mainpage/mainpage.dart';

import '../../core/constants/constants.dart';


// ignore: use_key_in_widget_constructors
class OtpScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
          backgroundColor: kgrey,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () => Navigator.pop(context,true), 
            icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.grey.shade800,),)
          ),)),
      body: SingleChildScrollView(
        child: Column(
            children: [
            const SplashImage(),
            kHeight20,
            Text('Login With OTP',style:  GoogleFonts.redHatDisplay(textStyle: const TextStyle(fontSize: 24,fontWeight: FontWeight.w600))),
            kHeight50,
            Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                    hintText: 'Phone Number',
                    prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('+91'), ),
                    ),
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                  ),
                  Visibility (
                    visible: otpVisibility,
                    child: TextField(
                    controller: otpController,
                    decoration: const InputDecoration(
                    hintText: 'OTP',
                    prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(''),),
                      ),
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                 kHeight,
                  GestureDetector(
                    onTap: () {
                       if (otpVisibility) {
                          verifyOTP();
                        } else {
                          loginWithPhone();
                        }
                    },
                    child: Container(
                     height: 58,
                    width: 250,
                   decoration: BoxDecoration(gradient:  const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                       Color.fromARGB(255, 251, 227, 2),
                       Color.fromARGB(255, 255, 152, 0)],),
                    borderRadius: BorderRadius.circular(50),),
                        child: Center(
                        child: Text(
                        otpVisibility ? "Verify" : "Login",
                        style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
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
    );
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      // ignore: prefer_interpolation_to_compose_strings
      phoneNumber: "+91" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          log("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
      // ignore: avoid_print
      print(e.message);
      },
       codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
    verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
      (value) {
          setState(() {
          user = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
      () {
        if (user != null) {
            Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  MainpageScreen(),
            ),
          );
        } else {
          Fluttertoast.showToast(
            msg: "your login is failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }
}
