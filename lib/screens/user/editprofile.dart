import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lecafe/screens/user/myprofile.dart';



class EditProfile extends StatelessWidget { String userid;
   EditProfile({super.key,required this.userid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E7E0),
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Color(0xffE9E7E0),
        // backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: InkWell(onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyProfile(userid:userid ,)));
          }, child: Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 60),
          child: Column(
            children: [
              Text("Edit Profile",
                  style: TextStyle(color: Color(0xffE9E7E0), fontSize: 20)),
              Divider(indent: 40,
                  endIndent: 40,
                  color: Color(0xff504A4A),
                  thickness: 3),

            ],
          ),
        ),
        flexibleSpace: Container(
          height: 200,
          child: Image.asset("assets/Ellipse 1 (3).png", fit: BoxFit.fill,),
        ),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom:Radius.elliptical(400,80),)),
        // flexibleSpace: Container(
        //   height: 200,
        //   decoration: BoxDecoration(borderRadius: BorderRadius.vertical(bottom:Radius.circular(80))),
        // ),
      ),

      body:
     Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18,top: 20),
            child: Text("Name:",style: TextStyle(color:Color(0xff85723A),fontSize: 20)),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15,),
            height: 50,
            width: 400,
            decoration: BoxDecoration(border: Border.all( color:Color(0xff85723A))),
            child: TextFormField(

              ),

            ),
    Padding(
      padding: const EdgeInsets.only(left: 18,top: 20),
      child: Text("Phone Number:",style: TextStyle(color:Color(0xff85723A),fontSize: 20)),
    ),

    SizedBox(height: 20,),
    Container(
    margin: EdgeInsets.symmetric(horizontal: 15,),
    height: 50,
    width: 400,
    decoration: BoxDecoration(border: Border.all( color:Color(0xff85723A))),
    child: TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
    ),

    ),
          SizedBox(height: 100,),
          Center(
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 15,),
              height: 50,
              width: 200,
              decoration: BoxDecoration( color:Color(0xff85723A),borderRadius: BorderRadius.circular(15)),
              child: Center(child: Text("Update",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w400),))

            ),
          ),



        ],
      ),

    );
  }
}
