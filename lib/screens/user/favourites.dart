import 'package:flutter/material.dart';


class Favourites extends StatelessWidget {
  const Favourites({super.key});

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
            child: InkWell(onTap: () {
              Navigator.pop(context);
            }, child: Icon(Icons.arrow_back_ios_new_rounded)),
          ),
          title: Padding(
            padding: const EdgeInsets.only(right: 60),
            child: Column(
              children: [
                Text("Favourites",
                    style: TextStyle(color: Color(0xffE9E7E0), fontSize: 20)),
                Divider(indent: 40,
                    endIndent: 40,
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
        body:ListView.builder(itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(8),


              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),

              child: ListTile(
                trailing: Icon(Icons.favorite,color: Color(0xff85723A), ),
                leading: CircleAvatar(radius: 40,
                  child: Image.asset("assets/Ellipse 14.png",fit: BoxFit.fill),),
                title: Text("FootBall Theme Cake",style: TextStyle(
                    color:  Color(0xff85723A),fontSize: 15),),
                subtitle: Text("Half Kg",style: TextStyle(
                  fontSize: 13,),),

              ),

            );

          },)


    );
  }
}
