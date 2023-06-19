import 'package:flutter/material.dart';
import 'package:society_management/utils/Color.dart';

class FlatRentView extends StatefulWidget {
  const FlatRentView({Key? key}) : super(key: key);

  @override
  State<FlatRentView> createState() => _FlatRentViewState();
}

class _FlatRentViewState extends State<FlatRentView> {

  TextEditingController nameController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDatController = TextEditingController();
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
        title: Text("Flat On Rent",style: TextStyle(color: colors.whiteTemp)),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          commonField('Name',  nameController),
          SizedBox(height: 5,),
          commonField('From Date',  fromDateController),
          SizedBox(height: 5,),
          commonField('To Date',  toDatController),
          SizedBox(height: 5,),
          Text('Read Terms & services'),
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