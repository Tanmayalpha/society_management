import 'dart:convert';
import 'dart:io';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:society_management/Api/api_services.dart';
import 'package:society_management/utils/Color.dart';



class EditeProfile extends StatefulWidget {
  const EditeProfile({Key? key, }) : super(key: key);

  @override
  State<EditeProfile> createState() => _EditeProfileState();
}

class _EditeProfileState extends State<EditeProfile> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController phonelController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController CompanyController = TextEditingController();
  TextEditingController ExpController = TextEditingController();
   TextEditingController deegreeController = TextEditingController();


  File? imageFile;
  File? registrationImage;
  final ImagePicker _picker = ImagePicker();
  bool? isFromProfile ;
  String? image;
  bool  isLodding = false;

  String? selectedState;
  String? selectedCity;
  String? selectedPlace;
  String? titleSelected;


  var stateselected;
  var cityselected;
  var placeselected;
  var selectedTitle;

  String? stateId;
  String?cityId;
  String?placeId;
  int? selectedSateIndex;





  Future<bool> showExitPopup() async {
    return await showDialog(
      //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
          title: Text('Select Image'),
          content: Row(
            // crossAxisAlignment: CrossAxisAlignment.s,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  _getFromCamera();
                },
                //return false when click on "NO"
                child: Text('Camera'),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  _getFromGallery();
                  // Navigator.pop(context,true);
                  // Navigator.pop(context,true);
                },
                //return true when click on "Yes"
                child: Text('Gallery'),
              ),
            ],
          )),
    ) ??
        false; //if showDialouge had returned null, then return false
  }

  _getFromCamera() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    /*  PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );*/
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }


  _getFromGallery() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    /* PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );*/
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      print("imaggggg ${imageFile}");
      Navigator.pop(context);
    }
  }

 /* Future<void> getFromGallery(int i) async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        if(i==1){
          imageFile = File(result.files.single.path.toString());
        }else  if(i==2) {
          registrationImage = File(result.files.single.path.toString());
        }
      });
      Navigator.pop(context);

    } else {
      // User canceled the picker
    }
  }*/

/*  Future getImage(ImgSource source, BuildContext context, int i) async {
    var image = await ImagePickerGC.pickImage(
      context: context,
      source: source,
      cameraIcon: const Icon(
        Icons.add,
        color: Colors.red,
      ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
    );
    getCropImage(context, i, image);
    Navigator.pop(context);
  }*/
 /* Future getImageGallery(ImgSource source, BuildContext context, int i) async {
    var image = await ImagePickerGC.pickImage(
      context: context,
      source: source,
      cameraIcon: const Icon(
        Icons.add,
        color: Colors.red,
      ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
    );
    //getCropImage(context, i, image);
    Navigator.pop(context);
  }*/

