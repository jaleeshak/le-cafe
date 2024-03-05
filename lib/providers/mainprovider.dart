import 'dart:collection';
import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:intl/intl.dart';
import 'package:lecafe/constant/callFunctions.dart';
import 'package:lecafe/model/modalclass.dart';
import 'package:lecafe/screens/user/address.dart';

import '../screens/user/success.dart';


class MainProvider extends ChangeNotifier{
  firebase_storage.Reference ref = FirebaseStorage.instance.ref("Images");
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<cust> categoryitems = [];
  List<product> productsitems = [];
  List<caros> carosalitems = [];
List<product> cartitems=[];
List<adress> delivry=[];
List<Users> usersdetails=[];
  // String imageUrl="";
  // String subimageUrl="";
  // String carosalimageUrl="";
  TextEditingController CatNameController = TextEditingController();
  TextEditingController productsNameController = TextEditingController();
  TextEditingController productsPriceController = TextEditingController();
  TextEditingController productsQuantityController = TextEditingController();
  TextEditingController productsDescriptionController = TextEditingController();
  TextEditingController prdctcategoryController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();

  TextEditingController AdresNameController = TextEditingController();
  TextEditingController AdresHousenameController = TextEditingController();
  TextEditingController AdresCityController = TextEditingController();
  TextEditingController AdresDistricController = TextEditingController();
  TextEditingController AdresPhoneController = TextEditingController();





  List<String> images=[
    "assets/Group 13.png",
    "assets/Group 13 (1).png",
    "assets/Group 13 (2).png",

  ];

  int KG = 20;
  double k = 20;
  double kgValue = 0;

  void changeValue(int value) {
    KG = value.toInt();
    kgValue = KG / 2;
    notifyListeners();
  }
  int indextab  =0;

  File? categoryfileimg;
  File? productsfileimg;
  File? carosalfileimg;
  File? userfileimg;
  String userimage="";
  String image="";
  String productimage="";
  String carosalimage="";
  bool boxVal=false;
  bool boxval2=false;
  bool boxval3=false;

bool orderValue=false;
  int Activeindex=0;
  void activeIndex(int index) {
    Activeindex = index;
    notifyListeners();
  }

  void tabIndex(int value){
    indextab = value;
    notifyListeners();
    print(indextab);
  }
  void showNameStatus(){
    if(orderValue){
      orderValue=false;
    }else{
      orderValue=true;
    }
    notifyListeners();
  }


  void showsNameStatus(){
    if(orderValue){
      orderValue=false;
    }else{
      orderValue=true;
    }
    notifyListeners();
  }


  void checkbx1(){
    if(boxVal){
      boxVal=false;
    }else{
      boxVal=true;
    }
    notifyListeners();
  }
  void checkbx2(){
    if(boxval2){
      boxval2=false;
    }else{
      boxval2=true;
    }
    notifyListeners();
  }
  void checkbx3(){
    if(boxval3){
      boxval3=false;
    }else{
      boxval3=true;
    }
    notifyListeners();
  }


