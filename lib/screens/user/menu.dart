import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:lecafe/constant/mywidget.dart';
import 'package:lecafe/screens/user/cart.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../providers/mainprovider.dart';
import 'favourites.dart';
import 'items.dart';
import 'myorder.dart';
import 'myprofile.dart';

class Menu extends StatelessWidget {
  String userid;



   Menu({super.key,required this.userid,});
List<String> iconsText=["Favourites",
"My Order",
"My Cart",
"Help"];

List<Icon> iconData=[
  Icon(Icons.favorite,color:  Color(0xff85723A)),
  Icon(Icons.shopping_bag,color:  Color(0xff85723A)),
  Icon(Icons.shopping_cart,color:  Color(0xff85723A)),
  Icon(Icons.help_center,color:  Color(0xff85723A)),

];
   List<Icon> arrow=[
     Icon(Icons.arrow_forward_ios,color:  Color(0xff85723A)),
     Icon(Icons.arrow_forward_ios,color:  Color(0xff85723A)),
     Icon(Icons.arrow_forward_ios,color:  Color(0xff85723A)),
     Icon(Icons.arrow_forward_ios,color:  Color(0xff85723A)),
   ];

  @override


  Widget build(BuildContext context) {
    print("gcchkhjfh"+userid.toString());


    return Scaffold(
      backgroundColor: Color(0xffE9E7E0),
      appBar: AppBar(
        backgroundColor: Color(0xffE9E7E0),
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [

              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.menu),
              ),
              Image.asset("assets/cakelo.png",scale: 20),

              Padding(
                padding: const EdgeInsets.only(right: 170),
                child: RichText(
                  text: const TextSpan(
                    text: "Le'",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xff85723A)),
                    children: <TextSpan>[TextSpan(text: 'Cafe', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black)),],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Order(),));
                },child: Icon(Icons.shopping_bag_outlined)),
              )
            ],
          )
        ],
      ),drawer: Drawer(
       child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Container(
              color: Color(0xff85723A),
                padding: EdgeInsets.symmetric(vertical: 2,),
                // decoration:const BoxDecoration(
                //     image: DecorationImage(image: AssetImage("assets/Ellipse 31.png"),scale: 5),color:  Color(0xff85723A) ),
                child: Center(
                    child: Column(
                  children: [

                    Image.asset("assets/Ellipse 31.png",scale: 5,),
                    Text("My Profile",style: TextStyle(fontSize: 18)),

                    // callNext(context, MyProfile()),

                    Consumer<MainProvider>(
                      builder: (context,val,child) {
                        return InkWell(onTap: () {
                          val.getprofile(userid);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile(userid: userid,)));

                        },child: Text("login to view your complete profile",style: TextStyle(color: Colors.white),));
                      }
                    ),
                  ],
                ))),
          ),
          Consumer<MainProvider>(
            builder: (context,val,child) {
              return Container(
                //color: Colors.white,

                child: ListView.separated
                  (separatorBuilder: ( context,index){
                  return Divider(indent: 5,endIndent: 5,color: Color(0xff85723A) ,);
                },
                    shrinkWrap: true,
                    itemCount:iconData.length,itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    leading: iconData[index],
                    title: Text(iconsText[index],style: TextStyle(color: Color(0xff85723A) )),
                    trailing: InkWell(onTap: () {
                      if (index == 0) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Favourites(),));
                      } else if (index == 1) {
                        val.getordereddetils();
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Order(),));
                      } else if (index == 2) {
                       val.cartget(userid);
                        print("kkkkkg"+userid.toString());
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Cart(userid: userid,),));
                      }

                    },child: arrow[index]),

                  );

                }),

              );
            }
          )
          // ListTile(
          //   leading: Icon(Icons.home),
          //   title: Text("Home"),
          // ),
          // ListTile(
          //   leading: Icon(Icons.search),
          //   title: Text("Search"),
          // ),
          // ListTile(
          //   leading: Icon(Icons.message),
          //   title: Text("Message"),
          // ),


        ],
      ),
    ),
  //   drawer: Drawer(
  //   child:ListView(
  //   children: [
  //   // DrawerHeader(
  //   // padding: EdgeInsets.zero,
  //   // child: Container(
  //   // decoration: BoxDecoration(
  //   // image: DecorationImage(image: AssetImage("assets/Rectangle 1.png"),fit:BoxFit.cover)
  //   // ),
  //   // child: Padding(
  //   // padding: const EdgeInsets.only(top: 125),
  //   // child: Text("My Profile",
  //   // style: TextStyle(color:Colors.red ,fontSize: 20),),
  //   // )
  //   // )
  //   // )
  // ] )
  //    ),

      body:SingleChildScrollView(
        child: Column(

          children: [

            srchbr(),
            Consumer<MainProvider>(builder: (context, valu, child) {
              return CarouselSlider.builder(
                itemCount: valu.carosalitems.length,
                itemBuilder: (context, index, realIndex) {
                  // valu.carosalitems[index];
                  return Padding(
                    padding:
                    const EdgeInsets.only(left: 8, right: 4, top: 10),
                    child: Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                          valu.carosalitems[index].carosalimage,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                    height: 150.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    pageSnapping: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    autoPlayInterval: const Duration(seconds: 4),
                    onPageChanged: (index, reason) {
                      valu.activeIndex(index);
                      // print("activvgvg"+Activeindex.toString());
                    }),
              );
            }),
              Consumer<MainProvider>(builder: (context, val, child) {
                return Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: buildIndiCator(
                      val.carosalitems.length, context, val.Activeindex),
                );
              }),
            // Positioned(
            //   top: 10,
            //     left:60,child:
            //
            //     Text( '50',
            //     style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Color(0xff3D2727)),),
            //   ),
            //  Positioned(
            //
            //   left:128,
            //   top: 25,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Container(
            //         height:60,child:
            //         Column(mainAxisAlignment: MainAxisAlignment.start,
            //           children: [
            //             Text("%", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Color(0xff3D2727)),),
            //             Container( padding:EdgeInsets.zero,width: 25,color: Colors.black,height: 1,),
            //             // Divider(color: Colors.black,thickness: 1,indent: 5,endIndent: 5,),
            //             Text("OFF", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),),
            //
            //           ],
            //         ),
            //
            //       )
            //
            //     ],
            //   ),),
            //
            // Positioned(
            //   left:60,
            //   top:80,
            //
            //   child: Text( 'For any slice of cake \nfor any order above 2kg', style: TextStyle(fontSize:20,fontWeight: FontWeight.w900, color: Colors.white.withOpacity(0.76),fontFamily: 'gibes')),),
             Padding(
              padding: const EdgeInsets.only(top: 20,right: 250),
              child: Text("Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
            ),SizedBox(height: 10,),
            SizedBox(height: 300,
              child: Consumer<MainProvider>(
                builder: (context,val,child) {
                  return GridView.builder(
                      itemCount:val.categoryitems.length,
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing:10
                        ,crossAxisSpacing:10
                        ,crossAxisCount: 3,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            InkWell(onTap:(){
                              val.getProductaData(val.categoryitems[index].id);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Items(userid: userid,from: val.categoryitems[index].Name),));

                        },
                              child: Container(
                                height:119,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(image: NetworkImage(val.categoryitems[index].image),
                                      fit: BoxFit.cover,

                                    )
                                ),

                              ),
                            ),


                            Text(val.categoryitems[index].Name),

                          ],
                        );

                      }

                  );
                }
              ),


            ),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text("Popular",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
            ),
           SizedBox(height: 10,),
           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               contain("assets/Rectangle 20.png","Honey Cake"),
               contain("assets/Rectangle 21.png","Torte Cake")
             ],

           ),

          ],
        ),
      ),

    );
  }
}
buildIndiCator(int count, BuildContext context, int activeindex) {
  //    print(activeIndex.toString()+"dpddoopf");

  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 6),
      child: AnimatedSmoothIndicator(
        activeIndex: activeindex,
        count: count,
        effect: const ExpandingDotsEffect(
            dotWidth: 7,
            dotHeight: 7,
            strokeWidth: 1,
            paintStyle: PaintingStyle.stroke,
            activeDotColor: Color(0xff35103B),
            dotColor:Color(0xff35103B)),

      ),
    ),
  );
}
