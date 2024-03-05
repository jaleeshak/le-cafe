import 'package:flutter/material.dart';
import 'package:lecafe/botNavBar/NavigationBar.dart';
import 'package:lecafe/constant/callFunctions.dart';
import 'package:lecafe/providers/mainprovider.dart';
import 'package:lecafe/screens/user/checkout.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  String userid;
 Cart({super.key,required this.userid});

  @override
  Widget build(BuildContext context) {
    List<String> imageData=[
      "assets/Ellipse 14.png",
      "assets/Ellipse 14.png",
      "assets/Ellipse 14.png",
      "assets/Ellipse 14.png",
      "assets/Ellipse 14.png",
      "assets/Ellipse 14.png",
    ];
    return Scaffold(
      backgroundColor: Color(0xffE9E7E0),
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Color(0xffE9E7E0),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: InkWell(onTap: () {
           callNextReplacement(context, Bottombar(userid: userid,));
          }, child: Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 60),
          child: Column(
            children: [
              Text("Cart",
                  style: TextStyle(color: Color(0xffE9E7E0), fontSize: 20)),
              Divider(indent: 80,
                  endIndent: 80,
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
       body:  SingleChildScrollView(
         child: Consumer<MainProvider>(
           builder: (context,val,child) {
             return val.cartloader?CircularProgressIndicator(color: Colors.blue,):val.checkcart?Column(
               children: [
                ListView.builder(
                     shrinkWrap: true,
                   itemCount: val.cartitems.length,
                 physics: NeverScrollableScrollPhysics(),
                   itemBuilder: (BuildContext context,int index) {


                   return Container(
                      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                        height: 100,
                        width: 20,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: CircleAvatar(
                                radius: 40,
                              backgroundImage: NetworkImage(val.cartitems[index].productsimage),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0,top: 25,right: 10),
                              child: Column(
                                children: [
                                  Text(val.cartitems[index].ProductName),
                                  Row(
                                    children: [

                                      Icon(Icons.currency_rupee,size: 15,),
                                      Text(val.cartitems[index].price),
                                    ],
                                  ),
                                  Text(val.cartitems[index].Quantity),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left:70,top: 20),
                            //   child: Column(
                            //
                            //     children: [
                            //       cakeCon("-"),
                            //       SizedBox(height: 2,),
                            //       cakeCon("1") ,
                            //       SizedBox(height: 2,),
                            //       cakeCon("+") ,
                            //     ],
                            //   ),
                            // )
                            InkWell(onTap: () {
                              // deleteditAlert(context,val.cartitems[index].id);
                              //  Navigator.pop(context);
                               val.deleteCart(context,val.cartitems[index].id);
                               print("djhbjvhbv"+val.cartitems[index].id.toString())
                               ;
                               // val.cartget(id);
                               print("yyjjj");


                            },

                                child: Icon(Icons.delete_forever,color:  Color(0xff504A4A),))
                          ],
                        )

                    );
                 }

                 ),
                 Consumer<MainProvider>(
                   builder: (context,val,child) {
                     return Row(
                       children: [

                         Padding(
                           padding: const EdgeInsets.only(left: 10),
                           child: Text("Subtotal:",style: TextStyle(color: Colors.grey),),
                         ),
                         Icon(Icons.currency_rupee,size: 15,),
                         Text(val.totalPrice.toString()),
                         SizedBox(width: 80,),
                         Text("Delivery Charge:",style: TextStyle(color: Colors.grey),),
                         Icon(Icons.currency_rupee,size: 15,),
                         Text("30",),
                       ],
                     );
                   }
                 ),
                 SizedBox(height: 10,),
                 Container(height: 60,
                   margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),

                   decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
                   child: Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 10),
                         child: Icon(Icons.currency_rupee,size: 15,),
                       ),
                       Text(val.total.toString()),
                       Padding(
                         padding: const EdgeInsets.only(left: 175),
                         child: Container(
                           height: 50,
                           width: 100,
                           decoration: BoxDecoration( color: Color(0xff85723A) ,borderRadius: BorderRadius.circular(20)),
                           child: Padding(
                             padding: const EdgeInsets.only(left: 0),
                             child: InkWell(onTap: () {
                               // print("hsfhdtfeff"+val.totalPrice.toString());
                               // print("hsfhd516515tfeff"+val.total.toString());
                               val.getallAdress(userid);
                               callNext(context, Checkout(from: "CART",userid: userid,productPRICE: val.totalPrice.toString(),totalprice: val.total.toString(),productid: val.productid,));
                             },child: Center(child: Text("Proceed",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700)))),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(height: 50,)
               ],
             ):Padding(
               padding: const EdgeInsets.only(top: 150,),
               child: Center(
                 child: Container(height: 50,
                     width: 70,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color:  Color(0xff85723A))),

                     child: Center(child: Text("Empty",style: TextStyle(color:  Color(0xff85723A)),))),
               ),
             );
           }
         ),
       ),

    );
  }
  deleteditAlert(context,String id){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // title: Text(' Alert Dialog'),
            content: Text('Are you sure?'),


            actions: <Widget>[
              // Consumer<MainProvider>(
              //     builder: (context,value,child) {
              //       return TextButton(
              //           onPressed: () {
              //             // value.carosalfileimg=null;
              //             Navigator.of(context).pop();
              //             // value.editcarosal(id);
              //             callNext(context, addCarosel(id:id,from: "EDIT"));
              //
              //
              //             //action code for "Yes" button
              //           },
              //
              //           // child: Text('Edit'));
              //     }
              // ),
              Consumer<MainProvider>(
                  builder: (context,val,child) {
                    return TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        val.deleteCart(context,id);

//close Dialog
                      },
                      child: Text('delete'),
                    );
                  }
              ),
            ],
          );
        });


  }

}
