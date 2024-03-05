import 'package:flutter/material.dart';
import 'package:lecafe/screens/admin/orderdatails.dart';
import 'package:provider/provider.dart';

import '../../constant/callFunctions.dart';
import '../../providers/mainprovider.dart';

class viewOrdr extends StatelessWidget {
   viewOrdr({super.key});

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

          return ListView.builder(itemCount: val.orders.length,
            itemBuilder: (context, index) {

              return Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                margin: EdgeInsets.symmetric(vertical: 5),

                decoration: BoxDecoration(
                  color: Colors.white,
                ),

                child: ListTile(
                  trailing: Container(
                    margin: EdgeInsets.only(top: 29),
                      height: 28,width: 80,decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),color:  Color(0xff85723A).withOpacity(0.87)
                  ),
                      child: Center(child: InkWell(
                          onTap: (){
                            print("hjjjuhyggtrfn"+val.Housename);
                            print("jjihhyhnnm"+val.Name);
                            print("jjhhhhu"+val.City);
                            print("nbyhnhnnnn"+val.Disrict);
                            print("jikujtvdrt"+val.Phone);
                            val.getordereddetils();
                            callNext(context, OrderDet(Name:val.orders[index].adname, Housename:  val.orders[index].adhousename, City: val.orders[index].adcity, District: val.orders[index].addistrict, Phone: val.orders[index].adphone, orderid: val.orders[index].orderid,));},
                          child: Text("Check",style: TextStyle(color: Colors.white,fontSize: 17),)))),

                  title: Text(val.orders[index].adname,style: TextStyle(
                     fontWeight: FontWeight.w400,fontSize: 20),),
                  subtitle: Row(
                    children: [
                      Text(
                       val.orders[index].adhousename
                        ,style: TextStyle(
                        color: Colors.black38,fontSize: 18,),),
                      Text(","),
                      SizedBox(
                        width: 100,
                        child: Text(
                         val.orders[index].adcity
                          ,style: TextStyle(overflow:TextOverflow.ellipsis,
                          color: Colors.black38,fontSize: 18,),),
                      ),
                    ],
                  ),

                ),

              );

            },);
        }
      ),
    );
  }
}
