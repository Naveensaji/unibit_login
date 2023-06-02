import 'package:flutter/material.dart';
import 'package:unibit_test/presentation/homepage/homepage.dart';
import 'package:unibit_test/presentation/mainpage/widgets/FloatingButton.dart';
import 'package:unibit_test/presentation/mainpage/widgets/bottomnav.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);


class MainpageScreen extends StatelessWidget {
   MainpageScreen({super.key});
final _pages=[const HomePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int index, child) {
      return _pages[index];
          },),
      backgroundColor: Colors.grey.shade200,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingButton(),
      bottomNavigationBar: const BottomnavWidget(),
    );
  }
}
