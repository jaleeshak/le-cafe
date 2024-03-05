import 'package:flutter/material.dart';
import 'package:lecafe/screens/user/tracking.dart';
import 'package:provider/provider.dart';

import '../../constant/callFunctions.dart';
import '../../providers/mainprovider.dart';

class Order extends StatelessWidget {
  Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE9E7E0),
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Color(0xffE9E7E0),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_new_rounded)),
          ),
          title: Padding(
            padding: const EdgeInsets.only(right: 60),
            child: Consumer<MainProvider>(builder: (context, val, child) {
              return Column(
                children: [
                  Text("Order",
                      style: TextStyle(color: Color(0xffE9E7E0), fontSize: 20)),
                  Divider(
                      indent: 60,
                      endIndent: 60,
                      color: Color(0xff504A4A),
                      thickness: 3),
                ],
              );
            }),
          ),
          flexibleSpace: Container(
            height: 200,
            child: Image.asset(
              "assets/Ellipse 1 (3).png",
              fit: BoxFit.fill,
            ),
          ),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom:Radius.elliptical(400,80),)),
          // flexibleSpace: Container(
          //   height: 200,
          //   decoration: BoxDecoration(borderRadius: BorderRadius.vertical(bottom:Radius.circular(80))),
          // ),
        ),
        body: Consumer<MainProvider>(builder: (context, val, child) {
          return ListView.builder(
            itemCount: val.orders.length,
            itemBuilder: (context, index) {
              print("hcgvhcgvjcv" + val.orders[index].time.toString());
              return Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: ListTile(
                  trailing: Container(
                      height: 28,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff85723A)),
                      child: Center(
                          child: InkWell(
                              onTap: () {
                                callNext(
                                    context,
                                    tracking(
                                        Name: val.orders[index].adname,
                                        Housename:
                                            val.orders[index].adhousename,
                                        City: val.orders[index].adcity,
                                        District: val.orders[index].addistrict,
                                        Phone: val.orders[index].adphone,
                                        orderid: val.orders[index].orderid,status: val.orders[index].status,));
                              },
                              child: Text(
                                "Track",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              )))),
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        NetworkImage(val.orders[index].photo, scale: 20),
                  ),
                  title: Text(
                    val.orders[index].name,
                    style: TextStyle(color: Color(0xff85723A), fontSize: 15),
                  ),
                  subtitle: Text(
                    val.orders[index].time.toString(),
                    style: TextStyle(
                      color: Colors.green.shade400,
                      fontSize: 13,
                    ),
                  ),
                ),
              );
            },
          );
        }));
  }
}
