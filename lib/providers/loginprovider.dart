import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lecafe/screens/admin/home.dart';
import 'package:provider/provider.dart';

import '../botNavBar/NavigationBar.dart';
import '../constant/callFunctions.dart';
import '../otp.dart';
import 'mainprovider.dart';

class loginProvider extends ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;


  String VerificationId='';

  TextEditingController PhonenumberController = TextEditingController();
  TextEditingController otpController =TextEditingController();
  bool loader = false;

  void sendotp(BuildContext context) async {

    loader= true;
    notifyListeners();
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${PhonenumberController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
          backgroundColor: Colors.white,
          content: Text(
              "Verification Completed",
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w800,)),
          duration:
          Duration(milliseconds: 3000),
        ));
        if (kDebugMode) {}
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content:
            Text("Sorry, Verification Failed"),
            duration: Duration(milliseconds: 3000),
          ));
          if (kDebugMode) {

          }

        }
      },

      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;
        loader= false;
        notifyListeners();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Otp(),
            ));
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
          backgroundColor: Colors.white,
          content: Text(
              "OTP sent to phone successfully",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600,)),
          duration:
          Duration(milliseconds: 3000),
        ));
        PhonenumberController.clear();
        log("Verification Id : $verificationId");

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  void verify(BuildContext context) async {

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: otpController.text);
    await auth.signInWithCredential(credential).then((value) {
      final user = value.user;

      userAuthorized(user?.phoneNumber,context);


    });
  }
  Future<void> userAuthorized(String? phoneNumber, BuildContext context) async {

    String loginUsername='';
    String loginUsertype='';
    String loginUserid='';
    String userId='';
    String loginphno="";
    String loginPhoto="";
    String address="";
    MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);

    try {
      var phone = phoneNumber!;
      print(phoneNumber.toString()+"duudud");
      db.collection("USER").where("PHONE_NUMBER",isEqualTo:phone).get().then((value) {
        if(value.docs.isNotEmpty){
          print("fiifuif");
          for(var element in value.docs) {
            Map<dynamic, dynamic> map = element.data();
            loginUsername = map['NAME'].toString();
            loginUsertype = map['TYPE'].toString();
            loginphno=map["PHONE_NUMBER"].toString();
            loginUserid = element.id;
            userId = map["USER_ID"].toString();
            String uid = userId;
            print(loginUsertype);
            if (loginUsertype == "ADMIN") {

              print("cb bcb");
              callNextReplacement(context, adHome(uid: uid,),);

            }

            else {
              print("mxnxn");
              mainProvider.getCarosalData();
              mainProvider.getData();
              mainProvider.cartget(uid);
              print("hhggf");
              // mainProvider.getordereddetils();
              mainProvider.getprofile(uid);
              callNextReplacement(context,Bottombar(userid: uid),);


              print("dkdkdd");

            }
          }

        }
        else {
          const snackBar = SnackBar(
              backgroundColor: Colors.white,
              duration: Duration(milliseconds: 3000),
              content: Text("Sorry , You don't have any access",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

      });


    } catch (e) {


      // const snackBar = SnackBar(
      //     backgroundColor: Colors.white,
      //     duration: Duration(milliseconds: 3000),
      //     content: Text("Sorry , Some Error Occurred",
      //       textAlign: TextAlign.center,
      //       softWrap: true,
      //       style: TextStyle(
      //           fontSize: 18,
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold),
      //     ));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}