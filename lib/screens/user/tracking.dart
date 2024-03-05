import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:lecafe/providers/mainprovider.dart';
import 'package:provider/provider.dart';

class tracking extends StatelessWidget {
  String Name,Housename,City,District,Phone,orderid,status;

  tracking({super.key,required this.Name,required this.Housename,required this.City,required this.District,required this.Phone,required this.orderid,required this.status});
  List<String> Time=["12:30",
  "12:00",
  "11:30",
  "11:00",

  ]; List<String> icons=["assets/bag.png",
  "assets/chef.png",
  "assets/casssh.png",
  "assets/doc.png",

  ];
List<String> Title=["Ready to pickup",
  "Order Processed",
  "Payment Cofirmed",
  "Order Placed",


  ];
List<String> subtitle=["Order#2346 from Le’Cafe",
  "We are preparing your order.",
  "Order Processed",
  "Awaiting configuration...",
  "We have received your order.",


  ];

  @override
  Widget build(BuildContext context) {
    print("sdj vhb v"+status.toString());
    print("sdjhvcdfgvbhvhb v"+orderid.toString());
    return Scaffold(
      backgroundColor: Color(0xffE9E7E0),
      appBar: AppBar(
        leading: InkWell(onTap: () {
          Navigator.pop(context);
        },child: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text("Track My Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,top: 10),
        child: Consumer<MainProvider>(
          builder: (context,val,child) {
            print("jugstdftvhfg"+status.toString());
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Fri, November 10",style: TextStyle(fontSize: 15,color: Color(0xff504A4A).withOpacity(0.4))),
                 Text(orderid,style: TextStyle(fontSize: 15,color: Color(0xff504A4A).withOpacity(0.4))),

                Padding(
                  padding: const EdgeInsets.only(right: 60,top: 20),
                  child: Text("Orders",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                ),


             status=="Order placed"?Container(
               height: MediaQuery.of(context).size.height / 2,
               width: MediaQuery.of(context).size.width ,
               child: Row(
                 children: [
                   IconStepper(
                     direction: Axis.vertical,
                     enableNextPreviousButtons: false,
                     enableStepTapping: false,
                     stepColor: Colors.green,
                     activeStepBorderColor: Colors.white,
                     activeStepBorderWidth: 0.0,
                     activeStepBorderPadding: 0.0,
                     lineColor: Colors.green,
                     lineLength: 70.0,
                     lineDotRadius: 2.0,
                     stepRadius: 10.0,
                     icons: [
                       // Icon(Icons.check,color: Colors.white,),
                       // Icon(Icons.check,color: Colors.white,),
                       // Icon(Icons.check,color: Colors.white),
                       Icon(Icons.radio_button_checked,color: Colors.green,),
                       Icon(Icons.radio_button_checked,color: Colors.grey,),
                       Icon(Icons.radio_button_checked,color: Colors.grey,),
                       Icon(Icons.radio_button_checked,color: Colors.green,),


                     ],
                   ),
                   Expanded(
                     child: ListView.builder(
                       shrinkWrap: true,
                       itemCount: Title.length,
                       itemBuilder: (context, index) {
                         return Container(
                           margin: EdgeInsets.zero,
                           width: MediaQuery.of(context).size.width,
                           child: ListTile(
                             contentPadding: EdgeInsets.symmetric(vertical: 10),
                             trailing: Text(Time[index],style: TextStyle(fontSize: 17),),
                             leading: Image.asset(icons[index],scale: 20,color: Color(0xff85723A) ,),
                             title: Text(Title[index],style: TextStyle(
                                 color:  Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                             subtitle: Text(subtitle[index],style: TextStyle(
                               color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500),),

                           ),

                         );

                       },),
                   )

                 ],
               ),


             ):status=="Payment confirmed"?
             Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width ,
                  child: Row(
                    children: [
                      IconStepper(
                        direction: Axis.vertical,
                        enableNextPreviousButtons: false,
                        enableStepTapping: false,
                        stepColor: Colors.green,
                        activeStepBorderColor: Colors.white,
                        activeStepBorderWidth: 0.0,
                        activeStepBorderPadding: 0.0,
                        lineColor: Colors.green,
                        lineLength: 70.0,
                        lineDotRadius: 2.0,
                        stepRadius: 10.0,
                        icons: [
                          Icon(Icons.radio_button_checked,color: Colors.grey,),
                          Icon(Icons.radio_button_checked,color: Colors.grey,),
                          Icon(Icons.radio_button_checked,color: Colors.green,),
                          Icon(Icons.check,color: Colors.white),

                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: Title.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.zero,
                              width: MediaQuery.of(context).size.width,
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(vertical: 10),
                                trailing: Text(Time[index],style: TextStyle(fontSize: 17),),
                                leading: Image.asset(icons[index],scale: 20,color: Color(0xff85723A) ),
                                title: Text(Title[index],style: TextStyle(
                                    color:  Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                                subtitle: Text(subtitle[index],style: TextStyle(
                                  color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500),),

                              ),

                            );

                          },),
                      )

                    ],
                  ),


                ):status=="Order processed"?  Container(
               height: MediaQuery.of(context).size.height / 2,
               width: MediaQuery.of(context).size.width ,
               child: Row(
                 children: [
                   IconStepper(
                     direction: Axis.vertical,
                     enableNextPreviousButtons: false,
                     enableStepTapping: false,
                     stepColor: Colors.green,
                     activeStepBorderColor: Colors.white,
                     activeStepBorderWidth: 0.0,
                     activeStepBorderPadding: 0.0,
                     lineColor: Colors.green,
                     lineLength: 70.0,
                     lineDotRadius: 2.0,
                     stepRadius: 10.0,
                     icons: [
                       Icon(Icons.radio_button_checked,color: Colors.grey,),
                       Icon(Icons.radio_button_checked,color: Colors.green,),
                       Icon(Icons.check,color: Colors.white),
                       Icon(Icons.check,color: Colors.white),

                     ],
                   ),
                   Expanded(
                     child: ListView.builder(
                       shrinkWrap: true,
                       itemCount: Title.length,
                       itemBuilder: (context, index) {
                         return Container(
                           margin: EdgeInsets.zero,
                           width: MediaQuery.of(context).size.width,
                           child: ListTile(
                             contentPadding: EdgeInsets.symmetric(vertical: 10),
                             trailing: Text(Time[index],style: TextStyle(fontSize: 17),),
                             leading: Image.asset(icons[index],scale: 20,color: Color(0xff85723A) ),
                             title: Text(Title[index],style: TextStyle(
                                 color:  Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                             subtitle: Text(subtitle[index],style: TextStyle(
                                 color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500),),

                           ),

                         );

                       },),
                   )

                 ],
               ),


             ):status=="Ready to pickup"?Container(
               height: MediaQuery.of(context).size.height / 2,
               width: MediaQuery.of(context).size.width ,
               child: Row(
                 children: [
                   IconStepper(
                     direction: Axis.vertical,
                     enableNextPreviousButtons: false,
                     enableStepTapping: false,
                     stepColor: Colors.green,
                     activeStepBorderColor: Colors.white,
                     activeStepBorderWidth: 0.0,
                     activeStepBorderPadding: 0.0,
                     lineColor: Colors.green,
                     lineLength: 70.0,
                     lineDotRadius: 2.0,
                     stepRadius: 10.0,
                     icons: [
                       Icon(Icons.radio_button_checked,color: Colors.green,),
                       Icon(Icons.check,color: Colors.white),
                       Icon(Icons.check,color: Colors.white),
                       Icon(Icons.check,color: Colors.white),

                     ],
                   ),
                   Expanded(
                     child: ListView.builder(
                       shrinkWrap: true,
                       itemCount: Title.length,
                       itemBuilder: (context, index) {
                         return Container(
                           margin: EdgeInsets.zero,
                           width: MediaQuery.of(context).size.width,
                           child: ListTile(
                             contentPadding: EdgeInsets.symmetric(vertical: 10),
                             trailing: Text(Time[index],style: TextStyle(fontSize: 17),),
                             leading: Image.asset(icons[index],scale: 20,color: Color(0xff85723A) ),
                             title: Text(Title[index],style: TextStyle(
                                 color:  Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                             subtitle: Text(subtitle[index],style: TextStyle(
                                 color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500),),

                           ),

                         );

                       },),
                   )

                 ],
               ),


             ):
             Container(
               height: MediaQuery.of(context).size.height / 2,
               width: MediaQuery.of(context).size.width ,
               child: Row(
                 children: [
                   IconStepper(
                     direction: Axis.vertical,
                     enableNextPreviousButtons: false,
                     enableStepTapping: false,
                     stepColor: Colors.grey,
                     activeStepBorderColor: Colors.white,
                     activeStepBorderWidth: 0.0,
                     activeStepBorderPadding: 0.0,
                     lineColor: Colors.grey,
                     lineLength: 70.0,
                     lineDotRadius: 2.0,
                     stepRadius: 10.0,
                     icons: [
                       Icon(Icons.circle,color: Colors.grey,),
                       Icon(Icons.circle,color: Colors.grey,),
                       Icon(Icons.circle,color: Colors.grey,),
                       Icon(Icons.circle,color: Colors.grey),

                     ],
                   ),
                   Expanded(
                     child: ListView.builder(
                       shrinkWrap: true,
                       itemCount: Title.length,
                       itemBuilder: (context, index) {
                         return Container(
                           margin: EdgeInsets.zero,
                           width: MediaQuery.of(context).size.width,
                           child: ListTile(
                             contentPadding: EdgeInsets.symmetric(vertical: 10),
                             trailing: Text(Time[index],style: TextStyle(fontSize: 17),),
                             leading: Image.asset(icons[index],scale: 20,color: Colors.grey ),
                             title: Text(Title[index],style: TextStyle(
                                 color:  Colors.grey,fontSize: 13,),),
                             subtitle: Text(subtitle[index],style: TextStyle(
                                 color: Colors.grey,fontSize: 12,),),

                           ),

                         );

                       },),
                   )

                 ],
               ),


             ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 320,
                  height: 100,
                  decoration: BoxDecoration(
                      color:Colors.white70,borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff85723A)),
                  ),
                  child:Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(Icons.home_sharp,color: Color(0xff85723A)),
                      ),
                      Column(
                        children: [
                          Text('Delivery Address:',
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,bottom: 0),
                            child: Text( '\nHome work,work & Other Address', style: TextStyle(fontSize:14,fontWeight: FontWeight.w200, color: Colors.grey)),
                          ),
                          Row(
                            children: [
                              Text(Name, style: TextStyle(fontSize: 10,fontWeight: FontWeight.w200, color: Colors.grey)),
                              Text(",",style: TextStyle(color: Colors.grey.withOpacity(0.4)),),
                              Text( Housename, style: TextStyle(fontSize: 10,fontWeight: FontWeight.w200, color: Colors.grey)),
                              Text(",",style: TextStyle(color: Colors.grey.withOpacity(0.4))),
                              Text( City, style: TextStyle(fontSize: 10,fontWeight: FontWeight.w200, color: Colors.grey)),
                              Text(",",style: TextStyle(color: Colors.grey.withOpacity(0.4))),
                              Text( District, style: TextStyle(fontSize: 10,fontWeight: FontWeight.w200, color: Colors.grey)),
                            ],
                          )
                        ],
                      ),
                      ]  )

                    ),
                 ] );
          }
        ),
            ),



        );


  }

}
