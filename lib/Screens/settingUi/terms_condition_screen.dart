import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:society_management/utils/Color.dart';
import 'package:http/http.dart' as http;


class TermsAndConditionView extends StatefulWidget {
  const TermsAndConditionView({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionView> createState() => _TermsAndConditionViewState();
}

class _TermsAndConditionViewState extends State<TermsAndConditionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon:Icon(Icons.arrow_back), color: colors.whiteTemp,),
        backgroundColor: colors.primary,
        centerTitle: true,
        title: Text("Terms & Condition",style: TextStyle(color: colors.whiteTemp)),),
      body:true ? Html(data: termsConditionData[0])
          : Container(child: Center(child: CircularProgressIndicator()),),
    );
  }

  Future<void> getPrivacy ()async{

   // var request = http.Request('GET', getDoctorUpdatePrivacyPolicy);

   //request.headers.addAll(doctorHeader);

   // http.StreamedResponse response = await request.send();

   // if (response.statusCode == 200) {
     // var result =await response.stream.bytesToString();
     // privacyResult = jsonDecode(result);
     // setState((){

     // });
  //  }
  //  else {
   //   print(response.reasonPhrase);
   // }

  }
}

var termsConditionData =  [
  "<h3><b>Terms and conditions</b></h3><p><strong xss=removed>Lorem Ipsum</strong><span xss=removed> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br></p>"
];