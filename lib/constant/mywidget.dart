
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextStyle style1=TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.red);
Widget contain(String img,String txt){
  return Column(
    children: [
      Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xffE9E7E0),
        image: DecorationImage(image: AssetImage(img),fit: BoxFit.cover)),



      ),
      Text(txt),
    ],
  );
}
// Widget Cont(){
//   return Container(
//     height: 400,
//     width: 200,
//       color: Color(0xffD9D9D9),
//     child: Column(
//       children: [
//         Container(
//           height: 200,
//           width: 200,
//           child: Image.asset("assets/Group 1.png"),
//         ),
//         Text("Jungle Theme Cake"),
//         Row(
//           children: [
//             Icon(Icons.currency_rupee),
//             Text("1200"),
//             Icon(Icons.currency_rupee),
//             Text("1200"),
//           ],
//         ),
//         Text("41%OFF",style: TextStyle(color: Colors.yellow.shade50),),
//         SizedBox(height: 40,),
//         Text()
//       ],
//     ),
//
//   );
// }
Widget srchbr(){
  return Container(
    width: 350,height: 50,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white70),
    child: TextField(
      decoration: InputDecoration(
          hintText: 'Search',hintStyle:TextStyle(color: Color(0xffB0BEC5),fontWeight: FontWeight.w400) ,
          prefixIcon:  Icon(Icons.search_rounded,color: Color(0xffB0BEC5)),
          border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffB0BEC5)),borderRadius: BorderRadius.circular(30))
      ,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffB0BEC5)),borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffB0BEC5)),borderRadius: BorderRadius.circular(30)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffB0BEC5)),borderRadius: BorderRadius.circular(30)),),


    ),
  );
}
Widget otpcont(){
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xff3E2501)),
    child: TextField(
      keyboardType: TextInputType.phone,
      inputFormatters: [LengthLimitingTextInputFormatter(1)],
      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    ),
  );
}
Widget Conto(String pth,String hpp){
  return Column(
    children: [
      Container(
        height: 50,
        width: 80,
        decoration: BoxDecoration(color: Color(0xff85723A),borderRadius: BorderRadius.circular(20)),
        child: Center(child: Text(pth)),

      ),
      Row(
        children: [
          Icon(Icons.currency_rupee,size: 15),
          Text(hpp),
        ],
      ),

    ],
  );
}
Widget contopt(String fhh,dd){
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20,top: 40),
        child: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(color:Color(0xffD9D9D9),border: Border.all(color: Colors.black)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20,top: 40),
        child: Text(fhh),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Icon(Icons.currency_rupee,size: 15),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Text(dd),
      )
    ],
  );
}
Widget cakeCon(ddk){
  return CircleAvatar(
    radius: 10,
    backgroundColor: Colors.grey,
    child: Text(ddk),


  );
}
Widget ContainAd(cc){
  return Container(
    height: 100,
    width: 300,
    decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color:  Color(0xffA3956B),border: Border.all(color: Color(0xff85723A),)),
    child: Center(child: Text(cc,style: TextStyle(color: Colors.white,fontSize: 20),)),
  );
}
Widget CONadmin(cf,dd){
  return Container(
    margin: EdgeInsets.only(left: 0,top: 10),
    width: 330,
    height: 100,
    decoration: BoxDecoration(
      color:Colors.white,borderRadius: BorderRadius.circular(10),
      boxShadow:[ BoxShadow(color: Colors.black26,blurRadius: 4,offset: Offset(3, 4))]

    ),
child: Padding(
  padding: const EdgeInsets.only(left: 20,top: 20),
  child:   Column(crossAxisAlignment: CrossAxisAlignment.start,

    children: [

          Text(cf,style: TextStyle(fontSize: 20)),

          Text(dd,style: TextStyle(fontSize: 20)),

    ],

  ),
),


  );
}


