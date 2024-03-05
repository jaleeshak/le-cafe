class cust{
  String id;
  String Name;
  String image;
  cust(this.id,this.Name,this.image );

}
class product{
  String id;
  String ProductName;
  String price;
  String Quantity;
  String Description;
  String productsimage;
  String category;

  product(this.id,this.ProductName,this.price,this.Quantity,this.Description,this.productsimage,this.category);
}
class caros{
  String id;
  String carosalimage;
  caros(this.id,this.carosalimage);
}
class adress{
  String id;
  String adname;
  String adhousename;
  String adcity;
  String adDist;
  String adphone;
  adress(this.id,this.adname,this.adhousename,this.adcity,this.adDist,this.adphone);
}
class Orderdetails {
  List<dynamic> Productid;
  String photo;
  String categoryid;
  String name;
  String description;
  String quantity;

  String orderid;
  String paymenttype;

  double price;
  String adname;
  String adhousename;
  String adcity;
  String addistrict;
  String adphone;

  double totalprice;
  String userid;
  String time;
  String otherprice;
  String status;
  String statustime;
  Orderdetails(this.Productid,this.photo, this.categoryid, this.name, this.description, this.quantity, this.orderid, this.paymenttype,
       this.price, this.adname,this.adhousename,this.adcity,this.addistrict,this.adphone,this.totalprice, this.userid, this.time, this.otherprice,this.status,this.statustime);
}
class Users {
  String id;
  String Name;
  String Phone;
  Users(this.id,this.Name,this.Phone);
}
class OrderStatus {
  final String status;
  final String time;

  OrderStatus(this.status, this.time);
}
