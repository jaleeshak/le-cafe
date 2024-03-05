import 'package:flutter/material.dart';
import 'package:lecafe/providers/mainprovider.dart';
import 'package:lecafe/screens/admin/orderstatus.dart';
import 'package:provider/provider.dart';

import '../../constant/callFunctions.dart';

class OrderDet extends StatelessWidget {
  String Name,Housename,City,District,Phone,orderid;
   OrderDet({super.key,required this.Name,required this.Housename,required this.City,required this.District,required this.Phone,required this.orderid});

  @override
  Widget build(BuildContext context) {
    print("ghjnbvcdsdfg"+Phone.toString());
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
              child: Text("ViewOrders",
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
    body: Consumer<MainProvider>(
      builder: (context,val,child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 155,top: 15),
              child: Text("Delivery Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 320,
              height: 130,
              decoration: BoxDecoration(
                color:Colors.white70,
                border: Border.all(color: Color(0xff85723A)),
              ),
              child:Padding(
                padding: const EdgeInsets.only(left: 10,top: 10),
                child: Column(
                  children: [
                    Text(Name,
                      style: TextStyle( fontWeight: FontWeight.w400, color: Colors.black),),
                    Text(Housename,
                      style: TextStyle( fontWeight: FontWeight.w400, color: Colors.black),),
                    Text(City,
                      style: TextStyle( fontWeight: FontWeight.w400, color: Colors.black),),
                    Text(District, style: TextStyle( fontWeight: FontWeight.w400, color: Colors.black),),
                    Text(Phone, style: TextStyle( fontWeight: FontWeight.w400, color: Colors.black),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 260),
              child: Text("Orders",style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            SizedBox(height: 20,),

            Expanded(
              child: ListView.builder(itemCount: val.orders.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8),


                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:  Color(0xff85723A)),
                      color: Colors.white,
                    ),

                    child: ListTile(
                      leading: Container(
                          height:100,
                          width:50,

                          decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),
                            color:Colors.white,image: DecorationImage(image: NetworkImage((val.orders[index].photo))
                          )
                           // ,child: Image.network,scale: 5,
                          )
                      ),
                      title: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(val.orders[index].name,style: TextStyle(
                                // color:  Color(0xff85723A),
                              fontSize: 15),),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 17),
                                child: Icon(Icons.currency_rupee,size: 15,),
                              ),
                              Text(val.orders[index].price.toString(),style: TextStyle(
                                fontSize: 13,),),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150),
                            child: Text(val.orders[index].quantity,style: TextStyle(
                              fontSize: 13,),),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            margin: EdgeInsets.only(right: 120),
                              height: 38,width: 100,decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),color:  Color(0xff85723A)
                          ),
                              child: Center(child: InkWell(
                                  onTap: (){callNext(context, OrderStatus(orderid: orderid,));},
                                  child: Text("COLLECTED",style: TextStyle(color: Colors.white,fontSize: 13),)))),

                        ],
                      ),


                    ),

                  );

                },),
            )
          ],
        );
      }
    ),
    );
  }
}
