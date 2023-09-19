import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:new_pro/utils/my_colors.dart';
import '../../../utils/my_images.dart';
import '../../../utils/my_string.dart';
import '../../../utils/my_styles.dart';

class LogInScreen extends StatelessWidget {
  final List<String> items = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  String selectedValue = 'Option 2'; // Set your default value here

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dropdown Button Example'),
        ),
        body: Center(
          child: DropdownButton2<String>(
            value: selectedValue,
            onChanged: (String? newValue) {
              // Handle dropdown value changes
              selectedValue = newValue!;
            },
            items: items.map((String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: MyStyles.white14Regular,
                overflow: TextOverflow.ellipsis,
              ),
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