/*  void getCropImage(BuildContext context, int i, var image) async {
    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      // androidUiSettings: AndroidUiSettings(
      //     toolbarTitle: 'Cropper',
      //     toolbarColor: Colors.lightBlueAccent,
      //     toolbarWidgetColor: Colors.white,
      //     initAspectRatio: CropAspectRatioPreset.original,
      //     lockAspectRatio: false),
      // iosUiSettings: IOSUiSettings(
      //   minimumAspectRatio: 1.0,
      // )
    );
    setState(() {
      if (i == 1) {
        imageFile = File(croppedFile!.path);
      } else if (i == 2) {
        registrationImage = File(croppedFile!.path);
      }
      // else if(i==6){
      //   insuranceImage = File(croppedFile!.path);
      // }
      // else if(i==7){
      //   bankImage = File(croppedFile!.path);
      // }
      // else{
      //   _finalImage = File(croppedFile!.path);
      // }
    });
    Navigator.pop(context);
  }*/
  @override
  void initState() {
    //onTapCall2();
    // TODO: implement initState
    emailController.text =  '' ;
    nameController.text =  '' ;
    mobileController.text =  '' ;
    passController.text = '';
    ExpController.text =  '' ;
    CompanyController.text = '' ;
    dobController.text =  '' ;
    genderController.text =  '' ;
    deegreeController.text =  '' ;
    deegreeController.text =  '' ;
    image = '';




    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color:colors.secondary,
              borderRadius: BorderRadius.circular(10)
          ),
          height: 50,
          child: InkWell(
              onTap: (){
               // updateProfileApi();

              },
              child:isLodding ? Center(child: CircularProgressIndicator()) :Center(child: Text("Update Profile",style: TextStyle(color: colors.whiteTemp),))
          ),
        ),
      ),
      appBar: AppBar(title: Text('Profile'),), //customAppBar(text: "",isTrue: true, context: context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            const SizedBox(height: 20,),
            Stack(
                children:[
                  imageFile == null
                      ?  SizedBox(
                    height: 110,
                    width: 110,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      elevation: 5,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(image!, fit: BoxFit.fill,)
                        // Image.file(imageFile!,fit: BoxFit.fill,),
                      ),
                    ),
                  ) :

                  Container(
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(imageFile ?? File(''),fit: BoxFit.fill)
                      // Image.file(imageFile!,fit: BoxFit.fill,),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      // top: 30,
                      child: InkWell(
                        onTap: (){
                          isFromProfile = true ;
                         // requestPermission(context, 1);
                          showExitPopup();
                        },
                        child: Container(
                            height: 30,width: 30,
                            decoration: BoxDecoration(
                                color: colors.secondary,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.camera_enhance_outlined,color: Colors.white,)),
                      ))
                ]
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("Title", style: TextStyle(
                          color: colors.black54, fontWeight: FontWeight.bold),),
                    ),

                    SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("Name", style: TextStyle(
                          color: colors.black54, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Title',
                          hintStyle: TextStyle(
                              fontSize: 15.0, color: colors.secondary),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      // validator: (v) {
                      //   if (v!.isEmpty) {
                      //     return "name is required";
                      //   }
                      // },
                    ),

                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Email Id", style: TextStyle(
                          color: colors.black54, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Email Id',
                          hintStyle: TextStyle(
                              fontSize: 15.0, color: colors.secondary),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      // validator: (v) {
                      //   if (v!.isEmpty) {
                      //     return "Email is required";
                      //   }
                      //   if (!v.contains("@")) {
                      //     return "Enter Valid Email Id";
                      //   }
                      // },
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("Mobile No", style: TextStyle(
                          color: colors.black54, fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: mobileController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                          counterText: "",
                          hintText: 'Mobile No',
                          hintStyle: const TextStyle(
                              fontSize: 15.0, color: colors.secondary),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      // validator: (v) {
                      //   if (v!.isEmpty) {
                      //     return "mobile number is required";
                      //   }
                      //
                      // },
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("Password", style: TextStyle(
                          color: colors.black54, fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: passController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                          counterText: "",
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              fontSize: 15.0, color: colors.secondary),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: const EdgeInsets.only(left: 10, top: 10)
                      ),
                      // validator: (v) {
                      //   if (v!.isEmpty) {
                      //     return "mobile number is required";
                      //   }
                      //
                      // },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("City Name", style: TextStyle(
                          color: colors.black54, fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: dobController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'City Name',
                          hintStyle: const TextStyle(
                              fontSize: 15.0, color: colors.secondary),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      // validator: (v) {
                      //   if (v!.isEmpty) {
                      //     return "Date of Birth is required";
                      //   }
                      //
                      // },
                    ),

                    const SizedBox(
                      height: 10,
                    ),




                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("Experience ", style: TextStyle(
                          color: colors.black54, fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: ExpController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Experience Name',
                          hintStyle: const TextStyle(
                              fontSize: 15.0, color: colors.blackTemp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      // validator: (v) {
                      //   if (v!.isEmpty) {
                      //     return "Date of Birth is required";
                      //   }
                      //
                      // },
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Degree ", style: TextStyle(
                          color: colors.black54, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: deegreeController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Degree',
                          hintStyle: TextStyle(
                              fontSize: 15.0, color: colors.blackTemp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      // validator: (v) {
                      //   if (v!.isEmpty) {
                      //     return "Date of Birth is required";
                      //   }
                      //
                      // },
                    ),

                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Gender ", style: TextStyle(
                          color: colors.black54, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: genderController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Gender',
                          hintStyle: TextStyle(
                              fontSize: 15.0, color: colors.blackTemp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      // validator: (v) {
                      //   if (v!.isEmpty) {
                      //     return "Date of Birth is required";
                      //   }
                      //
                      // },
                    ),

                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Company Name ", style: TextStyle(
                          color: colors.black54, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: CompanyController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Company',
                          hintStyle: TextStyle(
                              fontSize: 15.0, color: colors.blackTemp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      // validator: (v) {
                      //   if (v!.isEmpty) {
                      //     return "Date of Birth is required";
                      //   }
                      //
                      // },
                    ),
                    SizedBox(height: 60,)

                    /*const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("Gender", style: TextStyle(
                          color: colors.black54, fontWeight: FontWeight.bold),),
                    ),

                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: genderController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Male',
                          hintStyle: TextStyle(
                              fontSize: 15.0, color: colors.secondary),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      // validator: (v) {
                      //   if (v!.isEmpty) {
                      //     return "Gender is required";
                      //   }
                      // },
                    ),
                    SizedBox(height: 10,)*/
                    // Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: Text("Registration Card", style: TextStyle(
                    //       color: colors.black54, fontWeight: FontWeight.bold),),
                    // ),
                    // SizedBox(height: 10,),

                    // InkWell(
                    //   onTap: (){
                    //     isFromProfile = false ;
                    //     requestPermission(context, 2);
                    //     // showExitPopup(isFromProfile ?? false);
                    //   },
                    //   child: Container(
                    //     width: double.infinity,
                    //     // height: MediaQuery.of(context).size.height/4,
                    //     height:   registrationImage == null ? 60:154,
                    //     child: DottedBorder(
                    //       borderType: BorderType.RRect,
                    //       radius: Radius.circular(5),
                    //       dashPattern: [5, 5],
                    //       color: Colors.grey,
                    //       strokeWidth: 2,
                    //       child: registrationImage == null || registrationImage == ""  ?
                    //       Center(child:Icon(Icons.drive_folder_upload_outlined,color: Colors.grey,size: 30,)): Column(
                    //         children: [
                    //           Image.file(registrationImage!,fit: BoxFit.fill,
                    //             height: 150,
                    //             width: double.infinity,),
                    //         ],
                    //       ),
                    //
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 10,),
                    // SizedBox(height: 45,),
                    // Center(
                    //   child: Btn(
                    //       height: 50,
                    //       width: 320,
                    //       color: colors.secondary,
                    //       title: 'Update',
                    //       // onPress: () {
                    //       //   {
                    //       //     Navigator.push(context,
                    //       //         MaterialPageRoute(
                    //       //             builder: (context) => HomeScreen()));
                    //       //   }
                    //       // },
                    //       onPress: () {
                    //         updateProfileApi();
                    //       }
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );

  }


  updateProfileApi() async{
    setState(() {
      isLodding = true;
    });

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userId  =  preferences.getString('userId');
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.getupdateUser}'));
    request.fields.addAll({
      'user_id': userId ?? '',
      'username': nameController.text,
      'mobile': mobileController.text,
      'address': dobController.text,
      'email': emailController.text,
      'gender': genderController.text,
      'company': CompanyController.text,
      'degree': deegreeController.text,
      'experience': ExpController.text,


    });
    print("this os p spos pms oskm ms=========>${request.files}");
   // request.files.add(await http.MultipartFile.fromPath('registration_card', registrationImage?.path ?? ''  ));
   if(imageFile != null){
     request.files.add(await http.MultipartFile.fromPath('image', imageFile?.path ?? ''));
   }
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final result =  await response.stream.bytesToString();
      final finalResult = json.encode(result);
      print("thi os ojon==========>${finalResult}");
     // Fluttertoast.showToast(msg: finalResult['message']);
      Fluttertoast.showToast(msg:'Updated Successfully');
      Navigator.pop(context);
      setState(() {
        isLodding =  false;
      });
    }
    else {
      setState(() {
        isLodding = false;
      });
      print(response.reasonPhrase);
    }

  }


  Future<void> _displayPickImageDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add optional parameters'),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('PICK'),
                  onPressed: () {

                  }),
            ],
          );
        });
  }
}





