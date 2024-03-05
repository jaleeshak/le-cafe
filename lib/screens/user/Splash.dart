import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lecafe/constant/callFunctions.dart';
import 'package:lecafe/providers/loginprovider.dart';
import 'package:lecafe/screens/user/start.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  void initState() {
    loginProvider Loginprovider= Provider.of<loginProvider>(context,listen:false);
    FirebaseAuth auth = FirebaseAuth.instance;
    var loginUser = auth.currentUser;
    Timer( Duration(seconds: 4), () {
      if(loginUser==null){
        callNextReplacement(context, Start());
      }else{
        Loginprovider.userAuthorized(loginUser.phoneNumber, context);
      }
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => Start(),
      //     ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Center(child: Image.asset("assets/Le_Cafe_logo_795 1.png",scale: 6,)),
      )


    );
  }
}