import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecafe/screens/user/myprofile.dart';
import 'package:provider/provider.dart';

import '../providers/mainprovider.dart';
import '../screens/user/cart.dart';
import '../screens/user/menu.dart';

class Bottombar extends StatefulWidget {
  String userid;
  Bottombar({super.key,required this.userid});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {

  int selectedIndex = 0;



  @override
  void _itemTapped(int index){
    MainProvider provider=Provider.of<MainProvider>(context,listen: false);
    setState(() {
      selectedIndex = index;
      if(selectedIndex==1){
        provider.cartget(widget.userid);
        print("hhyyg"+widget.userid.toString());
      }
      print(selectedIndex.toString()+"ppkk");
    });

  }

  @override
  Widget build(BuildContext context) {

    var pages = [
      Menu(userid:widget.userid),
      Cart(userid: widget.userid),
      MyProfile(userid:widget.userid,)
    ];
    print(selectedIndex.toString()+"ijkjkj");
    return Scaffold(

      body: pages[selectedIndex],
       extendBody: true,
      bottomNavigationBar:  DotNavigationBar(
        backgroundColor: Color(0xff85723A),
        margin: EdgeInsets.zero,marginR: EdgeInsets.zero,paddingR: EdgeInsets.zero,
        // enableFloatingNavBar: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xff988A9A),
        // backgroundColor: Colors.black.withOpacity(0.7),
        currentIndex: selectedIndex,

        onTap: _itemTapped,
        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.shopping_cart),

          ),
          DotNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),

          ),
        ],

      ),
    );
  }
}
