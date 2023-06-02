
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import 'bottonbutton.dart';

class BottomnavWidget extends StatelessWidget {
  const BottomnavWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5.0,
      shape: const CircularNotchedRectangle(),
      color: kwhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: const[
           Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Bottombutton(icon: Icons.headset_mic_outlined,text:'Contact'),
          ),
          Padding(
            padding:
                 EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
            child: Bottombutton(icon: Icons.wallet,text:'Wallet'),
          ),
          Padding(
            padding:
                 EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
            child:Bottombutton(icon: Icons.share,text:'Share'),
          ),
          Padding(
            padding:  EdgeInsets.only(right: 10.0),
            child:Bottombutton(icon: Icons.person,text:'Profile'),
          ),
        ],
      ),
    );
  }
}

