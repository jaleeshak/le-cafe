import 'package:flutter/material.dart';
import 'package:lecafe/providers/mainprovider.dart';
import 'package:provider/provider.dart';

import '../../botNavBar/NavigationBar.dart';
import '../../constant/callFunctions.dart';

class Success extends StatelessWidget {
  String userid;
   Success({super.key,required this.userid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E7E0),
      body: Padding(
        padding: const EdgeInsets.only(top: 240),
        child: Column(
          children: [
            Image.asset("assets/lori.png",scale:7 ,),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 30,),
              child: RichText(
                text: const TextSpan(
                  text: '   Order Confirmed !',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color:Color(0xffB1A581)),
                  children: <TextSpan>[TextSpan(text: '\nYour order has been placed successfully.\nDelivered today at 11:00 pm', style: TextStyle(fontSize: 26,fontWeight: FontWeight.w300, color: Color(0xffB1A581))),],
                ),
              ),
            ),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(onTap: () {
                  value.cartget(userid);
                  print("mmmm"+userid.toString());
                  callNext(context, Bottombar(userid:userid,));
                },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration( color: Color(0xff85723A) ,borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700))),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
