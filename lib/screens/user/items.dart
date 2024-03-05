import 'package:flutter/material.dart';
import 'package:lecafe/providers/mainprovider.dart';

import 'package:lecafe/screens/user/menu.dart';
import 'package:lecafe/screens/user/myorder.dart';
import 'package:provider/provider.dart';

import 'ftbalcake.dart';

class Items extends StatelessWidget {

  String from,userid;
   Items({super.key,required this.from,required this.userid});
  List<String> pic=["assets/Rectangle 30 (1).png",
  "assets/Rectangle 30 (1).png",
  "assets/Rectangle 30 (1).png",
  "assets/Rectangle 30 (1).png",
  "assets/Rectangle 30 (1).png",
  "assets/Rectangle 30 (1).png",
  "assets/Rectangle 30 (1).png",
  "assets/Rectangle 30 (1).png",

      ];

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffE9E7E0),
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Color(0xffE9E7E0),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: InkWell(onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Menu(userid: userid,)));
          }, child: Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 48),
                child: Text(from,
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
            padding: const EdgeInsets.only(bottom: 40,
            right: 20),
            child: InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Order(),));
            },child: Icon(Icons.shopping_bag,size: 30,color: Colors.black.withOpacity(0.71))),
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
      body: SizedBox(
        height: height,
        child: Consumer<MainProvider>(
          builder: (context,val,child) {
            return GridView.builder(
                itemCount:val.productsitems.length,
                padding: EdgeInsets.symmetric(horizontal: 2),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing:5
                  ,crossAxisSpacing:5
                  ,crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  var items=val.productsitems[index];
                  return
                      InkWell(onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => Ftball(userid: userid,productId: items.id,
                          image: items.productsimage,
                          name:items.ProductName,
                          price: items.price,
                          quantity: items.Quantity,
                          description: items.Description,
                          category: items.category,
                        ),));
                      },
                        child: Container(
                          height:600,
                          width:200,
                          color: Color(0xffD9D9D9),

                             child: Column(
                               children: [
                                 Container(
                                   height: 139,
                          width:205,
                          decoration: BoxDecoration(
                          color: Colors.white,

                          image: DecorationImage(image: NetworkImage(val.productsitems[index].productsimage),
                            fit: BoxFit.cover,
                                 ),




                  )// Text(items[index]),
                                 ),
                                 Text(val.productsitems[index].ProductName),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    // Icon(Icons.currency_rupee,size: 15,color: Colors.grey),
                    Text("₹"+(int.parse("${val.productsitems[index].price}")+200).toString(),style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey)),
                    Icon(Icons.currency_rupee,size: 15,),
                    Text(val.productsitems[index].price),


                  ],
                ),
              ),
              Text("41%OFF",style: TextStyle(color: Colors.yellow.shade400),),

                                 RichText(
                                   text: const TextSpan(
                                     text: 'Earliest Delivery:',
                                     style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
                                     children: <TextSpan>[TextSpan(text: 'Today', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.green))],
                                   ),
                                 )


                               ],
                             )
                  ),
                      );

                }

            );
          }
        ),
      ),
    );
  }
}
