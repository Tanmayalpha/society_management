import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:society_management/Screens/settingUi/privacy_policy_screen.dart';
import 'package:society_management/utils/Color.dart';

class RefundPolicyView extends StatefulWidget {
  const RefundPolicyView({Key? key}) : super(key: key);

  @override
  State<RefundPolicyView> createState() => _RefundPolicyViewState();
}

class _RefundPolicyViewState extends State<RefundPolicyView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(
      leading: IconButton(onPressed: (){Navigator.pop(context);},icon:Icon(Icons.arrow_back), color: colors.whiteTemp,),
      backgroundColor: colors.primary,
      centerTitle: true,
      title: Text("Refund Policy",style: TextStyle(color: colors.whiteTemp)),),
        body:true ? Html(data: privacyPolicyData[0]) : SizedBox(),
    );
  }
}