import 'package:flutter/material.dart';
import 'package:new_pro/screens/staff/staff_members_list.dart';
import 'package:new_pro/utils/ui_helper/textfields.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';

import '../../utils/constants.dart';
import '../../utils/my_app_theme.dart';
import '../../utils/my_styles.dart';

class AddStaff extends StatefulWidget {

  String appBarTitle;
  int? index;



  AddStaff({Key? key , required this.appBarTitle, this.index }) : super(key: key);

  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  bool isDetails = false;

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.index != null){
      nameController.text = contactData[widget.index!]['name'];
      phoneController.text = contactData[widget.index!]['phoneNumber'];
      emailController.text = contactData[widget.index!]['email'];
    }
  }

  @override
  Widget build(BuildContext context) {



    isDetails = (widget.appBarTitle == 'Details');
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.appBarTitle,
          style: MyStyles.white20Normal,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Card(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              color: MyAppTheme.cardBgColor,
              child: const Icon(
                Icons.arrow_back,
                color: MyAppTheme.whiteColor,
                size: 22,
              ),
            ),
          ),
        ),
        actions: [
          Visibility(
            visible: isDetails,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: TextButton(onPressed: (){
                if(widget.index != null){
                  contactData.removeAt(widget.index!);
                  setState(() {

                  });
                  Navigator.pop(context);
                }
              }, child: Text(
                remove,
                style: TextStyle(
                  color: MyAppTheme.challengeBtnBgColor,
                  fontSize: 12
                ),
              )),
            ),
          )
        ],
        backgroundColor: MyAppTheme.bgColor,
        //elevation: 0,
      ),
      body: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                subTitleText(text: name),
                nameTextfield(controller: nameController, icon: Icons.person),
                subTitleText(text: phoneNum),
                phoneNumberTextfield(
                  controller: phoneController,
                ),
                subTitleText(text: emailAddress),
                emailTextfield(controller: emailController, icon: Icons.email)
              ]
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: e,
                      ))
                  .toList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: ElevatedButton(onPressed: (){

                  if(isDetails){
                    contactData[widget.index!]['name'] = nameController.text;
                    contactData[widget.index!]['phoneNumber'] = phoneController.text;
                    contactData[widget.index!]['email'] = emailController.text;
                  }else{
                    contactData.add({
                      'name' : nameController.text,
                      'phoneNumber' : phoneController.text,
                      'email' : emailController.text,
                    });
                  }

                  Navigator.pop(context);
                },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    backgroundColor: MyAppTheme.MainColor,
                    fixedSize:  Size(width, 50),
                  ), child: Text(
                    (isDetails)? updateChanges : addStaff,
                    style: MyStyles.white14Regular,
                  ),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
