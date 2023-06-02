
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unibit_test/core/colors/colors.dart';
import 'package:unibit_test/presentation/loginpage/loginscreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
       tologin(context);
      },
    );
      return  Scaffold(
      backgroundColor: kgrey,
      body: Center(
      child: Image.asset('assets/unibit-removebg-preview.jpg',height: 100,
      width: 100,),
      ),
    );
  }
  
}
Future<void>tologin(context) async{
  await  Future.delayed(const Duration(seconds: 3));
  Get.to(()=>LoginPage());
  
    
  }