import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibit_test/presentation/loginpage/loginscreen.dart';
import 'package:unibit_test/presentation/loginpage/widgets/loginbutton.dart';
import 'package:unibit_test/presentation/loginpage/widgets/textcontainer.dart';

import '../../application/signupservices.dart';
import '../../core/colors/colors.dart';
import '../../core/constants/constants.dart';

// ignore: must_be_immutable
class CreateAccount extends StatelessWidget {
   CreateAccount({super.key});
  TextEditingController userNamecontroller = TextEditingController();
  TextEditingController userPhonecontroller = TextEditingController();
  TextEditingController userPasscontroller = TextEditingController();
  TextEditingController userEmailcontroller = TextEditingController();

User? currentUser= FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
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
          child: Column(children: [
          Container(
          width: double.infinity,
          height: 180,
          color:kgrey,
          child: Container(
            margin: const EdgeInsetsDirectional.all(110),
            child: Image.asset('assets/unibit-removebg-preview.jpg',height: 80,
            width: 80,
            ),
          ),),
              kHeight,
              Text('Create an account',style: GoogleFonts.redHatDisplay(textStyle: const TextStyle(fontSize: 24,fontWeight: FontWeight.w600)),),
              kHeight20,
              TextFormContainer(title: 'Username', leadingicon: Icons.person,controller: userNamecontroller,),
              kHeight20,
              TextFormContainer(title: 'Mobile Number', leadingicon: Icons.phone,controller: userPhonecontroller,),
              kHeight20,
              TextFormContainer(title: 'Email', leadingicon: Icons.email,controller: userEmailcontroller,),
              kHeight20,
              TextFormContainer(title: 'password', leadingicon: Icons.lock,controller:userPasscontroller,),
              kHeight50,
              GestureDetector(
          onTap: () async{
            var userName=userNamecontroller.text.trim();
            var userPhone=userPhonecontroller.text.trim();
            var userPass=userPasscontroller.text.trim();
            var userEmail=userEmailcontroller.text.trim();
        
          await  FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEmail, password: userPass).
            then((value) => {
             log('user created'),
             signUpuser(
              userName,
              userEmail,
              userPhone,
              userPass
             )
            });
          },
          child: const LoginPageButton()),
          kHeight20,
          GestureDetector(
          onTap: () =>Get.to(()=>LoginPage()),
          child: RichText( text:const TextSpan(style:  TextStyle(fontSize: 14.0,color: Colors.black,),
          children: <TextSpan>[TextSpan(text: "Already have an account ?"), TextSpan(text: ' Sign in', style:  TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),],),
                     ),
              ),
          ],),
        ),
      ),
    );
  }
}