import 'package:flutter/material.dart';
import 'package:new_pro/utils/my_images.dart';

class StaffHomeScreen extends StatefulWidget {
  const StaffHomeScreen({Key? key}) : super(key: key);

  @override
  State<StaffHomeScreen> createState() => _StaffHomeScreenState();
}

class _StaffHomeScreenState extends State<StaffHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(MyImages.logo),
      ),
    );
  }
}
