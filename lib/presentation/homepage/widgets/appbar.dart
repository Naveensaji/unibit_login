
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
     backgroundColor: kblack,
     leading: CircleAvatar(
       radius: 20,
       backgroundColor: kgrey,
       child: Image.asset('assets/unibit-removebg-preview.jpg',height:25,),
     ),
     actions:const [ Padding(
       padding: EdgeInsets.all(8.0),
       child: Icon(Icons.notifications_none_outlined),
     )],
        );
  }
}