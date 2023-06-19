import 'package:flutter/material.dart';
import 'package:society_management/utils/Color.dart';

class ParkingVehicleView extends StatefulWidget {
  const ParkingVehicleView({Key? key}) : super(key: key);

  @override
  State<ParkingVehicleView> createState() => _ParkingVehicleViewState();
}

class _ParkingVehicleViewState extends State<ParkingVehicleView> {

  TextEditingController typeController = TextEditingController();
  TextEditingController registrationController = TextEditingController();
  TextEditingController nameController = TextEditingController();
/*
  TextEditingController descriptionController = TextEditingController();
*/
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      bottomSheet: Padding(
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
              child:/*isLodding ? Center(child: CircularProgressIndicator()) :*/Center(child: Text("Submit",style: TextStyle(color: colors.whiteTemp),))
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon:Icon(Icons.arrow_back), color: colors.whiteTemp,),
        backgroundColor: colors.primary,
        centerTitle: true,
        title: Text("Parking Vehicle",style: TextStyle(color: colors.whiteTemp)),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Text('Vehicle Information',style: TextStyle(fontSize: 20)),
              const SizedBox(height: 5,),
          commonField('Vehicle Type',  typeController),
          SizedBox(height: 5,),
          commonField('Vehicle Registration No',  registrationController),
          SizedBox(height: 5,),
          commonField('Vehicle Owner Name',  nameController),
          SizedBox(height: 5,),
          Text('Read Terms & services'),
          const SizedBox(height: 15,),
              Text('Parking', style: TextStyle(fontSize: 20),),
              const SizedBox(height: 5,),
              commonField('Parking Start',  typeController),
              const SizedBox(height: 5,),
              commonField('Parking Removed',  registrationController),



        ]),
      ),
    );
  }

  Widget commonField(String title,  TextEditingController controller){

    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: title,
          hintStyle: const TextStyle(
              fontSize: 15.0, color: colors.secondary),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.only(left: 10, top: 10)
      ),
      // validator: (v) {
      //   if (v!.isEmpty) {
      //     return "name is required";
      //   }
      // },
    );
  }



}