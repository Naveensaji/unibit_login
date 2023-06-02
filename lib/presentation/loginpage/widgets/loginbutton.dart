
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors/colors.dart';

class LoginPageButton extends StatelessWidget {
  const LoginPageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 330,
      decoration: BoxDecoration(gradient:  const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
      Color.fromARGB(255, 251, 227, 2),
      Color.fromARGB(255, 255, 152, 0)  ],),
      borderRadius: BorderRadius.circular(50),),
      child: Center(child: Text('Login',style: GoogleFonts.aBeeZee(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: kwhite)))),
    );
  }
}
class Loginbuttonn extends StatelessWidget {
  const Loginbuttonn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 58,
      width: 330,
      decoration: BoxDecoration(gradient:  const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
               Color.fromARGB(255, 6, 33, 239),
               Color.fromARGB(255, 101, 114, 217)
              ],
            ),
      borderRadius: BorderRadius.circular(50),),
      child: Center(child: Text('Login with OTP',style: GoogleFonts.aBeeZee(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color: kwhite)))),
    );
  }
}
