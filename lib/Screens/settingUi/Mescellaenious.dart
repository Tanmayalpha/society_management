import 'package:flutter/material.dart';
import 'package:society_management/Screens/settingUi/aboutUs.dart';
import 'package:society_management/Screens/settingUi/contact_us.dart';
import 'package:society_management/Screens/settingUi/pricing.dart';
import 'package:society_management/Screens/settingUi/privacy_policy_screen.dart';
import 'package:society_management/Screens/settingUi/refundPolicy.dart';
import 'package:society_management/Screens/settingUi/terms_condition_screen.dart';
import 'package:society_management/utils/Color.dart';

import 'governingLaw.dart';

class MiscelleniousView extends StatefulWidget {
  const MiscelleniousView({Key? key}) : super(key: key);

  @override
  State<MiscelleniousView> createState() => _MiscelleniousViewState();
}

class _MiscelleniousViewState extends State<MiscelleniousView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon:Icon(Icons.arrow_back), color: colors.whiteTemp,),
        backgroundColor: colors.primary,
        centerTitle: true,
        title: Text("Miscellenious",style: TextStyle(color: colors.whiteTemp)),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          commonListTile('assets/images/Term & Conditions.png', 'About Us', (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutUsView()),
          );}),
          commonListTile('assets/images/Privacy Policy.png', 'Privacy Policy', (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PrivacyPolicyView()),
          );}),
          commonListTile('assets/images/Term & Conditions.png', 'Terms &Conditions', (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TermsAndConditionView()),
          );}),
          commonListTile('assets/images/Privacy Policy.png', 'Governing Law', (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GoverningLawView()),
          );}),
          commonListTile('assets/images/Privacy Policy.png', 'Refund Policy', (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RefundPolicyView()),
          );}),
          commonListTile('assets/images/Privacy Policy.png', 'Pricing', (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PricingView()),
          );}),
          commonListTile('assets/images/Privacy Policy.png', 'Contact Us', (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactUsView()),
          );}),


        ],),
      ),
    );
  }



}

Widget commonListTile(String image, String title, VoidCallback onTap) {
  return ListTile(
      leading: Image.asset(
        image,
        height: 40,
        width: 40,
        color: colors.black54,
      ),
      title: Text(
        title,
      ),
      onTap: onTap
  );
}
