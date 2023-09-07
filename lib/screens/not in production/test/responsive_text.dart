import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:new_pro/screens/staff/score_management/score_management.dart';

class ResponsiveText extends StatefulWidget {
  const ResponsiveText({Key? key}) : super(key: key);

  @override
  State<ResponsiveText> createState() => _ResponsiveTextState();
}

class _ResponsiveTextState extends State<ResponsiveText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Responsive Text'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
            child: FractionallySizedBox(
              widthFactor: 0.5, // 50% of parent width
              heightFactor: 0.1, // 10% of parent height
              child: Text(
                'Responsive Text jciwuheruqy anim a auhfuwe acerbate ac;h',
                style: TextStyle(fontSize: 16), // Set a base font size
              ),
            ),
          ),
          const AutoSizeText(
            'Responsive Text',
            style: TextStyle(fontSize: 28,color: Colors.orange), // Set a base font size
            minFontSize: 10, // Minimum font size
            maxFontSize: 35, // Maximum font size
          ),
          Row(
            children: const [
              Flexible(
                child: Text(
                  'Responsive Text',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Flexible(
                child: Text(
                  'Another Text',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          )
        ],
      ),

    );
  }
}
