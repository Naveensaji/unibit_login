
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class TextFormContainer extends StatelessWidget {
    const TextFormContainer({
    super.key, 
    required this.title, 
    required this.leadingicon, 
    this.controller,

  });
 final String title;
 final IconData leadingicon ;
 final TextEditingController? controller;

 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 330,
      decoration: BoxDecoration(color: kgrey,
      borderRadius: BorderRadius.circular(50)
      ),
      child: ListTile(
        leading: Icon(leadingicon,color: Colors.grey.shade400,),
        title: TextFormField(
        controller: controller,
       style:  TextStyle(color: Colors.grey.shade700),
       decoration: InputDecoration(
       border: InputBorder.none,
       hintText: title,
       hintStyle: const TextStyle(color:Colors.grey,fontSize: 13
      )
    ),
        ),
      ),
    );
  }
}
