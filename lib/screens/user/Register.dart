import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lecafe/providers/mainprovider.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  String from,id;
   Register({super.key,required this.from,required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE9E7E0),
        appBar: AppBar(toolbarHeight: 40,
          backgroundColor: Color(0xffE9E7E0),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            height: 200,
            child: Image.asset("assets/Ellipse 1 (1).png",fit: BoxFit.fill,),
          ),

          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom:Radius.elliptical(400,80),)),
          // flexibleSpace: Container(
          //   height: 200,
          //   decoration: BoxDecoration(borderRadius: BorderRadius.vertical(bottom:Radius.circular(80))),
          // ),
        ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Center(
          child: SingleChildScrollView(
            child: Consumer<MainProvider>(
              builder: (context,val,child) {
                return Column(

                  children: [
                    Text(from=="NEW"?"Register":"Edit Profile",style: TextStyle(color: Color(0xff85723A),fontSize: 25),),
                SizedBox(height: 30,),
               Consumer<MainProvider>(
                 builder: (context,val,child) {
                   return InkWell(onTap: () {
                     showBottomSheet(context);
                   },
                     child:from=="EDIT"?Container(height: 100,
                         width: 100,
                         decoration: BoxDecoration(color: Color(0xff85723A).withOpacity(0.31),borderRadius: BorderRadius.circular(10),border: Border.all(color: Color(0xff85723A) )),

                         child: val.userfileimg!=null?
                         CircleAvatar(radius: 40,
                           backgroundImage: FileImage(val.userfileimg!),)
                             : val.userimage!=''?CircleAvatar(radius: 40,
                           backgroundImage: NetworkImage(val.userimage),)
                             :Icon(Icons.person_add_alt_outlined,size: 70,color: Color(0xff85723A),)):SizedBox(),
                   );
                 }
               ),
                    SizedBox(height: 30,),
                Container(
                  height: 70,
                  width: 330,
                  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(color: Color(0xff85723A) )),

                  child: TextField(
                     controller:val.usernameController,
                    // keyboardType: TextInputType.number,inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,color: Color(0xff85723A) ),

                        hintText: "Username",
                        hintStyle:TextStyle(color:Color(0xff85723A)  ),border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Color(0xff85723A) )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Color(0xff85723A) )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Color(0xff85723A) )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Color(0xff85723A) ))

                    ),
                  ),
                ),
                    SizedBox(height: 20,),
                Container(
                  height: 70,
                  width: 330,
                  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(color: Color(0xff85723A) )),

                  child: TextField(
                    controller:val.phonenumberController,
                    enabled: from=="EDIT"?false:true,
                    keyboardType: TextInputType.number,inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call,color: Color(0xff85723A) ),

                        hintText: "Enter the phone number",
                        hintStyle:TextStyle(color:Color(0xff85723A)  ),border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Color(0xff85723A) )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Color(0xff85723A) )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Color(0xff85723A) )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Color(0xff85723A) ))

                    ),
                  ),
                ),SizedBox(height: 50,),
                    InkWell(onTap: () {
                      if(from=="NEW") {
                          val.addRegister("", "NEW", context);
                        }
                      else{
                        val.addRegister(id, "EDIT", context);
                      }
                      },
                      child: Container(

                        height: 70,
                        width: 280,
                        color: Color(0xff85723A) ,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 67,top: 20),
                            child: Text(from=="NEW"?"Register":"Save",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 176,),
                    Container(width: 1500,
                      child: Image.asset("assets/Ellipse 1 (2).png",fit: BoxFit.fill,),
                    ) ,

                  ],
                );
              }
            ),
          ),
        ),
      )
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
                    bakegramProvider.getprofileImagecamera(),
                    Navigator.pop(context)
                  }),
              ListTile(
                  leading: const Icon(Icons.photo, color: Colors.black),
                  title: const Text(
                    'Gallery',
                  ),
                  onTap: () => {
                    bakegramProvider.getprofileImagegallery(),
                    Navigator.pop(context)
                  }),
            ],
          );
        });
    // ImageSource
  }
}
