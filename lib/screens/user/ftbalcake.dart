import 'package:flutter/material.dart';
import 'package:lecafe/providers/loginprovider.dart';
import 'package:lecafe/providers/mainprovider.dart';
import 'package:lecafe/screens/user/cart.dart';
import 'package:lecafe/screens/user/myorder.dart';
import 'package:provider/provider.dart';

import '../../constant/callFunctions.dart';
import '../../constant/mywidget.dart';
import 'checkout.dart';

class Ftball extends StatelessWidget {
  String userid;
  String productId;
  String image;
  String name;
  String price;
  String quantity;
  String description;
  String category;
   Ftball({super.key,required this.userid,required this.productId,required this.image,required this.name,required this.price,required this.quantity,required this.description,required this.category});

  @override
  Widget build(BuildContext context) {
    double changeprice =0;
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.white,
      // backgroundColor:  Color(0xff85723A),

      appBar: AppBar(backgroundColor:  Color(0xff85723A),
          leading: InkWell(onTap: () {
            Navigator.pop(context);
          },child: Icon(Icons.arrow_back_ios_new_rounded)),  actions:[
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(Icons.share,color: Colors.black.withOpacity(0.71)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Order(),));
          },child: Icon(Icons.shopping_bag,color: Colors.black.withOpacity(0.71),size: 30)),
        )
      ]),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 250,

                  width: 500,
                  child: Image.network(image,fit: BoxFit.fill,),
                ),
                Positioned(
                 top: 200,
                  child: Container(


                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(40)),
                    
                  ),
                 child: Padding(
                   padding: const EdgeInsets.only(left: 30,top: 10),
                   child: Text(name,style: TextStyle(fontSize: 25)),
                 ),
                ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 10),
              child: Row(
                children: [
                  Text("5.0",style: TextStyle(color: Color(0xffBDC92E),fontSize: 20),),
                  Image.asset("assets/1.png",scale:20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Image.asset("assets/Vector (4).png",scale:20,),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 10),
              child: Consumer<MainProvider>(
                builder: (context,val,child) {
                  print(price.toString()+"roifk");
                  changeprice= double.parse(price)*val.kgValue;
                  // price=changeprice.toString();
                  return Row(
                    children: [
                      Icon(Icons.currency_rupee,size: 23,),
                      Text(changeprice.toString(),style: TextStyle(fontSize: 23,),

                     ),
                     // Padding(
                     //   padding: const EdgeInsets.only(left: 20),
                     //   child: Icon(Icons.currency_rupee,size: 23,color: Colors.grey),
                     // ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10,left: 30),
                        child: Text("₹1200",style: TextStyle(color: Colors.grey,fontSize: 23,decoration: TextDecoration.lineThrough )),
                      ),
                      Text("(11%Off)",style: TextStyle(fontSize: 23 )),
                    ],
                  );
                }
              ),
            ),
           SizedBox(height: 20,),
      Consumer<MainProvider>(
        builder: (context,val,child) {
          return Column(
            children: [
              Text(
                  "Kg: " + val.kgValue.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black)
              ),

              Slider(
                activeColor: Color(0xff85723A),
                label: "Select kg",
                value: val.KG.toDouble(),
                onChanged: (value) {
                  val.changeValue(value.toInt());
                  quantity=val.kgValue.toString();

                },
                min:0,
                divisions: 20,
                max: 20,
              ),

            ],
          );
        }
      ),
           // Row(
           //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           //   children: [
           //     Conto("Half Kg", "899"),
           //     Conto("1 Kg", "1299"),
           //     Conto("2 Kg", "2099"),
           //   ],
           // ),
            SizedBox(height: 20,),
            Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("DESCRIPTION",style: TextStyle(fontSize: 20),),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    // "Create this impressive, round sponge cake decorated to look exactly like a football! This project is perfect for the keen footballer, and could be the perfect centrepiece for your world cup party.We've used Hobbycraft's New Fondant Icing to create this superb baked treat."
    description,style: TextStyle(fontSize: 15),),
                ),SizedBox(height: 20,),
                Center(
                  child: Container(
                    height: 200,
                    width: 300,
                    color: Color(0xffD9D9D9),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(" Make it eggless cake(",style: TextStyle(fontSize: 15)),
                            Icon(Icons.currency_rupee,size: 15),
                            Text("50)"),
                            SizedBox(width: 60), //SizedBox

                            Consumer<MainProvider>(
                                builder: (context,val,child) {
                                  return Checkbox(
                                    materialTapTargetSize:  MaterialTapTargetSize.shrinkWrap,
                                    activeColor: Colors.green.shade500,
                                    shape: RoundedRectangleBorder(),
                                    checkColor: Colors.white,
                                    value: val.boxVal,
                                    side:const BorderSide(color: Color(0xff85723A), width: 2),
                                    onChanged: (bool? value) {
                                      val.checkbx1();
                                    },
                                  );
                                }
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(" Make Cake in Less Sugar(",style: TextStyle(fontSize: 15)),
                            Icon(Icons.currency_rupee,size: 15),
                            Text("50)"),
                            SizedBox(width: 30), //SizedBox

                            Consumer<MainProvider>(
                                builder: (context,val,child) {
                                  return Checkbox(
                                    materialTapTargetSize:  MaterialTapTargetSize.shrinkWrap,
                                    activeColor: Colors.green.shade500,
                                    shape: RoundedRectangleBorder(),
                                    checkColor: Colors.white,
                                    value: val.boxval2,
                                    side:const BorderSide(color: Color(0xff85723A), width: 2),
                                    onChanged: (bool? value) {
                                      val.checkbx2();
                                    },
                                  );
                                }
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(" Make Cake in Heart Shape(",style: TextStyle(fontSize: 15)),
                            Icon(Icons.currency_rupee,size: 15),
                            Text("50)"),
                            SizedBox(width: 20), //SizedBox

                            Consumer<MainProvider>(
                                builder: (context,val,child) {
                                  return Checkbox(
                                    materialTapTargetSize:  MaterialTapTargetSize.shrinkWrap,
                                    activeColor: Colors.green.shade500,
                                    shape: RoundedRectangleBorder(),
                                    checkColor: Colors.white,
                                    value: val.boxval3,
                                    side:const BorderSide(color: Color(0xff85723A), width: 2),
                                    onChanged: (bool? value) {
                                      val.checkbx3();
                                    },
                                  );
                                }
                            ),
                          ],
                        ),
                      ],
                    ),

                    // child: Column(
                    //   children: [
                    //     contopt("Make it eggless cake(", "50)"),
                    //     contopt("Make Cake in Less Sugar(", "50)"),
                    //     contopt("Make Cake in Heart Shape", "100)"),
                    //   ],
                    // ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Center(
              child: Consumer<MainProvider>(
                builder: (context,val,child) {
                  loginProvider provider = loginProvider();
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      InkWell(onTap: () {

                        val.savecart(image, name, price=changeprice.toString(), quantity, description,category,userid,productId,context);
                        val.cartget(userid);
                        print("hkjkjkj"+userid.toString());

                        Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(userid: userid),));
                      },
                        child: Container(
                          height: 70,
                          width: 150,
                         decoration: BoxDecoration( color: Color(0xff85723A) ,borderRadius: BorderRadius.circular(20)),
                          child: Center(child: Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700))),
                        ),
                      ),
                      InkWell(onTap:() {
                        // print("mhchxgfxcv"+val.totalPrice.toString());
                        val.getallAdress(userid);
                        callNext(context, Checkout(from: "GFHHY",userid: userid,productPRICE: val.totalPrice.toString(),totalprice: val.total.toString(),productid: [productId]));
                      },
                        child: Container(
                          height: 70,
                          width: 150,
                          decoration: BoxDecoration( color: Color(0xff85723A) ,borderRadius: BorderRadius.circular(20)),
                          child: Center(child: Text("Buy Now",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700))),
                        ),
                      ),
                    ],
                  );

                }
              ),
            ),
          ],
        ),
      ),


    );
  }
}
