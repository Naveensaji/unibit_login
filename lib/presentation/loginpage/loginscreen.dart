
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibit_test/core/colors/colors.dart';
import 'package:unibit_test/presentation/createaccount/createaccount.dart';
import 'package:unibit_test/presentation/loginpage/otp.dart';
import 'package:unibit_test/presentation/loginpage/widgets/forgotbutton.dart';
import 'package:unibit_test/presentation/loginpage/widgets/loginbutton.dart';
import 'package:unibit_test/presentation/loginpage/widgets/splashimage.dart';
import 'package:unibit_test/presentation/loginpage/widgets/textcontainer.dart';
import 'package:unibit_test/presentation/mainpage/mainpage.dart';

import '../../core/constants/constants.dart';


// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
   LoginPage({super.key});
TextEditingController loginEmailController =  TextEditingController();
TextEditingController loginPasswordController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:ListView(
        children: 
          [Column(
          children: [
          const SplashImage(),
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Padding(
                padding:  const EdgeInsets.all(8.0),  
                child: Text('Login',style:  GoogleFonts.redHatDisplay(textStyle: const TextStyle(fontSize: 24,fontWeight: FontWeight.w700)))    ),
                ],
              ),
              kHeight,
               TextFormContainer(leadingicon: Icons.email,title: 'Email',controller: loginEmailController,),
              kHeight20,
               TextFormContainer(title: 'Password', leadingicon: Icons.lock,controller: loginPasswordController,),
              kHeight,
              const ForgottButton(),kHeight,
              GestureDetector(
               onTap: ()async {
                 // ignore: unused_local_variable
                 var loginEmail  = loginEmailController.text.trim();
                // ignore: unused_local_variable
                var loginPassword = loginPasswordController.text.trim();
              try{
                  final User? firebaseUser= (await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: loginEmail, 
                  password: loginPassword)).user;
                  if(firebaseUser != null){
                    Get.to(()=>MainpageScreen());
                  }else{
                    log('Check Email & Password');
                  }
              }on FirebaseAuthException catch(e){
                log('Error  $e');
              }

               },  
                child: const LoginPageButton()),kHeight,
              GestureDetector(
                onTap: () => Get.to(()=>OtpScreen()),
                child: const Loginbuttonn()),kHeight20 ,
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> CreateAccount() ) ),
                child: RichText( text:const TextSpan(style:  TextStyle(fontSize: 14.0,color: Colors.black,),
                children: <TextSpan>[TextSpan(text: "Don't have an account ?"), TextSpan(text: ' Sign up now', style:  TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),],),
                 ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
