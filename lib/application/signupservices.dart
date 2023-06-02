

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unibit_test/presentation/loginpage/loginscreen.dart';

signUpuser(
  String userName, 
  String userEmail, 
  String userPhone, 
  String userPass )async{

User? userid=FirebaseAuth.instance.currentUser;
 //var currentUser;
try{
  await   FirebaseFirestore.instance.collection("users").doc(userid!.uid).set({
                'userName':userName,
                'userPhone':userPhone,
                'userEmail':userEmail,
                'userPass':userPass,
                'userId':userid.uid
              }).then((value) => {
                FirebaseAuth.instance.signOut(),
                Get.to(()=>LoginPage())
              });
}on FirebaseAuthException catch(e){
  log("Error $e");
}
             
}