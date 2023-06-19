

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import 'package:society_management/Screens/HomeScreen.dart';
import 'package:society_management/utils/Color.dart';
import 'package:society_management/widgets/AppBtn.dart';



import '../api/api_services.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key,this.id}) : super(key: key);
  final id;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _value = 1;
  bool isMobile = false;
  bool isSendOtp = false;
  bool isLoading = false;
  bool isloader = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

 // LogInResponse? logInResponse ;

  int selectedIndex = 1;
  bool _isObscure = true;

  // String? password,
  //     mobile,
  //     username,
  //     email,
  //     id,
  //     mobileno;

/*  loginwitMobile() async {
    String? token ;
    *//*try{
      token  = await FirebaseMessaging.instance.getToken();
      print("-----------token:-----${token}");
    } on FirebaseException{
      print('__________FirebaseException_____________');
    }*//*
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('otp', "otp");
    preferences.setString('mobile', "mobile");
    print("this is apiiiiiiii");
    var headers = {
      'Cookie': 'ci_session=b13e618fdb461ccb3dc68f327a6628cb4e99c184'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.sendOTP}'));
    request.fields.addAll({
      'mobile': mobileController.text,
      'fcm_id' : '${token}'
    });
    print("aaaaaaaaaaaaaaa${request.fields}");

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("this is truuuuuuuuuuuuu");
      var finalresponse = await response.stream.bytesToString();
      final jsonresponse = json.decode(finalresponse);
      print("this is final responsesssssssssss${finalresponse}");
      // Future.delayed(Duration(seconds: 1)).then((_) {
      //   Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => VerifyOtp()
      //       ));
      // });
      print(" respomse here ${jsonresponse}");
        if (jsonresponse['error'] == false) {
        int? otp = jsonresponse["otp"];
        String mobile = jsonresponse["mobile"];
        print("otppppppppppppp${otp.toString()}");
        print("mobillllllllllllll${mobile.toString()}");
        print("this is final responsesssssssssss${finalresponse}");
        Fluttertoast.showToast(msg: '${jsonresponse['message']}');

      }
      else{
        Fluttertoast.showToast(msg: "${jsonresponse['message']}");
      }
    }
    else {
      print(response.reasonPhrase);
    }

  }*/
  emailPasswordLogin() async{
    String? token ;
    /*try{
      token  = await FirebaseMessaging.instance.getToken();
      print("-----------token:-----${token}");
    } on FirebaseException{
      print('__________FirebaseException_____________');
    }*/

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      'Cookie': 'ci_session=ecadd729e7ab27560c282ba3660d365c7e306ca0'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.login}'));
    // var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}login'));
    request.fields.addAll({
      'email': '${emailController.text}',
      'password': '${passwordController.text}',
      'fcm_id':'${token}'
    });
    print("Checking all fields here ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
    //  final jsonResponse = LogInResponse.fromJson(json.decode(finalResponse));
      setState(() {
       /// logInResponse = jsonResponse;
      });

      /*if(!(logInResponse?.error ?? false) ){
        prefs.setString('roll',logInResponse?.data?.first.roll ?? '1');
        prefs.setString('userId', logInResponse?.data?.first.id ?? "54" );
        prefs.setString('userMobile', logInResponse?.data?.first.mobile ?? "8989898989" );
        prefs.setBool('isLogin', true );
        String? Data =  prefs.getString('roll');
        print("this is data Id=========>sure${Data}");
        print("rooooooooooooooooooooooooooooo${logInResponse?.data?.first.roll}");
        print("this is data mobile=========>sure${logInResponse?.data?.first.mobile}");
        Fluttertoast.showToast(msg: logInResponse?.message ?? '' );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }
      else{
        Fluttertoast.showToast(msg: logInResponse?.message ?? '' );
        setState(() {
          isLoading1 = false;
        });
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }
    }
    else {
      setState(() {
        isLoading1 = false;
      });
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      print(jsonResponse.toString());
    */}
  }
  bool isLoading1 = false;
  @override
  void initState()  {
  //  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    /*_firebaseMessaging.getToken().then((token){
      print("token is print-------------> $token");
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.primary,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0.75),
                child: Container(
                    height: MediaQuery.of(context).size.height/3.0,
                    child: Image.asset("assets/images/drawer1.png",scale: 6.2,)),
              ),
              Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: colors.whiteTemp,
                     // borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
                  ),

                  height: MediaQuery.of(context).size.height/1.30,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text("Login",style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold,fontSize: 35),),
                      SizedBox(height: 15,),
                      /*Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: 1,
                            fillColor: MaterialStateColor.resolveWith(
                                    (states) =>  colors.secondary),
                            activeColor:  colors.secondary,
                            groupValue: _value,
                            onChanged: (int? value) {
                              setState(() {
                                _value = value!;
                                isMobile = false;
                              });
                            },
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                                color: colors.secondary, fontSize: 21),
                          ),
                          SizedBox(height: 10,),
                          *//*Radio(
                              value: 2,
                              fillColor: MaterialStateColor.resolveWith(
                                      (states) => colors.secondary),
                              activeColor:   colors.secondary,
                              groupValue: _value,
                              onChanged: (int? value) {
                                setState(() {
                                  _value = value!;
                                  isMobile = true;
                                });
                              }),
                          // SizedBox(width: 10.0,),
                          const Text(
                            "Mobile No",
                            style: TextStyle(
                                color:  colors.secondary, fontSize: 21),
                          ),*//*
                        ],
                      ),*/
                      /*isMobile == false
                          ?*/ Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 10, left: 20, right: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Card(
                                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
                                elevation:4,
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: colors.whiteTemp,
                                    //Theme.of(context).colorScheme.gray,
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailController,
                                      validator: (msg) {
                                        if (msg!.isEmpty) {
                                          return "Please Enter Valid Email id!";
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: "",
                                        contentPadding: EdgeInsets.only(
                                            left: 15, top: 15),
                                        hintText: "Enter Email",hintStyle: TextStyle(color: colors.secondary),
                                        // labelText: "Enter Email id",
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: colors.secondary,
                                          size: 24,
                                        ),
                                        // border: OutlineInputBorder(
                                        //   borderRadius: BorderRadius.circular(10),
                                        // ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Card(
                                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                elevation: 4,
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color:colors.whiteTemp ),
                                  child: Center(
                                    child: TextFormField(
                                      obscureText: _isObscure,
                                      controller: passwordController,
                                      // obscureText: _isHidden ? true : false,
                                      keyboardType: TextInputType.text,
                                      validator: (msg) {
                                        if (msg!.isEmpty) {
                                          return "Please Enter Valid Password!";
                                        }
                                      },
                                      // maxLength: 10,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          counterText: "",
                                          contentPadding: const EdgeInsets.only(
                                              left: 15, top: 15),
                                          hintText: "Password",hintStyle: TextStyle(color: colors.secondary),
                                          prefixIcon: const Icon(
                                            Icons.lock,
                                            color: colors.secondary,
                                            size: 24,

                                          ),
                                          suffixIcon: IconButton(
                                              icon: Icon(
                                                _isObscure ? Icons.visibility : Icons.visibility_off,color: colors.secondary,),
                                              onPressed: () {
                                                setState(() {
                                                  _isObscure = !_isObscure;
                                                });
                                              })
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    /*Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UpdatePassword()));*/
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            color: colors.secondary,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Btn(
                                height: 50,
                                width: 320,
                                title: isLoading1 == true ? "Please wait......" : 'Sign In',
                                onPress: () {
                                  setState(() {
                                    isLoading1 = true;
                                  });
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                                    //emailPasswordLogin();
                                  } else {
                                    setState(() {
                                      isLoading1 = false;
                                    });
                                    Fluttertoast.showToast(
                                        msg:
                                        "Please Enter Correct Credentials!!");
                                  }
                                },
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Dont have an account?",style: TextStyle(color: colors.blackTemp,fontSize: 14,fontWeight: FontWeight.bold),),
                                  TextButton(onPressed: (){
                                    /*Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));*/
                                  }, child: Text("SignUp",style: TextStyle(color: colors.secondary,fontSize: 16,fontWeight: FontWeight.bold),))
                                ],
                              )

                            ],
                          ),
                        ),
                      )
                          /*: SizedBox.shrink(),
                      isMobile == true
                          ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: colors.whiteTemp,
                            //Theme.of(context).colorScheme.gray,
                          ),
                          child: Card(
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 4,
                            child: Center(
                              child: TextFormField(
                                controller: mobileController,
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                validator: (v) {
                                  if (v!.length != 10) {
                                    return "mobile number is required";
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: "",
                                  contentPadding:
                                  EdgeInsets.only(left: 15, top: 15),
                                  hintText: "Mobile Number",hintStyle: TextStyle(color: colors.secondary),
                                  prefixIcon: Icon(
                                    Icons.call,
                                    color:colors.secondary,
                                    size: 20,
                                  ),

                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                          : SizedBox.shrink(),
                        isMobile == true
                          ? Padding(
                          padding: const EdgeInsets.only(
                              top: 80, left: 20, right: 20),
                          child:
                          InkWell(
                              onTap: (){
                                setState((){
                                  isLoading = true;
                                });
                                if(mobileController.text.isNotEmpty && mobileController.text.length == 10){
                                  loginwitMobile();
                                }else{
                                  setState((){
                                    isLoading = false;
                                  });
                                  Fluttertoast.showToast(msg: "Please enter valid mobile number!");
                                }
                              },
                              child:  Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: colors.secondary),
                                child:
                                // isloader == true ? Center(child: CircularProgressIndicator(color: Colors.white,),) :
                                Center(child: Text("Send OTP", style: TextStyle(fontSize: 18, color: colors.whiteTemp))),
                              )
                          )

                      )
                          : SizedBox.shrink(),*/
                    ],
                  )


              )

              // Container(
              //   color: colors.primary,
              //   child:
              // )
            ],
          ),
        ),
      ),
    );
  }
}

