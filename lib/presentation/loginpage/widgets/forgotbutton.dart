
import 'package:flutter/material.dart';

class ForgottButton extends StatelessWidget {
  const ForgottButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children:const [
      Padding(
      padding: EdgeInsets.only(right: 20),
      child: Text('Forgot password?',style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.orange)),
        ),
      ],
    );
  }
}
