import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lecafe/constant/callFunctions.dart';
import 'package:lecafe/providers/loginprovider.dart';
import 'package:provider/provider.dart';

import '../../otp.dart';
import 'Register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
        padding: const EdgeInsets.only(left: 0,top: 100),
        child:SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/Frame 2.png",scale: 6),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RichText(
                  text: const TextSpan(
                    text: "Le'",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400, color: Color(0xff85723A)),
                    children: <TextSpan>[TextSpan(text: 'Cafe', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black)),],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Consumer<loginProvider>(
                    builder: (context,val,child) {
                      return Container(
                        height: 70,
                        width: 330,
                        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(color: Color(0xff85723A) )),

                        child: TextField(
                          controller:val.PhonenumberController,
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
                        );
                    }
                  ),
                  ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Consumer<loginProvider>(
                  builder: (context,val,child) {
                    return InkWell(onTap:() {
                    val.sendotp(context);
                    },
                      child: Container(
                        height: 70,
                        width: 280,
                        color: Color(0xff85723A) ,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 67,top: 20),
                            child: Text("Log In",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Row(
                  children: [
                    Text("Don't have a account?",style: TextStyle(color: Color(0xff85723A)),),
                    InkWell(onTap: () {
                      callNext(context, Register(from:"NEW",id: "",));
                    },child: Text("Register",style: TextStyle(color: Colors.blue),)),
                  ],
                ),
              ),
              SizedBox(height: 137,),
              Container(width: 1500,
                child: Image.asset("assets/Ellipse 1 (2).png",fit: BoxFit.fill,),
              ) ,


            ],
          ),
        ),
        
      ),

    );
  }
}
