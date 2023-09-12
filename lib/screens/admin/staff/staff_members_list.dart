import 'package:flutter/material.dart';
import 'package:new_pro/locator.dart';
import 'package:new_pro/screens/admin/staff/provider/admin_staff_provider.dart';
import 'package:new_pro/screens/admin/staff/provider/provider.dart';

import 'package:new_pro/utils/constants.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';
import 'package:provider/provider.dart';
import '../../../custom/loader/progress_bar.dart';
import '../../../utils/my_app_theme.dart';
import 'add_staff.dart';

class StaffMembersListScreen extends StatefulWidget {
  const StaffMembersListScreen({Key? key}) : super(key: key);

  @override
  State<StaffMembersListScreen> createState() => _StaffMembersListScreenState();
}

class _StaffMembersListScreenState extends State<StaffMembersListScreen> {
 List resultList = [];

 @override
 void initState() {
   super.initState();
   locator<ProviderStaff>().getStaffListData(context: context);
 }

 @override

  Widget build(BuildContext context) {

   List resultList = Provider.of<ProviderStaff>(context).resultList;
    bool isLoading= Provider.of<ProviderStaff>(context).isLoading;
    print('ResultList -------------------------------------------------> $resultList');

        return Scaffold(
          appBar: mAppBar(title: staffMembers),
          body: (isLoading) ? const Progressbar() : Consumer<ProviderStaff>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    ///Staff list name and Add Staff btn
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          subTitleText(text: staffList),
                          ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddStaff(appBarTitle: addStaff,),));
                          },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                backgroundColor: MyAppTheme.MainColor,
                                //maximumSize: const Size(100, 40)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(Icons.add , color: MyAppTheme.whiteColor,
                                    size: 22,),
                                  subTitleText(text: addStaff)
                                ],
                              ))
                        ],
                      ),
                    ),

                    Container(
                      color: MyAppTheme.cardBgSecColor,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(left: 10),
                              child: white10Text(text: sno),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: white10Text(text: name),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: white10Text(text: phoneNum),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: ListView.builder(
                        itemCount: resultList.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Container(
                              height: 1,color: MyAppTheme.cardBgSecColor,
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              //padding: null,
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          height: double.infinity,
                                          padding: const EdgeInsets.symmetric(vertical: 15),
                                          alignment: Alignment.center,
                                          color: MyAppTheme.pointsCardBgSecColor,
                                          child: white12Text(text: '${index + 1}')
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                                          alignment: Alignment.centerLeft,
                                          height: double.infinity,
                                          child: white12Text(text: resultList[index]['name'])
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                          height: double.infinity,
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                                          color: MyAppTheme.pointsCardBgSecColor,
                                          child: white12Text(text: resultList[index]['phone'])
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: TextButton(onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddStaff(appBarTitle: details,index: index,),));
                                      }, child: const Text(editViewDetails,style: TextStyle(
                                          fontSize: 12,
                                          color: MyAppTheme.MainColor,
                                          fontWeight: FontWeight.w500
                                      ),)),)
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),),
                    )

                  ],
                );}
          )

        );
      }
}
//Provider.of<AdminStaffProvider>(context, listen: false).getStaffListData(context: context);

