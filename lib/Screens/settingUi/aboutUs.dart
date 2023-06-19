import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:society_management/utils/Color.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon:Icon(Icons.arrow_back), color: colors.whiteTemp,),
        backgroundColor: colors.primary,
        centerTitle: true,
        title: Text("About Us",style: TextStyle(color: colors.whiteTemp)),),
      body:true ? Html(data: aboutUsData[0])
          : Container(child: Center(child: CircularProgressIndicator()),),
    );
  }
}
var aboutUsData =  [
  "<div xss=removed><div>Implify Your Life With Just One Click</div><br><br><br><div>Shashank Ecommerce is just what you’ve been looking for — a new, industry-leading App that gives users the chance to simplify their lives with one simple click. Our easy-to-use platform has a wide range of features that were created with an aim to help you live life to the fullest. With real-time options and unlimited access, this is one App you’ll definitely want to download. Check out what it can do for you.</div><br><br><br><div>At Shashank Ecommerce, we believe that exceptional service goes a long way. Headquartered in the heart of Pasighat, Shashank Ecommerce is one of the hottest new Apps around, offering a wide range of services that are aimed to simplify your life. Whether you’re looking for groceries or any other needs, Shashank Ecommerce is your go-to mobile solution for all your daily essential needs. Check out what we can do for you today!</div><br><br><br><div>With Shashank Ecommerce around, life becomes a whole lot easier. Curious to see what else our App can do? Download it to find out!</div></div>"
];