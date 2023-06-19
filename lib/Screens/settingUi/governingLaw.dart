import 'package:flutter/material.dart';
import 'package:society_management/utils/Color.dart';

class GoverningLawView extends StatefulWidget {
  const GoverningLawView({Key? key}) : super(key: key);

  @override
  State<GoverningLawView> createState() => _GoverningLawViewState();
}

class _GoverningLawViewState extends State<GoverningLawView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(
      leading: IconButton(onPressed: (){Navigator.pop(context);},icon:Icon(Icons.arrow_back), color: colors.whiteTemp,),
      backgroundColor: colors.primary,
      centerTitle: true,
      title: Text("Governing Law",style: TextStyle(color: colors.whiteTemp)),));
  }
}