  savecart(String image,String name,String price,String quantity,String description,String category,String uid,String productid,BuildContext context){
    String id =DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String,Object> map =HashMap();
    map["PHOTO"]= image;
    map["name"]= name;
    map["price"]= price;
    map["quantity"]= quantity;
    map["description"]= description;
    map["category"]= category;
    map["Products_Id"]= productid;
    map["USER_ID"]= uid;
db.collection("CART").doc(id).set(map);
notifyListeners();
    const snackBar = SnackBar(content: Text("Saved Successfully"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }


  void UsersData() {
    db.collection("CUSTOMERS").get().then((value) {
      if (value.docs.isNotEmpty) {
        usersdetails.clear();
        for (var element in value.docs) {
          usersdetails.add(
              Users(element.id, element.get("NAME").toString(),
                element.get("PHONE_NUMBER").toString()

              ));
          // print(subcategory.length.toString()+"jiiii");
          notifyListeners();
        }
      }
    });
  }
  String name="";
  String id="";
  String phone="";
  String photo="";
  getprofile(String id){
    db.collection("CUSTOMERS").doc(id).get().then((value) {
      if(value.exists){
        Map<dynamic,dynamic> map= value.data() as Map;
        id=value.id;
        name=map["NAME"].toString();
        phone=map["PHONE_NUMBER"].toString();
        userimage=map["PHOTO"]??"";
        notifyListeners();
      }
    });
  }


  addRegister(String uid,from,BuildContext context) async {
    String id =DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> customerMap=HashMap();
    HashMap<String, Object> map=HashMap();
    map["NAME"]=usernameController.text.toString();
    map["PHONE_NUMBER"]="+91"+phonenumberController.text.toString();
    map["TYPE"]="USER";
    if(from=="NEW") {
      map["USER_ID"]=id;
    }
    else {
      if (userfileimg != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();

      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(userfileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          customerMap["PHOTO"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    }
      else {
        customerMap['PHOTO'] = userimage;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    }



    customerMap["NAME"]=usernameController.text.toString();
    customerMap["PHONE_NUMBER"]=phonenumberController.text.toString();
    if(from=="NEW") {
      customerMap["CUSTOMER_ID"] = id;
    }
    if(from=="NEW"){
      db.collection("CUSTOMERS").doc(id).set(customerMap);
        db.collection("USER").doc(id).set(map);
    }
    else{
      // if (userfileimg != null) {
      //   String photoId = DateTime
      //       .now()
      //       .millisecondsSinceEpoch
      //       .toString();
      //
      //   ref = FirebaseStorage.instance.ref().child(photoId);
      //   await ref.putFile(userfileimg!).whenComplete(() async {
      //     await ref.getDownloadURL().then((value) {
      //       map["PHOTO"] = value;
      //
      //       notifyListeners();
      //     });
      //     notifyListeners();
      //   });
      //   notifyListeners();
      // }
      // else {
      //   map['PHOTO'] = userimage;
      //   // editMap['IMAGE_URL'] = imageUrl;
      // }
      db.collection("CUSTOMERS").doc(uid).set(customerMap,SetOptions(merge: true));
      db.collection("USER").doc(uid).set(map,SetOptions(merge: true));
    }

    const snackBar = SnackBar(content: Text("Saved Successfully"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
    finish(context);
  }


  void editRegister(String id){
    print(id+"didii");
    db.collection("CUSTOMERS").doc(id).get().then((value) {
      if(value.exists){
        Map<dynamic, dynamic> map = value.data() as Map;
        usernameController.text = map["NAME"].toString();
        phonenumberController.text=map["PHONE_NUMBER"].toString();
        userimage= map["PHOTO"].toString();
        print(userimage+"ghhg");
        notifyListeners();
      }

    });
  }


  Future<void> addcategory(BuildContext context,String svid,String frm) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();

    HashMap<String, Object> map =HashMap();
    map["Name"]=CatNameController.text.toString();
    if(frm=="NEW"){
      map["Category_Id"]=id;
    }

    if (categoryfileimg != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();

      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(categoryfileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;
          // categorymap["id photo"] = photoId;
          //  editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['PHOTO'] = image;
      // editMap['IMAGE_URL'] = imageUrl;
    }

    // db.collection("Customers").doc(id).set(map);
    if(frm=="NEW"){
      db.collection("Category").doc(id).set(map);
    }else{
      db.collection("Category").doc(svid).set(map,SetOptions(merge: true));
    }
    notifyListeners();
    const snackBar = SnackBar(content: Text("Saved Successfully"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    getData();
    finish(context);

  }
 void addAddress(BuildContext context,userid,){
    String id=DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> map =HashMap();
    map["Name"] = AdresNameController.text.toString();
    map["House_name"] = AdresHousenameController.text.toString();
    map["City"] = AdresCityController.text.toString();
    map["District"] = AdresDistricController.text.toString();
    map["Phone"] = "+91"+AdresPhoneController.text.toString();
    map["USER_ID"] = userid;
    map["ADDRESS_ID"] = id;
    // print("hdhgdhg"+userid);
    db.collection('ADDRESS').doc(id).set(map);
     notifyListeners();
    const snackBar = SnackBar(content: Text("Saved Successfully"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
     getallAdress(userid);
     print("kkjjj"+userid);
    finish(context);

  }
  String Name="";
  String Housename="";
  String City="";
  String Disrict="";
  String Phone="";
  String userid="";
void getAdress(){
  db.collection("ADDRESS").get().then((value) {
    if (value.docs.isNotEmpty) {

      for (var element in value.docs) {
        Name=element.get("Name").toString();
        Housename= element.get("House_name").toString();
        City= element.get("City").toString();

        Disrict= element.get("District").toString();
        Phone= element.get("Phone").toString();
        userid=element.get("USER_ID").toString();

        print("hjjh"+userid);
        notifyListeners();
      }
    }
  });
}
void getallAdress(userid){

  db.collection("ADDRESS").where("USER_ID",isEqualTo: userid).get().then((value) {
    if (value.docs.isNotEmpty) {
      delivry.clear();
      for (var element in value.docs) {
        delivry.add(adress(
          element.id,
        Name=element.get("Name").toString(),
        Housename= element.get("House_name").toString(),
        City= element.get("City").toString(),
        Disrict= element.get("District").toString(),
        Phone= element.get("Phone").toString(),
        ) );
        // userid=element.get("USER_ID").toString();
        print("ghghh"+Name);

        notifyListeners();
      }
    }
  });
}
  void deleteAdres(BuildContext context,id,userid){
    db.collection("ADDRESS").doc(id).delete();

    const snackBar = SnackBar(content: Text("Deleted Successfully"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    getallAdress(userid);
    print("occ");
    notifyListeners();
  }
  void editAdres(String id){
    db.collection("ADDRESS").doc(id).get().then((value) {
      if(value.exists){
        Map<dynamic, dynamic> map = value.data() as Map;
        AdresNameController.text = map["Name"].toString();
        AdresHousenameController.text = map["House_name"].toString();
        AdresCityController.text = map["City"].toString();
        AdresDistricController.text = map["District"].toString();
        AdresPhoneController.text = map["Phone"].toString();

        notifyListeners();
      }

    });
  }




  String productSelectedCategoryID="";

  Future<void> addprodct(BuildContext context,String productId,String from ) async {
    String id=DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> map =HashMap();
    map["Product Name"] = productsNameController.text.toString();
    map["Price"] = productsPriceController.text.toString();
    map["Quantity"] = productsQuantityController.text.toString();
    map["Description"] = productsDescriptionController.text.toString();
    map["Category"] = prdctcategoryController.text.toString();
    map["Category_ID"] = productSelectedCategoryID;

    if(from=="NEW") {
      map["Products_Id"]=id;
    }
    if (productsfileimg != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();

      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(productsfileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;
          // categorymap["id photo"] = photoId;
          //  editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['PHOTO'] = productimage;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    if(from=="NEW"){
      db.collection("PRODUCTS").doc(id).set(map);
    }else{
      db.collection("PRODUCTS").doc(productId).update(map);
    }
    notifyListeners();
    const snackBar = SnackBar(content: Text("Saved Successfully"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    allProductaData();
    finish(context);


  }
  Future<void> Addcarosal(BuildContext context,String from,String carosalId) async {
    String id= DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> map =HashMap();
    if(from=="NEW") {
      map["Carosal_Id"]=id;
    }
    if ( carosalfileimg!= null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();

      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(carosalfileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;
          // categorymap["id photo"] = photoId;
          //  editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['PHOTO'] = carosalimage;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    if(from=="NEW"){
      db.collection("Carosal").doc(id).set(map);
    }
    else{
      db.collection("Carosal").doc(carosalId).update(map);
    }
    getCarosalData();
    finish(context);
    notifyListeners();
  }


  List<double> totalAmount = [];
  double totalPrice=0;
  double total=0.0;
  List<String> productid=[];
  bool cartloader=false;
  bool checkcart=true;


void cartget(String Userid){
  cartloader=true;
  notifyListeners();

print("bsfvfsvs");
    db.collection("CART").where("USER_ID",isEqualTo:Userid ).get().then((value){
      cartloader=false;
      notifyListeners();
      if (value.docs.isNotEmpty){
        cartitems.clear();
        productid.clear();
        totalAmount.clear();
        checkcart=true;
        notifyListeners();
        for(var element in value.docs){
          print( element.get("name").toString());
          cartitems.add(
              product(element.id, element.get("name").toString(),
                element.get("price").toString(),
                  element.get("quantity").toString(),
                  element.get("description").toString(),
                element.get("PHOTO").toString(),
                 element.get("category").toString(),
              ));

          notifyListeners();
          productid.add(element.get("Products_Id").toString());
          notifyListeners();

          totalAmount.add(double.parse(element.get("price")));
          notifyListeners();

          print(totalAmount);


        }
        totalPrice=totalAmount.reduce((a, b) => a + b) as double;
        print(totalPrice.toString()+"fdtfg");
        total=totalPrice+30;
        notifyListeners();
      }else{
        checkcart=false;
        notifyListeners();
      }
    });
}
String ordervaluew='';
void orderplaced(String? val) {
  ordervaluew = val!;
}
String ordervaluew2='';
void paymntconfirmed(String? val2) {
  ordervaluew2 = val2!;
}
String ordervaluew3='';
void orderproccesd(String? val3) {
  ordervaluew3 = val3!;
}
String ordervaluew4='';
void ready(String? val4) {
  ordervaluew4 = val4!;
}
String adresvalue="";
void adreses(String? val){
  adresvalue=val!;
  notifyListeners();
}
  String checkvalue3 = "";

  void payment(String? val) {
    checkvalue3 = val!;
    notifyListeners();
  }
  void updateorder(String orderid,BuildContext context){
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> map = HashMap();
    map["STATUS"]=ordervaluew;
    map["STATUS_TIME"]=DateTime.now();

    db.collection("ORDER_DETAILS").doc(orderid).update(map);
  }



  void AddOrder(String from,String userid, List productid, String productPRICE,
     String name,String Housename,String city,String District,String Phone,
      String totalprice,BuildContext context) {
    print("ddgfdddddddddddddd"+productPRICE.toString());
    print("hxhgdhgdhcjgdfc"+totalprice.toString());
    print("ljjjjjjjjjjjjjjjjjjj");
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> ordermap = HashMap();
    ordermap["ORDER_ID"] = id;
    ordermap["USER_ID"] = userid;
    ordermap["Products_Id"] = productid;
    ordermap["TIME"] = DateTime.now();
    ordermap["PRODUCT_PRICE"] = double.parse(productPRICE);
    print("hgdhggg");
    // ordermap["ADDRESS_ID"]=address_id;
    ordermap["Name"]=name;
    ordermap["House_name"]=Housename;
    ordermap["City"]=city;
    ordermap["District"]=District;
    ordermap["Phone"]=Phone;
    ordermap["TOTAL_PRICE"] = double.parse(totalprice);
    // ordermap["TYPE"] = choice;
    ordermap["PAYMENT_TYPE"] = checkvalue3;
    ordermap["OTHER_PRICE"] = 30;

    db.collection("ORDER_DETAILS").doc(id).set(ordermap);
    print("pwjxvwdhdv"+productid.length.toString() );


    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(
          child: Text("Your Order Is Confirmed",
              style: TextStyle(
                  color: Color(0xffB1A581), fontSize: 15, fontWeight: FontWeight.bold))),
      backgroundColor: Color(0xffE9E7E0),
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
    ));

    if(from=="CART"){

      for(var cartid in productid){
        db.collection("CART").where("Products_Id",isEqualTo:cartid ).get().then((value) {
          if(value.docs.isNotEmpty){
            db.collection("CART").doc(value.docs.first.id).delete();
          }
        });
        notifyListeners();
      }

      cartget(userid);
      print("okk");

      notifyListeners();

    }
    // db.collection("CART").
    Navigator.push(context, MaterialPageRoute(builder: (context) => Success(userid: userid),));

    notifyListeners();
  }

  List<Orderdetails> orders=[];
  bool orderloader=false;
  void getordereddetils() {

    orderloader=true;
    notifyListeners();
    List<String> productid = [];
    String prductname = '';
    String productdescription = '';
    // String productingridient = '';
    String productquantity = '';
    String categoryid = '';
    String photo = '';
    String price = '';


    db.collection("ORDER_DETAILS").get().then((value) {
      print("jyghjcgvjgdc");
      orderloader=false;
      notifyListeners();
      print("hnjm bhbh");

      if (value.docs.isNotEmpty) {
        orders.clear();

        for (var elements in value.docs) {

          print("jhbdvjlfbvjlefqbv"+DateFormat("dd-MM-yyyy hh:mm a")
              .format(elements.get("TIME").toDate())
              .toString());

          Map<String, dynamic> ordermap = elements.data();
          // productid=ordermap["PRODUCT_ID"];
          for (var kk in ordermap["Products_Id"]) {
            print(kk.toString() + "gkkg");
            print(kk.toString() + "cmmc");
            productid.add(kk);
            notifyListeners();
          }
          print("gfvhewvkjwehfvhe"+productid.toString());

          // print(productid=ordermap["PRODUCT_ID"]+"fkkf");
          db
              .collection("PRODUCTS")
              .where("Products_Id", whereIn: productid)
              .get()
              .then((val) {
            if (val.docs.isNotEmpty) {
              orders.clear();
            print("dssfsf");
              for (var elem in val.docs) {
                prductname = elem.get("Product Name").toString();
                productdescription = elem.get("Description").toString();
                // productingridient = elem.get("Product_Ingredients").toString();
                productquantity = elem.get("Quantity").toString();
                categoryid = elem.get("Category_ID").toString();
                photo = elem.get("PHOTO").toString();
                price = elem.get("Price").toString();
                orders.add(Orderdetails(
                    productid,
                    photo,
                    categoryid,
                    prductname,
                    productdescription,
                    productquantity,
                    // productdiscount,
                    ordermap["ORDER_ID"].toString(),
                    ordermap["PAYMENT_TYPE"].toString(),

                    double.parse(price),
                    ordermap["Name"],
                    ordermap["House_name"],
                    ordermap["City"],
                    ordermap["District"],
                    ordermap["Phone"],
                    ordermap["TOTAL_PRICE"],
                    ordermap["USER_ID"].toString(),
                    DateFormat("dd-MM-yyyy hh:mm a")
                        .format(ordermap["TIME"].toDate())
                        .toString(),
                    ordermap["OTHER_PRICE"].toString(),
                    ordermap["STATUS"].toString(),
                    ordermap["STATUS_TIME"].toString(),
                ));
                // filterorders = orders;
                notifyListeners();
              }


            }
          });
          notifyListeners();
        }
      }
    });
  }

  // map

void deleteCart(BuildContext context,id){
  db.collection("CART").doc(id).delete();

  const snackBar = SnackBar(content: Text("Deleted Successfully"));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  cartget(id);
  print("occ");
  notifyListeners();
}


  void getCarosalData(){
    db.collection("Carosal").get().then((value) {
      carosalitems.clear();
      if (value.docs.isNotEmpty){

        for(var element in value.docs){
          carosalitems.add(
              caros(element.get("Carosal_Id").toString(), element.get("PHOTO").toString(),
              ));

          notifyListeners();

        }
      }
    });
    notifyListeners();
  }

void getProductaData(String CateId) {
  db.collection("PRODUCTS").where("Category_ID",isEqualTo:CateId ).get().then((value) {
    if (value.docs.isNotEmpty) {
      productsitems.clear();
      for (var element in value.docs) {
        productsitems.add(
            product(element.id, element.get("Product Name").toString(),
              element.get("Price").toString(),
              element.get("Quantity").toString(),
              element.get("Description").toString(),
              element.get("PHOTO").toString(),
              element.get("Category").toString(),
            ));
        // print(subcategory.length.toString()+"jiiii");
        notifyListeners();
      }
    }
  });
}
  void allProductaData() {
    db.collection("PRODUCTS").get().then((value) {
      if (value.docs.isNotEmpty) {
        productsitems.clear();
        for (var element in value.docs) {
          productsitems.add(
              product(element.id, element.get("Product Name").toString(),
                element.get("Price").toString(),
                element.get("Quantity").toString(),
                element.get("Description").toString(),
                element.get("PHOTO").toString(),
                element.get("Category").toString(),
              ));
          // print(subcategory.length.toString()+"jiiii");
          notifyListeners();
        }
      }
    });
  }


  void getData() {
    db.collection("Category").get().then((value) {
      if (value.docs.isNotEmpty) {
        categoryitems.clear();
        for (var element in value.docs) {
          categoryitems.add(
              cust(element.id, element.get("Name").toString(), element.get("PHOTO").toString()));
          notifyListeners();
        }
      }
    });
  }
  void setsubImage(File image) {
    productsfileimg = image;
    // print("234567sdfg"+Categoryfileimg.toString());

    notifyListeners();
  }

  Future getsubImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      print("hjkl"+pickedImage.path);
      subcropImage(pickedImage.path,"");
    } else {
      print('No image selected.');
    }
  }

  Future getsubImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      subcropImage(pickedImage.path,"");
      // print("dfghjk"+pickedImage.path);

    } else {
      print('No image selected.');
    }

  }
  Future<void> subcropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      productsfileimg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }


  Future getprofileImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      print("hjkl"+pickedImage.path);
      profilecropImage(pickedImage.path,"");
    } else {
      print('No image selected.');
    }
  }

  Future getprofileImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      profilecropImage(pickedImage.path,"");
      // print("dfghjk"+pickedImage.path);

    } else {
      print('No image selected.');
    }

  }
  Future<void> profilecropImage(String path,String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      userfileimg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  Future getcarosalImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      print("hjkl"+pickedImage.path);
      carosalcropImage(pickedImage.path,"");
    } else {
      print('No image selected.');
    }
  }

  Future getcarosalImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      carosalcropImage(pickedImage.path,"");
      // print("dfghjk"+pickedImage.path);

    } else {
      print('No image selected.');
    }

  }
  Future<void> carosalcropImage(String path,String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      carosalfileimg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }
void editcarosal(String id){
    db.collection("Carosal").doc(id).get().then((value) {
      if(value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        carosalimage = map["PHOTO"].toString();
        notifyListeners();

      }
    });
}

  void editproductsData(String id){
    db.collection("PRODUCTS").doc(id).get().then((value) {
      if(value.exists){
        Map<dynamic, dynamic> map = value.data() as Map;
        productsNameController.text = map["Product Name"].toString();
        productsPriceController.text = map["Price"].toString();
        productsQuantityController.text = map["Quantity"].toString();
        productsDescriptionController.text = map["Description"].toString();
        productimage = map["PHOTO"].toString();
        prdctcategoryController.text = map["Category"].toString();
        productSelectedCategoryID=map["Category_ID"].toString();

        notifyListeners();
      }
    });
  }


  void editCategoryData(String id){
    db.collection("Category").doc(id).get().then((value) {
      if(value.exists){
        Map<dynamic, dynamic> map = value.data() as Map;
        CatNameController.text = map["Name"].toString();
        image = map["PHOTO"].toString();

        notifyListeners();
      }

    });
  }
  void deletecarosal(context,String id){
    db.collection("Carosal").doc(id).delete();
    const snackBar = SnackBar(content: Text("Deleted Successfully"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
     getCarosalData();
    notifyListeners();


  }
  void deleteproductData( context,String id){
    db.collection("PRODUCTS").doc(id).delete();

    const snackBar = SnackBar(content: Text("Deleted Successfully"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    allProductaData();
    notifyListeners();


  }
  void deletecategoryData( context,String id){
    db.collection("Category").doc(id).delete();

    const snackBar = SnackBar(content: Text("Deleted Successfully"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    getData();
    notifyListeners();


  }
  void clearcarosal(){
    carosalfileimg=null;
    carosalimage='';
    notifyListeners();

  }

  void clearproductsText(){
    productsNameController.clear();
    productsPriceController.clear();
    productsQuantityController.clear();
    productsDescriptionController.clear();
    prdctcategoryController.clear();
    productsfileimg=null;
    productimage='';
    notifyListeners();
  }


  void clearcategoryText() {
    CatNameController.clear();
    categoryfileimg=null;
    image='';
    notifyListeners();
  }


  Future getImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      print("hjkl"+pickedImage.path);
      cropImage(pickedImage.path,"");
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImage(pickedImage.path,"");
      // print("dfghjk"+pickedImage.path);

    } else {
      print('No image selected.');
    }

  }
  Future<void> cropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      categoryfileimg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }
}