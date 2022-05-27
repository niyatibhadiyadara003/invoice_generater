import 'dart:io';

import 'dart:typed_data';

import 'dart:ui';

class Details
{
  String phone;
  String text1;
  int otp;
  String companyname;
  List sales;
  File image;
  String email;
  String address;
  String discription;
  String itemname;
  double quantity;
  double rate;
  double tax;
  double subtotal;
  double total;
  Uint8List? signature;
  String customer;
  String taxval;
  String itemname1;
  double quantity1;
  double rate1;
  double tax1;
  double subtotal1;
  double total1;
  String taxval1;

  Details({required this.phone,required this.text1,required this.otp,
    required this.companyname,required this.sales,required this.image
  ,required this.address,required this.email,required this.itemname,required this.quantity,
  required this.rate,required this.discription,required this.subtotal,
    required this.tax,required this.total,this.signature,required this.customer,required this.taxval
  ,required this.itemname1,required this.quantity1,required this.rate1,required this.subtotal1,required this.tax1
    ,required this.taxval1,required this.total1
  });
}
Details details = Details(phone: '',text1: "+91",otp: 0,companyname: "My Company",sales: [],
    image: File(""),address: "",email: "",rate: 0,quantity: 0,itemname: "",discription: "",
 tax: 0,subtotal: 0,total:0,customer: "",taxval: "",taxval1: "",itemname1: "",
  quantity1: 0,rate1: 0,subtotal1: 0,tax1: 0,total1: 0,
);