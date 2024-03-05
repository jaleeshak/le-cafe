import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lecafe/providers/mainprovider.dart';
import 'package:provider/provider.dart';

class Adress extends StatelessWidget {
  String userid;
  Adress({super.key,required this.userid});

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
                padding: EdgeInsets.only(left: 20),
                child: Center(
                  child: Text("Delivery Address",
                      style: TextStyle(color: Color(0xffE9E7E0), fontSize: 20)),
                ),
              ),
              Divider(
                  indent: 20,
                  endIndent: 0,
                  color: Color(0xff504A4A),
                  thickness: 3),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40, right: 10),
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

        child: Consumer<MainProvider>(
          builder: (context,val,child) {
            return Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Name"),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffD9D9D9),
                  ),
                  child: TextField(
                     controller: val.AdresNameController,
                    decoration: InputDecoration(
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("House name"),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffD9D9D9),
                  ),
                  child: TextField(
                     controller: val.AdresHousenameController,
                    decoration: InputDecoration(
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("City"),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffD9D9D9),
                  ),
                  child: TextField(
                     controller: val.AdresCityController,
                    decoration: InputDecoration(
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("District"),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffD9D9D9),
                  ),
                  child: TextField(
                     controller: val.AdresDistricController,
                    decoration: InputDecoration(
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Phone"),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffD9D9D9),
                  ),
                  child: TextField(
                     controller: val.AdresPhoneController,
                    keyboardType: TextInputType.number,inputFormatters: [LengthLimitingTextInputFormatter(10)],

                    decoration: InputDecoration(
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
                  ),
                ),
                 SizedBox(height: 50,),
                 InkWell(
                   onTap: () {
                     val.addAddress(context,userid);
                   },
                   child: Center(
                    child: Container(
                      height: 60,
                      width: 320,
                      decoration: BoxDecoration(
                          color: const Color(0xff85723A),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text("Save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700))),
                    ),
                ),
                 ),
              ],
            );
          }
        ),
      ),


    );
  }
}
