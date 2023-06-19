import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:society_management/utils/Color.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon:Icon(Icons.arrow_back), color: colors.whiteTemp,),
        backgroundColor: colors.primary,
        centerTitle: true,
        title: Text("Contact Us",style: TextStyle(color: colors.whiteTemp)),),
      body:true ? Html(data: contactUsData[0])
          : Container(child: Center(child: CircularProgressIndicator()),),
    );
  }
}
var contactUsData =  [
  "<h2><strong xss=\"removed\">Contact Us</strong></h2>\r\n\r\n<p>For any kind of queries related to products, orders or services feel free to contact us on our official email address or phone number as given below :</p><p><b>Phone : +91 9876543210</b></p><p><b>Email : shashank_ecommerce@gmail.com</b></p>\r\n\r\n<h3><strong><span xss=\"removed\">Areas we deliver : </span></strong><span xss=\"removed\">﻿Entire Pasighat, Ayeng & Mebo</span></h3><span xss=\"removed\">\r\n\r\n</span><h3><strong><span xss=\"removed\">Delivery Timings :</span></strong><span xss=\"removed\"> </span><strong xss=\"removed\"><span xss=\"removed\">8:00 AM To </span></strong><strong xss=\"removed\"><span xss=\"removed\">6:00 PM</span></strong></h3><h3> <strong></strong>\r\n\r\n</h3><p><strong>Note : </strong>You can order for maximum 2 days in advance. i.e., Today & Tomorrow only.  <br></p>"
];