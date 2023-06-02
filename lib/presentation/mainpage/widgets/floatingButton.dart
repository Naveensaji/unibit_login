
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child:  Icon(Icons.add),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 0,
    );
  }
}
