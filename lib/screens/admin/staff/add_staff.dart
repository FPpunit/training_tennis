import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_pro/screens/admin/staff/provider/admin_staff_provider.dart';
import 'package:new_pro/utils/ui_helper/textfields.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';
import 'package:provider/provider.dart';

import '../../../custom/helpers.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_app_theme.dart';
import '../../../utils/my_styles.dart';



class AddStaff extends StatefulWidget {

  String appBarTitle;
  int? index;

  AddStaff({Key? key , required this.appBarTitle, this.index }) : super(key: key);

  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  bool isDetails = false;
  final formGlobalKey = GlobalKey < FormState > ();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = context.read<AdminStaffProvider>();

    if (widget.index != null) {
      final staffData = provider.resultList[widget.index!];
      nameController.text = staffData['name'] ?? '';
      phoneController.text = staffData['phone'] ?? '';
      emailController.text = staffData['email'] ?? '';
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    isDetails = (widget.appBarTitle == 'Details');
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer<AdminStaffProvider>(
      builder: (context, provider, child) {

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

          /// Remove btn
          actions: [
            Visibility(
              visible: isDetails,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: TextButton(onPressed: (){
                  if(widget.index != null){
                    provider.removeStaff(context: context,index: widget.index!);
                    // Navigator.pop(context);
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
              Form(
                key: formGlobalKey,
                child: Column(
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
              ),

              ///add/update Staff btn
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: ElevatedButton(onPressed: (){
                    if (formGlobalKey.currentState!.validate()) {
                      formGlobalKey.currentState!.save();

                      (isDetails)?provider.addOrUpdateStaff(context: context,isDetails: isDetails, name: nameController.text, phone: phoneController.text, email: emailController.text, index: widget.index!):
                      provider.addOrUpdateStaff(context: context,isDetails: isDetails, name: nameController.text, phone: phoneController.text, email: emailController.text);
                      Navigator.pop(context);
                    }

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
      );},
    );
  }
}