import 'package:flutter/material.dart';
import 'package:unibit_test/core/colors/colors.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 275,
      color:kgrey,
      child: Container(
              margin: const EdgeInsetsDirectional.all(110),
              child: Image.asset('assets/unibit-removebg-preview.jpg',height: 80,
                width: 80,
        ),
      ),
    );
  }
}