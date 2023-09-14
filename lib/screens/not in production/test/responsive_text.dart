import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_pro/screens/staff/score_management/score_management.dart';

class ResponsiveText extends StatefulWidget {
  const ResponsiveText({Key? key}) : super(key: key);

  @override
  State<ResponsiveText> createState() => _ResponsiveTextState();
}

class _ResponsiveTextState extends State<ResponsiveText> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );


    // fToast.showToast(
    //   child: toast,
    //   gravity: ToastGravity.BOTTOM,
    //   toastDuration: Duration(seconds: 2),
    // );

    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            top: 16.0,
            left: 16.0,
            child: child,
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Responsive Text'),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 200,
          //   child: FractionallySizedBox(
          //     widthFactor: 0.5, // 50% of parent width
          //     heightFactor: 0.1, // 10% of parent height
          //     child: Text(
          //       'Responsive Text jciwuheruqy anim a auhfuwe acerbate ac;h',
          //       style: TextStyle(fontSize: 16), // Set a base font size
          //     ),
          //   ),
          // ),
          // AutoSizeText(
          //   'Responsive Text',
          //   style: TextStyle(fontSize: 28,color: Colors.orange), // Set a base font size
          //   minFontSize: 10, // Minimum font size
          //   maxFontSize: 35, // Maximum font size
          // ),
          // Row(
          //   children: [
          //     Flexible(
          //       child: Text(
          //         'Responsive Text',
          //         style: TextStyle(fontSize: 16),
          //       ),
          //     ),
          //     Flexible(
          //       child: Text(
          //         'Another Text',
          //         style: TextStyle(fontSize: 16),
          //       ),
          //     ),
          //   ],
          // )

          ElevatedButton(onPressed: (){
            Fluttertoast.showToast(
                msg: "This is Center Short Toast",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }, child: Text('toast'))
        ],
      ),

    );
  }
}
