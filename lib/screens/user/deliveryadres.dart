import 'package:flutter/material.dart';
import 'package:lecafe/providers/mainprovider.dart';
import 'package:lecafe/screens/user/address.dart';
import 'package:provider/provider.dart';

import '../../constant/callFunctions.dart';

class deliveryadres extends StatelessWidget {
  String userid;
  deliveryadres({super.key,required this.userid});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffE9E7E0),
      appBar: AppBar(
        backgroundColor: const Color(0xffE9E7E0),
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        title: const Padding(
          padding: EdgeInsets.only(right: 50),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Center(
                  child: Text("Delivery Address",
                      style: TextStyle(color: Color(0xffE9E7E0), fontSize: 20)),
                ),
              ),
              Divider(
                  indent: 20,
                  endIndent: 0,
                  color: Color(0xff504A4A),
                  thickness: 3),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40, right: 10),
            child: Icon(Icons.search_outlined,
                size: 30, color: Colors.black.withOpacity(0.71)),
          )
        ],

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
      body:
      Column(
        children: [
          Consumer<MainProvider>(
              builder: (context,val,child) {
                print("hfgv"+val.delivry.length.toString());
                return Expanded(
                  child:
                   val.delivry.isNotEmpty?
                  ListView.builder(
                      shrinkWrap: true,

                      physics: const ScrollPhysics(),
                      itemCount:val.delivry.length,
                      itemBuilder: (context,index) {
                        var items=val.delivry[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          width: width,
                          height: 130,
                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),border: Border.all(width: 1,color: Color(0xff85723A) )),
                          // color: Colors.black38,
                          child: Row(
                              children: [
                                Radio(
                                  value:val.delivry[index].id,
                                  activeColor: Color(0xff85723A),
                                  groupValue: val.adresvalue,
                                  onChanged: ( value) {
                                    val.adresvalue=value.toString();
                                    // val.addressid=val.addressdetails[index].addressid;
                                    val.name = val.delivry[index].adname;
                                    val.Housename = val.delivry[index].adhousename;
                                    val.City = val.delivry[index].adcity;
                                    val.Disrict = val.delivry[index].adDist;
                                    val.Phone = val.delivry[index].adphone;

                                    val.notifyListeners();

                                  },
                                ),
                                // SizedBox(
                                //   width: 50,
                                // ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        items.adname,
                                        style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),

                                    Text(
                                        items.adhousename,
                                        style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                                    Text(
                                        items.adcity,
                                        style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                                    Text(
                                        items.adDist,
                                        style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),

                                    Row(
                                      children: [

                                        Text(
                                            items.adphone,
                                            style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                                        SizedBox(width: 150,),
                                        InkWell(onTap: () {
                                          val.deleteAdres(context,items.id,userid);
                                        },
                                            child: Icon(Icons.delete,color:  Color(0xff85723A),size: 25,)),

                                      ],
                                    ),

                              ]),
                        ]

                        )
                        );
                      }
                  ):
                   Center(child: Text("Empty",style: TextStyle(fontSize: 15,fontFamily: 'ink nut',fontWeight: FontWeight.w700,color:  Color(0xff85723A) ))),
                );
              }
          ),
          Consumer<MainProvider>(
            builder: (context,val,child) {

              return InkWell(onTap: () {
                callNext(context, Adress(userid: userid,));
              },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Center(child: Container(
                      height: 70,
                      width: 200,
                      decoration: BoxDecoration( color: Color(0xff85723A) ,borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text("Add New address",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700))),
                    ),
                    ),
                  )
              );
            }
          )

        ],
      ),

    );
  }
}
