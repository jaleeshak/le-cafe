import 'package:flutter/material.dart';
import 'package:lecafe/constant/mywidget.dart';
import 'package:lecafe/providers/mainprovider.dart';
import 'package:provider/provider.dart';

class Usrlist extends StatelessWidget {
   Usrlist({super.key});

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
                padding: const EdgeInsets.only(left: 0,right: 20),
                child: Text("Users List",
                    style: TextStyle(color: Color(0xffE9E7E0), fontSize: 20)),
              ),
              Divider(indent: 45,
                  endIndent: 65,
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
      body: Center(
        child: Column(
          children: [
            Consumer<MainProvider>(
              builder: (context,val,child) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: val.usersdetails.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context,int index) {


                      return Container(
                          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                          height: 100,
                          width: 20,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 20),
                              child: Row(
                                children: [
                                  Text("Name:",style: TextStyle(fontSize: 20),), Text(val.usersdetails[index].Name,style: TextStyle(fontSize: 20),),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 5),
                              child: Row(
                                children: [
                                  Text("Phone:",style: TextStyle(fontSize: 20),),
                                  Text(val.usersdetails[index].Phone,style: TextStyle(fontSize: 20),),
                                ],
                              ),
                            ),
                          ],
                        ),

                      );
                    }

                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
