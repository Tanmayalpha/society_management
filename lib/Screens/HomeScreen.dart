import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:society_management/Authentification/LoginScreen.dart';
import 'package:society_management/Screens/Compaint/complaint_screen.dart';
import 'package:society_management/Screens/membership/Membership.dart';
import 'package:society_management/Screens/profile/EditeProfile.dart';
import 'package:society_management/Screens/services/Services.dart';
import 'package:society_management/Screens/settingUi/Mescellaenious.dart';
import 'package:society_management/Screens/settingUi/privacy_policy_screen.dart';
import 'package:society_management/Screens/settingUi/terms_condition_screen.dart';
import 'package:society_management/utils/Color.dart';

class HomeScreen extends StatefulWidget {
  final bool? speciality;

  const HomeScreen({Key? key, this.speciality}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int currentindex = 0;

  List<String> sliderImages = [
    'https://shotkit.com/wp-content/uploads/2021/06/cool-profile-pic-matheus-ferrero.jpeg',
    'https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192223.jpg',
    'https://img.freepik.com/premium-photo/fashion-red-haired-girl-wear-black-dress-red-hat-posed-trade-shopping-center_151355-1430.jpg',
    'https://static.vecteezy.com/system/resources/thumbnails/006/631/541/small_2x/portrait-of-fashion-red-haired-girl-on-red-hat-and-black-dress-with-bright-make-up-posed-against-large-window-toned-style-instagram-filters-photo.jpg'
  ];

  List<NewsCard> cardList = [
    NewsCard(
        title: 'View/Pay Bill',
        image: 'https://im.indiatimes.in/content/2020/Jul/indian-currency-389006_1920_5f1547587ee6e.jpg'),
    NewsCard(
        title: 'Billing & Payment History',
        image: 'https://roundtmc.com/wp-content/uploads/2018/03/bill-2.png'),
    NewsCard(
        title: 'Submit Information',
        image: 'https://t3.ftcdn.net/jpg/03/08/01/88/360_F_308018888_dTriP4D0eoXGFCnGEsJt2qaSA69WpAmJ.jpg'),
    NewsCard(
        title: 'Annual Account',
        image: 'https://about.fb.com/wp-content/uploads/2020/09/NRP-Privacy_Matters_Account_Center_V7_JCh-01-1.jpg'),
    NewsCard(
        title: 'Election',
        image: 'https://im.indiatimes.in/content/2020/Jul/indian-currency-389006_1920_5f1547587ee6e.jpg'),
    NewsCard(
        title: 'Agenda & meeting',
        image: 'https://im.indiatimes.in/content/2020/Jul/indian-currency-389006_1920_5f1547587ee6e.jpg'),
    NewsCard(
        title: 'Important Record',
        image: 'https://im.indiatimes.in/content/2020/Jul/indian-currency-389006_1920_5f1547587ee6e.jpg'),
    NewsCard(
        title: 'Information',
        image: 'https://im.indiatimes.in/content/2020/Jul/indian-currency-389006_1920_5f1547587ee6e.jpg'),
    NewsCard(
        title: 'Update Profile',
        image: 'https://im.indiatimes.in/content/2020/Jul/indian-currency-389006_1920_5f1547587ee6e.jpg'),

  ];

  _CarouselSlider1() {
    return CarouselSlider(
        options: CarouselOptions(
            onPageChanged: (index, result) {
              setState(() {
                _currentPost = index;
              });
            },
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
            height: 180.0),
        items: sliderImages.map((e) {
          return Image.network(e);
        }).toList());
  }

  void initState() {
    super.initState();
    print("this is my speiality  ${widget.speciality}");

    //  getCatApi();
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  Future<Null> _refresh() {
    return callApi();
  }

  Future<Null> callApi() async {
    /* getuserProfile();
    getSliderApi();
    getCounting();
    getCatApi();*/
  }

  setFilterDataId(String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('LocalId', id);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Confirm Exit"),
                content: Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colors.primary),
                    child: Text("YES"),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colors.primary),
                    child: Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        return true;
      },
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: Scaffold(
          backgroundColor: colors.whiteScaffold,
          key: _key,
          drawer: getDrawer(),

          //appBar: customAppBar(context: context, text:"My Dashboard", isTrue: true, ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            colors.primary,
                            colors.secondary,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.02, 1]),

                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(1),
                        //
                        bottomRight: Radius.circular(1),
                      ),
                      //   color: (Theme.of(context).colorScheme.apcolor)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _key.currentState!.openDrawer();
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.dehaze_rounded,
                                color: colors.whiteTemp,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'Home',
                          style: TextStyle(
                              color: colors.whiteTemp,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          '         ',
                          style: TextStyle(
                              color: colors.transparent,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        //height: 200,
                        width: double.maxFinite,
                        child: _CarouselSlider1(),
                      ),
                      Positioned(
                        bottom: 20,
                        // left: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildDots(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _NewsUpdatecard(),
                  // SizedBox(height: 100,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  int _currentPost = 0;

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    if (false) {
    } else {
      for (int i = 0; i < 5; i++) {
        dots.add(
          Container(
            margin: EdgeInsets.all(1.5),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPost == i ? colors.secondary : colors.primary,
            ),
          ),
        );
      }
    }
    return dots;
  }

  newsCard(int i) {
    var item = cardList[i];
    return InkWell(
      onTap: () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String? role = preferences.getString('roll');
        print('__________${role}_________');

        Navigator.push(
            context, MaterialPageRoute(builder: (C) => ComplaintScreen()));

        /*if (i == 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (C) => UpdsateScreen()));
        } else if (i == 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (C) => EventAndWebiner()));
        } else if (i == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (C) => PharmaProductScreen()));
        } else if (i == 3) {
          Navigator.push(
              context, MaterialPageRoute(builder: (C) => Editorial()));
        } else if (i == 4) {
          Navigator.push(
              context, MaterialPageRoute(builder: (C) => AwarenessScreen()));
        } else {
          checkSubscriptionApi();

        }*/
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 3,),
              Container(
                height: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                        colors: [
                          colors.secondary,
                          colors.primary,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [.04, .8]),
                    image: DecorationImage(
                        image: NetworkImage(item.image ?? '',scale: 2, ),fit: BoxFit.cover
                    )),
              ),
              /*Stack(children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                          colors: [
                            colors.secondary,
                            colors.primary,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [.04, .8]),
                      image: DecorationImage(
                        image: NetworkImage(item.image ?? '',scale: 2, ),fit: BoxFit.cover
                      )),
                ),
                *//*countingModel?.data?[i].counter == "0" ||
                        countingModel?.data?[i].counter == ""
                    ? SizedBox()
                    :*//*
                *//*Positioned(
                    right: 32,
                    top: 10,
                    height: 20,
                    width: 20,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(60)),
                      child: Center(
                          child: Text(
                        "0",
                        style: TextStyle(color: Colors.white),
                      )),
                    ))*//*
              ]),*/
              const SizedBox(
                height: 5,
              ),
              Text(
                item.title ?? '',
                style: const TextStyle(
                    color: colors.secondary, fontWeight: FontWeight.w600, fontSize: 12),
                textAlign: TextAlign.center,
              ),

            ],
          )),
    );
  }

  _NewsUpdatecard() {
    return Container(
      //padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      // height: MediaQuery.of(context).size.height/1.0,
      child: /*countingModel == null
          ? Center(child: Text('No Data Found!!'))
          :*/
          GridView.builder(
        primary: false,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount:cardList.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,

            crossAxisSpacing: 0.5,
            mainAxisSpacing: .5,
            childAspectRatio: .95
            // childAspectRatio: 3/2.5
            ),
        itemBuilder: (context, index) {
          return newsCard(index);
        },
      ),
    );
  }

  getDrawer() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 1.3,
      child: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 120,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [colors.primary, colors.secondary],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // main
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?cs=srgb&dl=pexels-mohamed-abdelghaffar-771742.jpg&fm=jpg",
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "UserName",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        "user@gmail.com",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditeProfile(),
                          ));
                    },
                    child: Icon(
                      Icons.edit,
                      color: colors.whiteTemp,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  colors.white10,
                  colors.primary,
                ],
              ),
            ),
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Image.asset(
                  "assets/images/home.png",
                  color: colors.black54,
                  scale: 1.3,
                  height: 40,
                  width: 40,
                ),
              ),
              title: Text(
                'Home',
              ),
              onTap: () {

                Navigator.pop(context);
                /*Navigator.push(context,
                    MaterialPageRoute(builder: (Context) => ProfileScreen()));*/
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomeScreen()),
                // );
              },
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/drawer1.png",
              color: colors.black54,
              height: 40,
              width: 40,
            ),
            title: const Text(
              'Membership',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MembershipView()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/Term & Conditions.png",
              color: colors.black54,
              height: 40,
              width: 40,
            ),
            title: const Text(
              'Services ',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>ServicesView()),
              );
            },
          ),
          /*ListTile(
            leading: Image.asset(
              "assets/images/Term & Conditions.png",
              height: 40,
              width: 40,
              color: colors.black54,
            ),
            title: Text(
              'Terms &Conditions',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TermsAndConditionView()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/Privacy Policy.png",
              color: colors.black54,
              height: 40,
              width: 40,
            ),
            title: Text(
              'Privacy Policy',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyView()),
              );
            },
          ),*/
         true? Column(children: [
            ListTile(
              leading: Image.asset(
                "assets/images/sub.png",
                color: colors.black54,
                height: 40,
                width: 40,
              ),
              title: Text(
                'UseFull Links',
              ),
              onTap: () {
                /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubscriptionPlan()),
              );*/
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/histo.png",
                color: colors.black54,
                height: 30,
                width: 30,
              ),
              title: const Text(
                'Miscellenious',
              ),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MiscelleniousView()),
              );
              },
            ),
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Icon(
                  Icons.favorite_outline_rounded,
                  size: 30,
                  color: colors.black54,
                ),
              ),
              title: Text(
                'Rate Us',
              ),
              onTap: () {
               /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Wishlist()),
              );*/
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/Change Password.png",
                color: colors.black54,
                height: 40,
                width: 40,
              ),
              title: Text(
                'Change Password',
              ),
              onTap: () {
                /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdatePassword()),
              );*/
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/Share App.png",
                color: colors.black54,
                height: 40,
                width: 40,
              ),
              title: Text(
                'Share App',
              ),
              onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => HomeScreen()),
                //   );
              },
            ),
          ],) : SizedBox(),
          ListTile(
            leading: Image.asset(
              "assets/images/Sign Out.png",
              color: colors.black54,
              height: 40,
              width: 40,
              //color: Colors.grey.withOpacity(0.8),
            ),
            title: Text(
              'Sign Out',
            ),
            onTap: () async {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm Sign out"),
                      content: Text("Are  sure to sign out from app now?"),
                      actions: <Widget>[
                        ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: colors.primary),
                          child: Text("YES"),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            setState(() {
                              prefs.clear();
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                        ),
                        ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: colors.primary),
                          child: Text("NO"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}




class NewsCard {
  String? title;
  String? image;

  NewsCard({this.title, this.image});
}
