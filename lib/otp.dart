import 'package:flutter/material.dart';
import 'package:lecafe/botNavBar/NavigationBar.dart';
import 'package:lecafe/constant/callFunctions.dart';
import 'package:lecafe/providers/loginprovider.dart';
import 'package:lecafe/providers/mainprovider.dart';
import 'package:lecafe/screens/admin/home.dart';
import 'package:lecafe/screens/user/menu.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider provider=Provider.of<MainProvider>(context,listen: false);
    final FocusNode _pinPutFocusNode = FocusNode();

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
       body: SingleChildScrollView(
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(top: 70),
               child: Center(child: Text("OTP verification",style: TextStyle(color: Color(0xff85723A) ,fontWeight: FontWeight.w700,fontSize: 33))),
             ),
              Consumer<loginProvider>(
                builder: (contextt,val,child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child:PinFieldAutoFill(
                      controller: val.otpController,
                      codeLength: 6,
                      focusNode: _pinPutFocusNode,
                      autoFocus: true,
                      keyboardType: TextInputType.number,
                      decoration: BoxLooseDecoration(
                        textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        radius: Radius.circular(10),
                        strokeColorBuilder: FixedColorBuilder(Colors.black),
                      ),
                      onCodeChanged: (pin) {
                        if (pin!.length == 6) {
                          val.verify(context);
                        }
                      },
                    ),
                  );
                }
              ),
             Padding(
               padding: const EdgeInsets.only(top: 130),
               child: Consumer<loginProvider>(
                 builder: (context,val,child) {
                   return InkWell(
                     onTap: () {

                     },
                     child:Container(
                       height: 70,
                       width: 250,
                       color: Color(0xff85723A) ,
                       child: Padding(
                         padding: const EdgeInsets.only(left: 30),
                         child: Padding(
                           padding: const EdgeInsets.only(left: 67,top: 20),
                           child: Text("Confirm",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700)),
                         ),
                       ),
                     ),
                   );
                 }
               ),
             ),
             SizedBox(height: 165,),
             Container(width: 1500,
               child: Image.asset("assets/Ellipse 1 (2).png",fit: BoxFit.fill,),
             ) ,
           ],
         ),
       ),

    );
  }
}
