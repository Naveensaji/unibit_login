import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibit_test/core/colors/colors.dart';
import 'package:unibit_test/presentation/homepage/widgets/appbar.dart';

import '../../core/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
     appBar:const PreferredSize(
     preferredSize: Size.fromHeight(60),
     child: AppbarWidget(),  ),
       body: Center(
       child: Column(
       children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              kHeight,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Hello, Dipak 👋',style: GoogleFonts.redHatDisplay(textStyle: const TextStyle(fontSize: 22,fontWeight: FontWeight.w700))),
                ), ],
            ),
            kHeight,
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
               decoration: BoxDecoration(color: kgrey,
               borderRadius: BorderRadius.circular(50)),
                height: 60,
                width: 320,
               // color: Colors.blue,
                child: Image.asset('assets/fantasy.jpg'),
              ),
            ),
            kHeight,
            SizedBox(
              height: 200,
              width: 320,
              child: Image.asset('assets/game 1.jpg')),
              kHeight20,
              SizedBox(
              height: 200,
              width: 320,
              child: Image.asset('assets/game2demo.jpg'))
       
            
          ],
         ),
       ),
    );
  }
}
