import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lecafe/constant/callFunctions.dart';
import 'package:lecafe/constant/mywidget.dart';
import 'package:lecafe/providers/mainprovider.dart';
import 'package:lecafe/screens/admin/addcarosil.dart';
import 'package:lecafe/screens/admin/category.dart';
import 'package:lecafe/screens/admin/subcategry.dart';
import 'package:lecafe/screens/admin/uslist.dart';
import 'package:lecafe/screens/admin/vieworder.dart';
import 'package:lecafe/screens/user/login.dart';
import 'package:provider/provider.dart';

import 'carosal.dart';

class adHome extends StatelessWidget {
  String uid;
   adHome({super.key,required this.uid});

  @override
  Widget build(BuildContext context) {
    MainProvider provider=Provider.of<MainProvider>(context,listen: false);
    return Scaffold(

      appBar:  AppBar(
        backgroundColor: Color(0xffE9E7E0),
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.menu),
              ),
              Image.asset("assets/cakelo.png",scale: 20),

              Padding(
                padding: const EdgeInsets.only(right: 170),
                child: RichText(
                  text: const TextSpan(
                    text: "Le'",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xff85723A)),
                    children: <TextSpan>[TextSpan(text: 'Cafe', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black)),],
                  ),
                ),
              ),

            ],
          )
        ],
      ),
      backgroundColor: Color(0xffE9E7E0),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<MainProvider>(
            builder: (context,val,child) {
              return Padding(
                padding: const EdgeInsets.only(left: 40),
                child: InkWell(onTap: () {
                  val.getData();
                  callNext(context, Category());
                },child: ContainAd("Add Category")),
              );
            }
          ),
          InkWell(onTap: () {
            provider.allProductaData();
            callNext(context, Product());
          },child: ContainAd("Add Product")),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: InkWell(onTap: () {
              provider.UsersData();
              callNext(context, Usrlist());
            },child: ContainAd("Users List")),
          ),
          InkWell(onTap: () {
            provider.getordereddetils();
            callNext(context, viewOrdr());
          },child: ContainAd("View Orders")),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: InkWell(onTap: () {
              provider.getCarosalData();
              callNext(context, carosal());
            },child: ContainAd("Add Carosel")),
          ),
          InkWell(onTap: () {
            FirebaseAuth auth=FirebaseAuth.instance;
            auth.signOut();
            callNextReplacement(context, Login());
          },child: ContainAd("Log Out")),
        ],
      ),
    );
  }
}
