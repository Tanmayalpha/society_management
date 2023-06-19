import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:society_management/Screens/Compaint/complaint_screen.dart';
import 'package:society_management/Screens/services/bill_payment_history.dart';
import 'package:society_management/Screens/settingUi/Mescellaenious.dart';
import 'package:society_management/utils/Color.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon:Icon(Icons.arrow_back), color: colors.whiteTemp,),
        backgroundColor: colors.primary,
        centerTitle: true,
        title: Text("Services",style: TextStyle(color: colors.whiteTemp)),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          commonListTile('assets/images/Term & Conditions.png', 'View/Pay bill', (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Bill_Screen()),
          );}),
          commonListTile('assets/images/Privacy Policy.png', 'Billing & Payment History', (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Bill_Screen()),
          );}),
          commonListTile('assets/images/Term & Conditions.png', 'Annual Accounts', (){
            Fluttertoast.showToast(msg: 'Coming Soon');/*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TermsAndConditionView()),
          );*/}),
          commonListTile('assets/images/Privacy Policy.png', 'Complaints', (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ComplaintScreen()),
          );}),
          commonListTile('assets/images/Privacy Policy.png', 'Election', (){
            Fluttertoast.showToast(msg: 'Coming Soon');/*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RefundPolicyView()),
          );*/}),
          commonListTile('assets/images/Privacy Policy.png', 'Agenda & Meetings', (){
            Fluttertoast.showToast(msg: 'Coming Soon');/*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PricingView()),
          );*/}),
          commonListTile('assets/images/Privacy Policy.png', 'Important Records', (){
            Fluttertoast.showToast(msg: 'Coming Soon');/*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactUsView()),
          );*/}),
          commonListTile('assets/images/Privacy Policy.png', 'Gate Keeper', (){
            Fluttertoast.showToast(msg: 'Coming Soon');/*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactUsView()),
          );*/}),
          commonListTile('assets/images/Privacy Policy.png', 'CCTV Security', (){
            Fluttertoast.showToast(msg: 'Coming Soon');/*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactUsView()),
          );*/}),
          commonListTile('assets/images/Privacy Policy.png', 'Bill Resolution', (){
            Fluttertoast.showToast(msg: 'Coming Soon');
            /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactUsView()),
          );*/}),


        ],),
      ),
    );
  }



}