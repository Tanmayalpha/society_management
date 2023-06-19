import 'package:flutter/material.dart';
import 'package:society_management/utils/Color.dart';

class PricingView extends StatefulWidget {
  const PricingView({Key? key}) : super(key: key);

  @override
  State<PricingView> createState() => _PricingViewState();
}

class _PricingViewState extends State<PricingView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(
      leading: IconButton(onPressed: (){Navigator.pop(context);},icon:Icon(Icons.arrow_back), color: colors.whiteTemp,),
      backgroundColor: colors.primary,
      centerTitle: true,
      title: Text("Pricing",style: TextStyle(color: colors.whiteTemp)),));
  }
}