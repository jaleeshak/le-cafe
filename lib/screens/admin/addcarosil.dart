import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/mainprovider.dart';

class addCarosel extends StatelessWidget {
  String id;
  String from;

  addCarosel({super.key,required this.id,required this.from});


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
                child: Text("Add Carosal",
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
      body: Column(
        children: [
          Consumer<MainProvider>(
            builder: (context,val,child) {
              return InkWell(
                onTap: () {
                  showBottomSheet(context);
                },
                child: val.carosalfileimg!=null?Container(
                    margin: EdgeInsets.only(left: 20,top: 30),
                    width: 320,
                    height: 150,
                    decoration: BoxDecoration(
                      color:Color(0xffD9D9D9),borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xa385723a)),
                    ),
                    child: Image.file(val.carosalfileimg!,scale: 6,fit: BoxFit.fill,)
                ):val.carosalimage != ''
                ?Container(
                    margin: EdgeInsets.only(left: 20,top: 30),
                    width: 320,
                    height: 150,
                    decoration: BoxDecoration(
                      color:Color(0xffD9D9D9),borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xa385723a)),
                    ),
                    child: Image.network(val.carosalimage,scale: 6,fit: BoxFit.fill,)
                ):Container(
                    margin: EdgeInsets.only(left: 20,top: 30),
                    width: 320,
                    height: 150,
                    decoration: BoxDecoration(
                      color:Color(0xffD9D9D9),borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xa385723a)),
                    ),
                    child: Image.asset("assets/image.png",scale: 6,)
                )
              );
            }
          ),
          SizedBox(height: 50,),
           Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration( color: Color(0xff85723A) ,borderRadius: BorderRadius.circular(10)),
            child: Consumer<MainProvider>(
              builder: (context,val,child) {
                return InkWell(onTap: () {
                  if (from == "NEW") {
                    val.Addcarosal(context, 'NEW', "");
                  }
                  else {
                    val.Addcarosal(context, "EDIT", id);
                  }
                },child: Center(child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700))));
              }
            ),
          ),
        ],
      ),
    );
  }
  void showBottomSheet(BuildContext context) {
    MainProvider bakegramProvider =
    Provider.of<MainProvider>(context, listen: false);
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(
                    Icons.camera_enhance_sharp,
                    color: Colors.black,
                  ),
                  title: const Text(
                    'Camera',
                  ),
                  onTap: () => {
                    bakegramProvider.getcarosalImagecamera(),
                    Navigator.pop(context)
                  }),
              ListTile(
                  leading: const Icon(Icons.photo, color: Colors.black),
                  title: const Text(
                    'Gallery',
                  ),
                  onTap: () => {
                    bakegramProvider.getcarosalImagegallery(),
                    Navigator.pop(context)
                  }),
            ],
          );
        });
    // ImageSource
  }
}
