import 'package:flutter/material.dart';
import 'package:lecafe/constant/callFunctions.dart';
import 'package:provider/provider.dart';

import '../../providers/mainprovider.dart';

class Addcatry extends StatelessWidget {
  String id;
  String from;
   Addcatry({super.key,required this.id,required this.from});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9E7E0),
      appBar: AppBar(
        backgroundColor: const Color(0xffE9E7E0),
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        title: const Padding(
          padding: EdgeInsets.only(right: 50),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 48),
                child: Text("Add Category",
                    style: TextStyle(color: Color(0xffE9E7E0), fontSize: 20)),
              ),
              Divider(
                  indent: 50,
                  endIndent: 0,
                  color: Color(0xff504A4A),
                  thickness: 3),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40, right: 20),
            child: Icon(Icons.search_outlined,
                size: 30, color: Colors.black.withOpacity(0.71)),
          )
        ],

        flexibleSpace: Container(
          height: 200,
          child: Image.asset(
            "assets/Ellipse 1 (3).png",
            fit: BoxFit.fill,
          ),
        ),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom:Radius.elliptical(400,80),)),
        // flexibleSpace: Container(
        //   height: 200,
        //   decoration: BoxDecoration(borderRadius: BorderRadius.vertical(bottom:Radius.circular(80))),
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<MainProvider>(builder: (context, val, child) {
              return InkWell(
                onTap: () {
                  showBottomSheet(context);
                },
                child: val.categoryfileimg != null
                    ? Container(
                        margin: const EdgeInsets.only(left: 0, top: 30),
                        width: 320,
                        height: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xa385723a)),
                        ),
                        child: Image.file(
                          val.categoryfileimg!,
                          scale: 6,
                          fit: BoxFit.fill,
                        ))
                    : val.image!=''? Container(
                    margin: const EdgeInsets.only(left: 0, top: 30),
                    width: 320,
                    height: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xa385723a)),
                    ),
                    child: Image.network(
                      val.image,
                      scale: 6,
                      fit: BoxFit.fill,
                    ))
                    :Container(
                        margin: const EdgeInsets.only(left: 0, top: 30),
                        width: 320,
                        height: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xa385723a)),
                        ),
                        child: Image.asset(
                          "assets/image.png",
                          scale: 6,
                        )),
              );
            }),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 0),
              height: 60,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffD9D9D9),
              ),
              child: Consumer<MainProvider>(
                builder: (context,val,child) {

                  return TextField(
                    controller: val.CatNameController,
                    decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xa385723a)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xa385723a)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xa385723a)),
                      ),
                    ),
                  );
                }
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xff85723A),
                    borderRadius: BorderRadius.circular(10)),
                child: Consumer<MainProvider>(builder: (context, val, child) {
                  return InkWell(
                      onTap: () {
                        if(from=="NEW"){
                          val.addcategory(context,'',from);

                        }else{
                          val.addcategory(context,id,from);
                        }

                      },
                      child: const Center(
                          child: Text("Save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700))));
                }),
              ),
            ),
            const SizedBox(
              height: 195,
            ),
            Container(
              width: 1500,
              child: Image.asset("assets/bottimg.png"),
            ),
          ],
        ),
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
                        bakegramProvider.getImagecamera(),
                        Navigator.pop(context)
                      }),
              ListTile(
                  leading: const Icon(Icons.photo, color: Colors.black),
                  title: const Text(
                    'Gallery',
                  ),
                  onTap: () => {
                        bakegramProvider.getImagegallery(),
                        Navigator.pop(context)
                      }),
            ],
          );
        });
    // ImageSource
  }
}
