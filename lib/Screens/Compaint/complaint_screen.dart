import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:society_management/Screens/Compaint/flateRent.dart';
import 'package:society_management/Screens/Compaint/flateSell.dart';
import 'package:society_management/Screens/Compaint/parkingVehicle.dart';
import 'package:society_management/Screens/Compaint/raise_ticket.dart';
import 'package:society_management/utils/Color.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaint'), backgroundColor: colors.primary,),
      body: SingleChildScrollView(
        child: Column(children: [
          ListView.builder(
            itemCount: complaintList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){

                  if(index == 0) {
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) =>RaisTicketView()));
                  }else if(index == 1){
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) =>FlatRentView()));
                  }else if(index == 2){
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) =>FlatSellView()));
                  }else if(index==3){
                    print('_____________________');
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) =>ParkingVehicleView()));
                  }
                },
                  child: complaintContainer(index));
            },)
        ],),
      ),
    );
  }


  Widget complaintContainer(int index) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 25, right: 25, top: 15),
          child: Container(
            height: 130,
            width: double.infinity,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [

                    const CircleAvatar(radius: 30,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80'),),
                    /*Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('dd').format(
                              DateTime.parse(model!
                                  .booking![index].date.toString())),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22),
                        ),
                        Text(
                          DateFormat('MMM').format(
                              DateTime.parse(model!
                                  .booking![index].date.toString())),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17),
                        ),
                      ],
                    ),*/
                    Container(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: 10,
                          right: 10),
                      child: DottedLine(
                        direction: Axis.vertical,
                        lineLength: double.infinity,
                        lineThickness: 1.0,
                        dashLength: 4.0,
                        dashColor: Colors.grey[600] ?? Colors.grey,
                        dashRadius: 0.0,
                        dashGapLength: 4.0,
                        dashGapColor: Colors.transparent,
                        dashGapRadius: 0.0,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            complaintList[index].title ?? '',
                            maxLines: 1,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight:
                                FontWeight.bold),
                          ),
                          /*Container(height: 2),
                          Text(
                            '',
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight:
                                FontWeight.bold),
                          ),*/
                          Container(height: 2),
                          const Text(
                            "date",
                            // model!.booking![index].date!,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12),
                          ),
                          Container(height: 2),
                          const Text(
                            "jlkjj",
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12),
                          )
                          // model!.booking![index].status == "Completed"
                          //     ? Container(
                          //  // width: 80,
                          //   height: 30,
                          //   alignment: Alignment.center,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10.0),
                          //     color: Colors.green
                          //   ),
                          //   child: Text(
                          //     model!.booking![index].status!,
                          //     maxLines: 1,
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 12),
                          //   ),
                          // )
                          //     : model!.booking![index].status == "Cancelled by user" ? Container(
                          //   //width: 80,
                          //   height: 30,
                          //   alignment: Alignment.center,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10.0),
                          //       color: Colors.red
                          //   ),
                          //   child: Text(
                          //     model!.booking![index].status!,
                          //     maxLines: 1,
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 12),
                          //   ),
                          // ) : model!.booking![index].status == "Cancelled by vendor" ?
                          // Container(
                          //   //width: 80,
                          //   height: 30,
                          //   alignment: Alignment.center,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10.0),
                          //       color: Colors.red
                          //   ),
                          //   child: Text(
                          //     model!.booking![index].status!,
                          //     maxLines: 1,
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //         color: appColorWhite,
                          //         fontSize: 12),
                          //   ),
                          // ) :
                          // Container(
                          // //  width: 80,
                          //   height: 30,
                          //   alignment: Alignment.center,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10.0),
                          //       color: backgroundblack
                          //   ),
                          //   child: Text(
                          //     model!.booking![index].status!,
                          //     maxLines: 1,
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //         color: appColorWhite,
                          //         fontSize: 12),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: colors.primary,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.arrow_forward, color: colors.whiteTemp,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }


  List<Complaint> complaintList = [
    Complaint(title: 'Raise ticket', id: '1'),
    Complaint(title: 'Flat given on rent', id: '2'),
    Complaint(title: 'Flat to sell ', id: '3'),
    Complaint(title: 'Parking vehicle', id: '4'),
    Complaint(title: 'Track/ Review Status', id: '4'),
  ];


}

class Complaint {
  String? title;

  String? id;

  Complaint({this.title, this.id});

}
