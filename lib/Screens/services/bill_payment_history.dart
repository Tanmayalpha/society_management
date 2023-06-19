import 'package:flutter/material.dart';
import 'package:society_management/utils/Color.dart';

class Bill_Screen extends StatefulWidget {
  const Bill_Screen({Key? key}) : super(key: key);

  @override
  State<Bill_Screen> createState() => _Bill_ScreenState();
}

class _Bill_ScreenState extends State<Bill_Screen> {
  int currentindex = 0;
  List<Map<String, dynamic>> product = [
    {
      "name": "Rajkumar",
      "mobile": "8812345677",
    },
    {
      "name": "Tusar",
      "mobile": "88123445343",
    },
  ];
  List<Map<String, dynamic>> product2 = [
    {
      "name": "Tarasingh",
      "mobile": "4618845677",
    },
    {
      "name": "Gajni",
      "mobile": "77123445366",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            color: colors.primary,
            child: Center(
                child: Text(
              'Billing & Payment History',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: colors.whiteTemp),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: colors.primary,
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                currentindex = 0;
                              });
                            },
                            child: Container(
                                width: 124,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: currentindex == 0
                                        ? colors.secondary
                                        : colors.primary,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  'Upcomming',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: colors.whiteTemp),
                                )))),
                        InkWell(
                            onTap: () {
                              setState(() {
                                currentindex = 1;
                              });
                            },
                            child: Container(
                                width: 124,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: currentindex == 1
                                        ? colors.secondary
                                        : colors.primary,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Center(
                                    child: Text(
                                  'Due',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: colors.whiteTemp),
                                )))),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 1.4,
                    child: ListView.builder(
                      itemCount:
                          currentindex == 0 ? product.length : product2.length,
                      itemBuilder: (context, index) {
                        return currentindex == 0
                            ? InkWell(
                                onTap: () {
                                  popshow(product[index]["name"],
                                      product[index]["mobile"]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                        color: colors.darkIcon,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Name',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Text(
                                                    "- ${product[index]["name"]}",
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Mobile Number',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Text(
                                                    "- ${product[index]["mobile"]}",
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Gmail ID',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Text(
                                                    '- Shahjaha@gmail.com',
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Unit',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Text(
                                                    '- shop',
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Bill Amount',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Text(
                                                    '- 1200/-',
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Due Date',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Text(
                                                    '- 24/07/2023',
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  popshow2(product2[index]['name'],
                                      product2[index]['mobile']);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                        color: colors.lightBlue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Name',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Text(
                                                    "- ${product2[index]["name"]}",
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Mobile Number',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Text(
                                                    "- ${product2[index]["mobile"]}",
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Gmail ID',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Text(
                                                    '- Shahjaha@gmail.com',
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Unit',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Text(
                                                    '- shop',
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Bill Amount',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Text(
                                                    '- 1200/-',
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Due Date',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  )),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Text(
                                                    '- 24/07/2023',
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      },
                    )),
              ],
            ),
          )
        ]),
      ),
    ));
  }

  popshow(String nam, String nom) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 1),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(9),
                                    topRight: Radius.circular(9),
                                  ),
                                  color: colors.primary, //BorderRadius.Only
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  )),
                              child: Center(
                                  child: Text(
                                'Bill Details',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: colors.whiteTemp),
                              ))),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Column(children: [
                              Table(
                                border: TableBorder.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1),
                                defaultColumnWidth: FixedColumnWidth(140),
                                children: [
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            'Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            "${nam}",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            'Unit',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            "Shop",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            'Unit No',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            "B-007",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            'Area',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            "Devashnaka",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            'Bill No',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            "007",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            'Bill For The Month Of',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            "APR.2023",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            'Bill Date',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Text(
                                            "12 APR.2023",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Text(
                                            'Monthly Bill Ammount',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Text(
                                            "1200/-",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Text(
                                            'Previous Principle Due RS',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            "1700/-",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Previous Interest  Due RS',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "1200/-",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Current Interest On Principle Due RS',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "1600/-",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Granded Total',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "150056/-",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Prompt Payment Date',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "02/04/2023",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Bill Amount RS',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "30163/-",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Due Date',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "20/04/2024",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Bill Amount After Due Date',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "16378/-",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Mobile No.',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                nom,
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Email ID',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "tangad34@gmail.com",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Amount To Pay RS',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "345532763/-",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colors.primary,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Pay Now',
                                    style: TextStyle(
                                        fontSize: 12, color: colors.whiteTemp),
                                  ))
                            ]),
                          )
                        ]),
                      ),
                    ),

                    // Text(nam.toString())
                  ],
                ),
              ),
            ),
          );
        });
  }

  popshow2(String nam, String nom) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 1),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(9),
                                    topRight: Radius.circular(9),
                                  ),
                                  color: colors.primary, //BorderRadius.Only
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  )),
                              child: const Center(
                                  child: Text(
                                'Bill Details',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: colors.whiteTemp),
                              ))),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Column(children: [
                              Table(
                                border: TableBorder.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1),
                                defaultColumnWidth: FixedColumnWidth(140),
                                children: [
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Text(
                                            'Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            "${nam}",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Text(
                                            'Unit',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Text(
                                            "Shop",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Text(
                                            'Unit No',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Text(
                                            "B-007",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Text(
                                            'Area',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Text(
                                            "Devashnaka",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Text(
                                            'Bill No',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Text(
                                            "007",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            'Bill For The Month Of',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            "APR.2023",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            'Bill Date',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            "12 APR.2023",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            'Monthly Bill Ammount',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            "1200/-",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            'Previous Principle Due RS',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            "1700/-",
                                            style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Previous Interest  Due RS',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "1200/-",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Current Interest On Principle Due RS',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "1600/-",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Granded Total',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "150056/-",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Prompt Payment Date',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "02/04/2023",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Bill Amount RS',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "30163/-",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Due Date',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "20/04/2024",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Bill Amount After Due Date',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "16378/-",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Mobile No.',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                nom,
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Email ID',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "tangad34@gmail.com",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                'Amount To Pay RS',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: SizedBox(
                                              width: 125,
                                              child: Text(
                                                "345532763/-",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colors.primary,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Pay Now',
                                    style: TextStyle(
                                        fontSize: 12, color: colors.whiteTemp),
                                  ))
                            ]),
                          )
                        ]),
                      ),
                    ),

                    // Text(nam.toString())
                  ],
                ),
              ),
            ),
          );
        });
  }
}
