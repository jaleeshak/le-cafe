import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/mainprovider.dart';

class OrderStatus extends StatelessWidget {
  String orderid;
 OrderStatus({super.key,required this.orderid});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E7E0),
      appBar: AppBar(
        backgroundColor: Color(0xffE9E7E0),
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: InkWell(onTap: () {
            Navigator.pop(context);
          }, child: Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0,right: 10),
                child: Text("TrackStatus",
                    style: TextStyle(color: Color(0xffE9E7E0), fontSize: 20)),
              ),
              Divider(indent: 50,
                  endIndent:60,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text("Ashish",style: TextStyle(color: Color(0xff504A4A),fontSize: 27)),
            ),
            Row(
              children: [
                Text("Order placed",style: TextStyle(color: Color(0xff85723A),fontSize: 20)),
                 SizedBox(width: 160), //SizedBox

                Consumer<MainProvider>(
                  builder: (context,val,child) {
                    return Radio(
                        activeColor:  Color(0xff85723A),
                        value: "Order Placed",
                        groupValue:val.ordervaluew,
                        onChanged: (value){
                          val.ordervaluew = value.toString();
                          val.notifyListeners();
                        }
                    );
                  }
                ),
              ],
            ),
            Row(
              children: [
                Text("Payment confirmed",style: TextStyle(color: Color(0xff85723A),fontSize: 20)),
                SizedBox(width: 98), //SizedBox

                Consumer<MainProvider>(
                    builder: (context,val,child) {
                      return Radio(
                          activeColor:  Color(0xff85723A),
                          value: "Payment confirmed",
                          groupValue:val.ordervaluew,
                          onChanged: (value){
                            val.ordervaluew= value.toString();
                            val.notifyListeners();
                          }
                      );
                    }
                ),
              ],
            ),

            Row(
              children: [
                Text("Order processed",style: TextStyle(color: Color(0xff85723A),fontSize: 20)),
                SizedBox(width: 126), //SizedBox

                Consumer<MainProvider>(
                    builder: (context,val,child) {
                      return Radio(
                          activeColor:  Color(0xff85723A),
                          value: "Order processed",
                          groupValue:val.ordervaluew,
                          onChanged: (value){
                            val.ordervaluew = value.toString();
                            val.notifyListeners();
                          }
                      );
                    }
                ),
              ],
            ),

            Row(
              children: [
                Text("Ready to pickup",style: TextStyle(color: Color(0xff85723A),fontSize: 20)),
                SizedBox(width: 132), //SizedBox

                Consumer<MainProvider>(
                    builder: (context,val,child) {
                      return Radio(
                          activeColor:  Color(0xff85723A),
                          value: "Ready to pickup",
                          groupValue:val.ordervaluew,
                          onChanged: (value){
                            val.ordervaluew = value.toString();
                            val.notifyListeners();
                          }
                      );
                    }
                ),
              ],
            ),
            SizedBox(height: 100,),
      Consumer<MainProvider>(
        builder: (context,val,child) {
          return InkWell(onTap: () {
            val.updateorder(orderid, context);
          },
            child: Container(
              height: 70,
              width: 150,
              decoration: BoxDecoration( color: Color(0xff85723A) ,borderRadius: BorderRadius.circular(20)),
              child: Center(child: Text("Update",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700))),
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
