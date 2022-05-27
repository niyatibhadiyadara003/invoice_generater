import 'dart:io';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'modal/modal.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pdf = pw.Document();
  final netImage = NetworkImage(
      'https://ph-files.imgix.net/21992128-bbc1-47a8-8b81-3eaa1186ca6c.png?auto=format');

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Container(
                width: _w,
                alignment: pw.Alignment.center,
                child: pw.Column(
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Text("To: ${details.customer}"),
                        pw.Column(
                          children: [
                            pw.Text("INVOICE",
                                style: pw.TextStyle(
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold,
                                )),
                            pw.Text("From: ${details.companyname}"),
                            pw.Text("Email: ${details.email}"),
                            pw.Text("Phone: ${details.phone}"),
                            pw.Text("Address: ${details.address}"),
                            pw.Text("${details.discription}"),
                          ],
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 20),
                    pw.Container(
                      width: _w,
                      height: 30,
                      alignment: pw.Alignment.center,
                      child: pw.Text("Billed Items"),
                    ),
                    pw.SizedBox(height: 20),
                    pw.Table(
                      defaultColumnWidth: pw.FixedColumnWidth(120.0),
                      border: pw.TableBorder.all(
                        style: pw.BorderStyle.solid,
                        width: 2,
                      ),
                      children: [
                        pw.TableRow(
                          children: [
                            pw.Column(
                              children: [
                                pw.Text(
                                  "ItemName",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            pw.Column(
                              children: [
                                pw.Text(
                                  "Quantity",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            pw.Column(
                              children: [
                                pw.Text(
                                  "Rate",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            pw.Column(
                              children: [
                                pw.Text(
                                  "Tax",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            pw.Column(
                              children: [
                                pw.Text(
                                  "Total",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        pw.TableRow(
                          children: [
                            pw.Column(
                              children: [
                                pw.Text(
                                  "${details.itemname}",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            pw.Column(
                              children: [
                                pw.Text(
                                  "${details.quantity}",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            pw.Column(
                              children: [
                                pw.Text(
                                  "${details.rate}",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            pw.Column(
                              children: [
                                pw.Text(
                                  "${details.taxval} : ${details.tax}",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            pw.Column(
                              children: [
                                pw.Text(
                                  "${details.total}",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        pw.TableRow(
                          children: [
                            pw.Column(
                              children: [
                                pw.Text(
                                  "${details.itemname1}",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            pw.Column(
                              children: [
                                pw.Text(
                                  "${details.quantity1}",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            pw.Column(
                              children: [
                                pw.Text(
                                  "${details.rate1}",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            pw.Column(
                              children: [
                                pw.Text(
                                  "${details.taxval1} : ${details.tax1}",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            pw.Column(
                              children: [
                                pw.Text(
                                  "${details.total1}",
                                  style: pw.TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    pw.Container(
                      width: _w,
                      height: 50,
                      alignment: pw.Alignment.centerRight,
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                        children: [
                          pw.Text("Total",
                              style: pw.TextStyle(
                                fontSize: 20,
                                fontWeight: pw.FontWeight.bold,
                              )),
                          pw.Text("${details.total1 + details.total}",
                              style: pw.TextStyle(
                                fontSize: 20,
                                fontWeight: pw.FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                    pw.Container(
                      alignment: pw.Alignment.centerRight,
                      child: pw.Text("${details.signature}"),
                    ),
                  ],
                ),
              ),
            ],
          ); // Center
        }));

    dynamic args = ModalRoute.of(context)!.settings.arguments;
    GlobalKey<FormState> fabkey = GlobalKey();

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Builder(
        builder: (context) => FabCircularMenu(
          key: fabkey,
          alignment: Alignment.bottomRight,
          ringColor: Colors.green,
          ringDiameter: 500.0,
          ringWidth: 150.0,
          fabSize: 64,
          fabElevation: 8,
          fabIconBorder: CircleBorder(),
          fabColor: Colors.green,
          fabOpenIcon: Icon(Icons.add),
          fabCloseIcon: Icon(Icons.close),
          fabMargin: EdgeInsets.all(16),
          animationDuration: Duration(microseconds: 8000),
          animationCurve: Curves.easeInOutCirc,
          children: [
            RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              animationDuration: Duration(milliseconds: 800),
              fillColor: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.monetization_on_rounded,
                    color: Colors.white,
                  ),
                  Text(
                    "Payment",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            RawMaterialButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushNamed("salespage");
                });
              },
              shape: CircleBorder(),
              animationDuration: Duration(milliseconds: 800),
              fillColor: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.my_library_books_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    "Sale\nInvoice",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              animationDuration: Duration(milliseconds: 800),
              fillColor: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delivery_dining,
                    color: Colors.white,
                  ),
                  Text(
                    "Dilivery\nChallan",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              animationDuration: Duration(milliseconds: 800),
              fillColor: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  Text(
                    "Purchase",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Enter Business Name",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("personaldetailspage");
                print("image: ${details.image}");
              },
              child: DrawerHeader(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (details.image == "")
                        ? Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 60,
                          )
                        : CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.green,
                            backgroundImage: FileImage(details.image),
                          ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (details.companyname != null)
                            ? Text("${details.companyname}",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.green))
                            : Text(
                                "My Company",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.green),
                              ),
                        const SizedBox(height: 10),
                        Text(
                          details.phone,
                          style: TextStyle(fontSize: 16, color: Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed("personaldetailspage");
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Sale",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                "Purchase",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                "Help",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                "Rate",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                "Reminder",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                "Terms & Condition",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                "Privacy Policy",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      /*
      https://www.smartsheet.com/sites/default/files/blank-invoice-template.png
      https://i0.wp.com/techguruplus.com/wp-content/uploads/2021/03/Colourful-GST-Invoice-Format-in-Excel-Download-.xlsx-file.jpg?fit=800%2C1090&ssl=1
       */
      body: Container(
        height: _h,
        width: _w,
        alignment: Alignment.center,
        child: (details.total1 == 0)
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Container(
                        height: 300,
                        width: 200,
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZUFu924yiGpRvsA2M4QP4EQccSoh8L_bq3A&usqp=CAU",
                          height: 300,
                        )),
                    const SizedBox(width: 20),
                    Container(
                        height: 300,
                        width: 200,
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAbSC3dWu-Yso611tt-QaSSAJVqVaQL3496w&usqp=CAU",
                          height: 300,
                        )),
                    const SizedBox(width: 20),
                    Container(
                      height: 300,
                      width: 200,
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1BURIQy2wFExDCLUnRskyqpwwz5ib2qj3Zw&usqp=CAU",
                        height: 300,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                        height: 300,
                        width: 200,
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZrAGCvrekMHhpXbPrv8fYEGaidOpLvj_pEA&usqp=CAU",
                          height: 300,
                        )),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(35),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        width: _w,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black.withOpacity(0.2),
                        ),
                        child: Text(
                          "Bill to ${details.customer}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: _w,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black.withOpacity(0.2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${details.itemname}"),
                                Text("${details.total}"),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${details.itemname1}"),
                                Text("${details.total1}"),
                              ],
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${details.itemname} Subtotal"),
                                Text(
                                    "${details.quantity}*₹${details.rate}=₹${details.subtotal}"),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${details.itemname1} Subtotal"),
                                Text(
                                    "${details.quantity1}*₹${details.rate1}=₹${details.subtotal1}"),
                              ],
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Discount(%):0"),
                                Text("₹0"),
                              ],
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("tax ${details.taxval}%:"),
                                Text("₹${details.tax}"),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("tax ${details.taxval1}%:"),
                                Text("₹${details.tax1}"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () async {
                          final output = await getExternalStorageDirectory();
                          print("path:" + output!.path);
                          final file = File("${output.path}/invoice.pdf");
                          await file.writeAsBytes(await pdf.save());
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text("Make pdf",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ))),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
