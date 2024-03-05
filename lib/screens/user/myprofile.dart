

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lecafe/botNavBar/NavigationBar.dart';
import 'package:lecafe/constant/callFunctions.dart';
import 'package:lecafe/providers/mainprovider.dart';
import 'package:lecafe/screens/user/Register.dart';
import 'package:lecafe/screens/user/login.dart';
import 'package:lecafe/screens/user/menu.dart';
import 'package:lecafe/screens/user/myorder.dart';
import 'package:provider/provider.dart';

import 'editprofile.dart';
import 'favourites.dart';

class MyProfile extends StatelessWidget {
  String userid;
  MyProfile({super.key,required this.userid
  });

  List<String> profile = ["Edit Profile",
    "My Order",
    "Favourites",
    "Logout"];
  List<Icon> iconify = [
    Icon(Icons.arrow_forward_ios, color: Color(0xff85723A)),
    Icon(Icons.arrow_forward_ios, color: Color(0xff85723A)),
    Icon(Icons.arrow_forward_ios, color: Color(0xff85723A),),
    Icon(Icons.logout, color: Color(0xff85723A),),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E7E0),
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: InkWell(onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Bottombar(userid: userid,)));
          }, child: Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 60),
          child: Column(
            children: [
              Text("My Profile",
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,

                  color: Colors.white,

                ),
                Container(
                  height: 480,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,

                  color: Color(0xffE9E7E0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60,),
                    child: Consumer<MainProvider>(
                      builder: (context,val,child) {
                        return Column(
                          children: [
                            Text(
                                val.name , style: TextStyle(fontSize: 36,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),),

                                  Text( val.phone,
                                      style: TextStyle(fontSize: 20)),

                            SizedBox(height: 20,),
                            Container(
                              height: 280,
                              width: 280,
                              color: Color(0xffD9D9D9),
                              child: ListView.separated
                                (separatorBuilder: (context, index) {
                                return Divider(indent: 5,
                                  endIndent: 5,
                                  color: Color(0xff85723A),);
                              },
                                  shrinkWrap: true,
                                  itemCount: profile.length, itemBuilder: (
                                      BuildContext context, int index) {
                                    return ListTile(

                                      title: Text(profile[index]),
                                      trailing: Consumer<MainProvider>(
                                        builder: (context,val,child) {
                                          return InkWell(onTap: () {
                                            if (index == 0) {
                                              val.editRegister(userid);
                                              Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => Register(id: userid,from:"EDIT"),));
                                            } else if (index == 1) {
                                              Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => Order(),));
                                            } else if (index == 2) {
                                              Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => Favourites(),));
                                            } else if (index == 3) {
                                              alertbx(context);

                                            }
                                          }, child: iconify[index]);
                                        }
                                      ),

                                    );
                                  }),

                            )
                          ],
                        );
                      }
                    ),
                  ),

                ),

              ],
            ),
            Consumer< MainProvider>(
              builder: (context,val,child) {
                return Positioned(
                    top: 10,
                    left: 100,
                    child:
                    val.userimage!=''?CircleAvatar(radius: 80,backgroundImage: NetworkImage(val.userimage,scale: 2.5)):
                    Image.asset("assets/Ellipse 31.png", scale: 2.5));
              }
            ),
          ],
        ),
      ),

    );
  }

  alertbx(BuildContext context) {
    showDialog(
        context: context, builder: (context) {
      return Container(
        // decoration: BoxDecoration(border: Border.all(color: Color(0xff85723A))),


        child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side: BorderSide(color: Color(0xff85723A))),
          backgroundColor: Colors.grey.shade50,
          content: Container(
            height: 100,

            child: Column(
              children: [
                Text('Are you sure?',style: TextStyle(fontSize: 25)),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('No',style: TextStyle(color: Colors.red)),
                      InkWell(onTap: () {
                        FirebaseAuth auth=FirebaseAuth.instance;
                        auth.signOut();
                        callNextReplacement(context, Login());
                      },
                        child: Container(height: 30, width: 40,
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.green,)
                          ),

                        child: Center(child: Text("Yes",style: TextStyle(color: Colors.green),)),),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),


        ),
      );


    });


  }
}

