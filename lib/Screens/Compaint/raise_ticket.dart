import 'package:flutter/material.dart';
import 'package:society_management/utils/Color.dart';

class RaisTicketView extends StatefulWidget {
  const RaisTicketView({Key? key}) : super(key: key);

  @override
  State<RaisTicketView> createState() => _RaisTicketViewState();
}

class _RaisTicketViewState extends State<RaisTicketView> {

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
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
              child:/*isLodding ? Center(child: CircularProgressIndicator()) :*/Center(child: Text("Raise Ticket",style: TextStyle(color: colors.whiteTemp),))
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon:Icon(Icons.arrow_back), color: colors.whiteTemp,),
        backgroundColor: colors.primary,
        centerTitle: true,
        title: Text("Raise Ticket",style: TextStyle(color: colors.whiteTemp)),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          commonField('Name',  nameController),
          SizedBox(height: 5,),
          commonField('Mobile',  mobileController),
          SizedBox(height: 5,),
          commonField('House',  houseController),
          SizedBox(height: 5,),
          commonField('Description',  descriptionController),
          SizedBox(height: 5,),

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
