import 'package:flutter/material.dart';
import 'package:lecafe/botNavBar/NavigationBar.dart';
import 'package:lecafe/constant/callFunctions.dart';
import 'package:lecafe/providers/mainprovider.dart';
import 'package:lecafe/screens/user/address.dart';
import 'package:lecafe/screens/user/deliveryadres.dart';
import 'package:lecafe/screens/user/menu.dart';
import 'package:lecafe/screens/user/success.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
    String  from,userid,productPRICE,totalprice;
    List  productid;
   Checkout({super.key,required this.from,required this.userid,required this.productPRICE,required this.totalprice,required this.productid});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {

  int _value=0;
  @override
  Widget build(BuildContext context) {
    print("gcvdhcgvdgc"+widget.productPRICE);
    print("gcvdhchffgvdgc"+widget.totalprice);
    return Scaffold(
        backgroundColor: Color(0xffE9E7E0),

        appBar: AppBar(
      toolbarHeight: 50,
      backgroundColor: Color(0xffE9E7E0),
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
              padding: const EdgeInsets.only(left: 48),
              child: Text("Checkout",
                  style: TextStyle(color: Color(0xffE9E7E0), fontSize: 20)),
            ),
            Divider(indent: 50,
                endIndent: 0,
                color: Color(0xff504A4A),
                thickness: 3),

          ],
        ),
      ),
      actions: [
        Padding(
            // Color(0xff85723A)
          padding: const EdgeInsets.only(bottom: 40,
              right: 20),
          child: Icon(Icons.shopping_bag,size: 30,color: Colors.black.withOpacity(0.71)),
        )
      ],

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
        builder: (context,value,child) {
          return Column(
    children: [
    SizedBox(height: 30,),
    Center(
    child: Center(
    child: Column(
    children: [
    Text('Delivery Address',style: TextStyle(fontSize: 20),),
    SizedBox(height: 10,),
    Stack(
          children: [
            Column(
              children: [
                Consumer<MainProvider>(
                  builder: (context,val,child) {
                    val.Name=val.delivry.isNotEmpty?val.delivry.last.adname:"";
                    val.Housename=val.delivry.isNotEmpty?val.delivry.last.adhousename:"";
                    val.City=val.delivry.isNotEmpty?val.delivry.last.adcity:"";
                    val.Disrict=val.delivry.isNotEmpty?val.delivry.last.adDist:"";
                    val.Phone=val.delivry.isNotEmpty?val.delivry.last.adphone:"";

                    return Container(
                    width: 270,
                    height: 200,
                    decoration: BoxDecoration(
                    color:Colors.white,borderRadius: BorderRadius.circular(10)
                    ),
                    child:Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10,top: 10),
                              child: Text("Current Address",style: TextStyle(color: Color(0xff85723A),fontSize: 18)),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),

                              child: Image.asset("assets/tick.png",scale: 24,),
                            )
                          ],
                        ),
                        Divider(color: Color(0xff85723A).withOpacity(0.75),endIndent: 5,indent: 5,),
                        Text(value.Name,style: TextStyle(color: Colors.black45,fontSize:16),),
                        Text(value.Housename,style: TextStyle(color: Colors.black45,fontSize:16),),
                        Text(value.City,style: TextStyle(color: Colors.black45,fontSize:16),),
                        Text(value.Disrict,style: TextStyle(color: Colors.black45,fontSize:16),),
                        Text(value.Phone,style: TextStyle(color: Colors.black45,fontSize:16),),
                      ],
                    ),
                    );
                  }
                ),
                Container(
                 height: 20,
                  width: MediaQuery.of(context).size.width,

                )
              ],
            ),

            Positioned(
              left: 45,
              top:170,child: Consumer<MainProvider>(
                builder: (context,val,child) {
                  return Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration( color: Color(0xff85723A) ,borderRadius: BorderRadius.circular(10)),
 child: Center(child: InkWell(onTap: () {

  val.getallAdress(widget.userid);
  callNext(context, deliveryadres(userid: widget.userid,));
},child: Text("change/Add New",style: TextStyle(color: Colors.white,)))),

            );
                }
              ),)

          ],
    ),
    SizedBox(height: 10,),
          Text('Payment Details',style: TextStyle(fontSize: 20),),
    Container(

          width: 270,
          height: 230,
          decoration: BoxDecoration(
              color:Color(0xffD9D9D9),borderRadius: BorderRadius.circular(10)
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Consumer<MainProvider>(
                  builder: (context,val2,child) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                                activeColor: Color(0xff85723A),
                                value: "Cash On Delivery ",
                                groupValue:val2.checkvalue3,
                                onChanged: (value){
                                  val2.checkvalue3 = value.toString();
                                  val2.notifyListeners();
                                }
                            ),
                            Container(
                                width: 210,
                                height: 60,
                                decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(10)),
                                child: Row(

                                  children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 20),
                                     child: Image.asset('assets/cassh.png',scale: 20,),
                                   ),
                                    SizedBox(width: 20,),
                                    Center(child:  Text(
                                      "Cash On Delivery",
                                      style:
                                      TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.black,fontFamily: "ink nut"),
                                    ),),
                                  ],
                                ))                     ],
                        ),SizedBox(height: 10,),
                        Row(
                          children: [
                            Radio(
                                activeColor:  Color(0xff85723A),
                                value: "Google Pay",
                                groupValue:val2.checkvalue3,
                                onChanged: (value){
                                  val2.checkvalue3 = value.toString();
                                  val2.notifyListeners();
                                }
                            ),
                            Container(
                                width: 210,
                                height: 60,
                                decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Image.asset('assets/download.png',scale: 1.4,),
                                    ),
                                    SizedBox(width: 20,),
                                    Center(child:  Text(
                                      "Google Pay",
                                      style:
                                      TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color:  Colors.black,fontFamily: "ink nut"),
                                    ),),
                                  ],
                                ) )
                          ],
                        ),SizedBox(height: 10,),
                        Row(
                          children: [
                            Radio(
                                activeColor:  Color(0xff85723A),
                                value: "Debit/Credit card",
                                groupValue:val2.checkvalue3,
                                onChanged: (value){
                                  val2.checkvalue3 = value.toString();
                                  val2.notifyListeners();
                                }
                            ),
                            Container(
                                width: 210,
                                height: 60,
                                decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Icon(Icons.credit_card_outlined,size: 28),
                                          ),
                                    SizedBox(width: 20,),
                                    Center(child:  Text(
                                      "Debit/Credit card",
                                      style:
                                      TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color:  Colors.black,fontFamily: "ink nut"),
                                    ),),
                                  ],
                                ) )
                          ],
                        ),

                      ],
                    );
                  }
              ),

          //     Container(
          //       margin: EdgeInsets.only(left: 10,right: 10),
          //
          //       width: 270,
          //       height: 60,
          //       decoration: BoxDecoration(
          //
          //           color:Colors.white,borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Color(0xff85723A))
          //       ),
          //       child: Row(
          //         children: [
          //           Radio(activeColor: Color(0xff85723A),value: 1, groupValue: _value, onChanged: (value){
          //             setState(() {
          //               _value=value!;
          //             });
          //           }),
          //         width: 210,
              //                                 height: 60,
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10),
          //             child: Text('Net Banking',style: TextStyle(color: Color(0xff85723A),fontSize: 16),),
          //           ),
          //
          //
          //         ],
          //       ),
          //     ),
          //
          //     Container(
          //       margin: EdgeInsets.only(left: 10,right: 10),
          //
          //       width: 270,
          //       height: 60,
          //       decoration: BoxDecoration(
          //           color:Colors.white,borderRadius: BorderRadius.circular(10),border: Border.all(color: Color(0xff85723A))
          //       ),
          //       child: Row(
          //         children: [
          //           Radio(activeColor: Color(0xff85723A),value: 2,
          //               groupValue: _value, onChanged: (value){
          //             setState(() {
          //               _value=value!;
          //             });
          //           }),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10),
          //             child: Icon(Icons.credit_card_outlined,size: 28),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10),
          //             child: Text('Debit/Credit card',style: TextStyle(color: Color(0xff85723A),fontSize: 16),),
          //           ),
          //
          //
          //         ],
          //       ),
          //     ),
          //
          //
          //     Container(
          //       margin: EdgeInsets.only(left: 10,right: 10),
          //
          //       width: 270,
          //       height: 60,
          //       decoration: BoxDecoration(
          //           color:Colors.white,borderRadius: BorderRadius.circular(10),
          //          border: Border.all(color: Color(0xff85723A))
          //       ),
          //       child: Row(
          //         children: [
          //           Radio(activeColor: Color(0xff85723A),value: 3, groupValue: _value, onChanged: (value){
          //             setState(() {
          //               _value=value!;
          //             });
          //           }),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10),
          //             child: Image.asset('assets/cassh.png',scale: 20,),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10),
          //             child: Text('Cash on delivery',style: TextStyle(color: Color(0xff85723A),fontSize: 16),),
          //           ),
          //
          //
          //         ],
          //       ),
          //     ),

            ],
          ),

    ),

    // Container(
    // width: 270,
    // height: 40,
    // decoration: BoxDecoration(
    // color:Color(0xff50412b),borderRadius: BorderRadius.circular(10)
    // ),
    // child: Row(
    // children: [
    // Image(image: AssetImage('assets/icons2.png')),
    // Padding(
    // padding: const EdgeInsets.only(left: 10),
    // child: Text('UPI - PayTM',style: TextStyle(color: Colors.white70,fontFamily: 'cantata',fontSize: 16),),
    // ),
    //
    //
    // ],
    // ),
    // ),
    // SizedBox(height: 10,),
    // ElevatedButton(
    //
    // style:ElevatedButton.styleFrom(
    // backgroundColor:Colors.red,
    // elevation:5,
    // minimumSize: Size(160, 40)
    // // fixedSize:Size(110,6)
    // ),
    //
    // onPressed:(){
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Success()));
    //
    // } ,
    // child: Text("Pay Now",style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: 'cantata'),)),


    ],
    ),
    ),


    ),
    SizedBox(height: 30,),

          Center(
            child: InkWell(onTap: () {
              print("dlhdchkhbfevh"+widget.productPRICE.toString());
              print("sxghxdfgfgfdgfg"+widget.totalprice.toString());
              print("jvhbvhb"+value.Name.toString());
               value.AddOrder(widget.from,widget.userid,widget.productid, widget.productPRICE,value.Name,value.Housename,value.City,value.Disrict,value.Phone, widget.totalprice, context,);

            },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration( color: Color(0xff85723A) ,borderRadius: BorderRadius.circular(20)),
                child: Center(child: Text("Confirm",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700))),
              ),
            ),
          ),
    ]
          );
        }
      )

    );

  }
}
