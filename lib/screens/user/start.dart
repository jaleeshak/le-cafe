import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff85723A),
      body: Padding(
        padding: const EdgeInsets.only(left: 30,top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height:580,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children:[ Container(
                    height: 170,
                    width: 150,
                    decoration: BoxDecoration(border: Border.all(color: Color(0xff85723A)),borderRadius:BorderRadius.circular(10) ,)),


                Container(
                  height: 170,
                  width: 150,
                  decoration: BoxDecoration(border: Border.all(color: Color(0xff85723A)),borderRadius:BorderRadius.circular(10) ,),
                ),
                Container(
                  height: 170,
                  width: 150,
                  decoration: BoxDecoration(border: Border.all(color: Color(0xff85723A)),borderRadius:BorderRadius.circular(10) ),
                ),
                    Positioned(
                        top: 300,
                        right: 105,

                        child: Image.asset("assets/Frame 1.png")),
                    Positioned(
                        bottom: 165,
                        right: 30,
                        child: Image.asset("assets/Rectangle 2.png")),
                    Positioned(
                        top: 30,
                      left: 30,


                        child: Image.asset("assets/Rectangle 1.png")),



            ],
          ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 120,bottom: 20),

                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));

                  },
                  child: Container(
                    height: 50,
                    width: 170,
                    child: Center(child: Text("Order Now",style: TextStyle(color: Color(0xff3D2727),fontSize: 24,fontWeight: FontWeight.w700))),
                    decoration: BoxDecoration(color: Color(0xffD9D9D9),borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Center(child: Text("Indulge in Blissful Bites!",style: TextStyle(color: Colors.white,fontFamily: 'norican',fontSize: 30)))
      ],
      ),
        ),
      ),
    );
  }
}
