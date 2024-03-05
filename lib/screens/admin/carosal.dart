import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/callFunctions.dart';
import '../../providers/mainprovider.dart';
import 'addcarosil.dart';

class carosal extends StatelessWidget {
   carosal({super.key});

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
                padding: const EdgeInsets.only(left: 48),
                child: Text("Carosal",
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
            child: Icon(Icons.search_outlined,size: 30,color: Colors.black.withOpacity(0.71)),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(height: MediaQuery.of(context).size.height,
          child: Consumer<MainProvider>(
              builder: (context,val,child) {
                return GridView.builder(
                    itemCount:val.carosalitems.length,
                    padding: EdgeInsets.symmetric(horizontal: 2,),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing:10,
                      mainAxisExtent: 180
                      ,crossAxisSpacing:5
                      ,crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                deleteditAlert(context,val.carosalitems[index].id,"EDIT");

                              },

                              child: Container(
                                  height: 150,

                                  width:200,
                                  color: Color(0xffD9D9D9),

                                  child: Image.network(val.carosalitems[index].carosalimage,scale: 10,fit: BoxFit.fill,)
                              ),
                            ),
                            // Text(val.categoryitems[index].Name,style: TextStyle(fontSize: 20),),

                          ],
                        );

                    }

                );
              }
          ),
        ),
      ),
      floatingActionButton: Consumer<MainProvider>(
          builder: (context,val,child) {
            return InkWell(
              onTap: () {
                val.clearcarosal();
                callNext(context, addCarosel(from: "NEW",id: '',));
              },
              child: Container(
                  height: 70,
                  width: 70,

                  decoration: BoxDecoration(color: Color(0xff85723A),borderRadius: BorderRadius.circular(50)),


                  child:Icon(Icons.add,color: Colors.white,size: 40,)),
            );
          }
      ),
    );
  }
   deleteditAlert(context,String id,String from){
     showDialog(
         context: context,
         builder: (context) {
           return AlertDialog(
             // title: Text(' Alert Dialog'),
             content: Text('Are you sure?'),


             actions: <Widget>[
               Consumer<MainProvider>(
                   builder: (context,value,child) {
                     return TextButton(
                         onPressed: () {
                           value.carosalfileimg=null;
                           Navigator.of(context).pop();
                           value.editcarosal(id);
                           callNext(context, addCarosel(id:id,from: "EDIT"));


                           //action code for "Yes" button
                         },

                         child: Text('Edit'));
                   }
               ),
               Consumer<MainProvider>(
                   builder: (context,val,child) {
                     return TextButton(
                       onPressed: () {
                         Navigator.pop(context);
                         val.deletecarosal(context,id);

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
