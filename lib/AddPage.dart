import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import 'modal/modal.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  GlobalKey<FormState> salekey1 = GlobalKey<FormState>();

  TextEditingController _itemname1 = TextEditingController();
  TextEditingController _quantity1 = TextEditingController();
  TextEditingController _rate1 = TextEditingController();

  String? itemname1;
  double quantity1 = 0;
  double rate1 = 0;
  String grpval1 = "GST@12.0%";
  double tax1 = 0;
  double subtotal1 = 0;
  double total1 = 0;
  String? taxval1;
  late Uint8List signature1;
  final SignatureController _controller1 = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.green,
    exportBackgroundColor: Colors.white,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );

  @override
  void initState() {
    super.initState();
    _controller1.addListener(() => print('Value changed'));
  }

  @override
  Widget build(BuildContext context) {
    total1 = tax1 + subtotal1;
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.green,
        title: Text(
          "Add items to sale",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(35),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: salekey1,
            child: Column(
              children: [
                TextFormField(
                  controller: _itemname1,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter item name first";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    itemname1 = val;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Item Name",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _quantity1,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter quantity first";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    quantity1 = double.parse(val!);
                  },
                  onChanged: (val) {
                    setState(() {
                      quantity1 = double.parse(val);
                      subtotal1 = quantity1 * rate1;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Quantity",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _rate1,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter rate first";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      rate1 = double.parse(val);
                      subtotal1 = quantity1 * rate1;
                    });
                  },
                  onSaved: (val) {
                    rate1 = double.parse(val!);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Rate",
                  ),
                ),
                const SizedBox(height: 20),
                Divider(
                  color: Colors.black,
                ),
                const SizedBox(height: 20),
                Text(
                  "Totals & Taxes",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  width: _w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Subtotal"),
                      Text("₹ ${subtotal1}"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  width: _w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Tax %"),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: DropdownButton(
                            value: grpval1,
                            items: const [
                              DropdownMenuItem(
                                child: Text("None"),
                                value: "None",
                              ),
                              DropdownMenuItem(
                                child: Text("Exempted"),
                                value: "Exempted",
                              ),
                              DropdownMenuItem(
                                child: Text("GST@0%"),
                                value: "GST@0%",
                              ),
                              DropdownMenuItem(
                                child: Text("IGST@0%"),
                                value: "IGST@0%",
                              ),
                              DropdownMenuItem(
                                child: Text("GST@0.25%"),
                                value: "GST@0.25%",
                              ),
                              DropdownMenuItem(
                                child: Text("IGST@0.25%"),
                                value: "IGST@0.25%",
                              ),
                              DropdownMenuItem(
                                child: Text("GST@3.0%"),
                                value: "GST@3.0%",
                              ),
                              DropdownMenuItem(
                                child: Text("IGST@3.0%"),
                                value: "IGST@3.0%",
                              ),
                              DropdownMenuItem(
                                child: Text("GST@5.0%"),
                                value: "GST@5.0%",
                              ),
                              DropdownMenuItem(
                                child: Text("IGST@5.0%"),
                                value: "IGST@5.0%",
                              ),
                              DropdownMenuItem(
                                child: Text("GST@12.0%"),
                                value: "GST@12.0%",
                              ),
                              DropdownMenuItem(
                                child: Text("IGST@12.0%"),
                                value: "IGST@12.0%",
                              ),
                              DropdownMenuItem(
                                child: Text("GST@18.0%"),
                                value: "GST@18.0%",
                              ),
                              DropdownMenuItem(
                                child: Text("IGST@18.0%"),
                                value: "IGST@18.0%",
                              ),
                              DropdownMenuItem(
                                child: Text("GST@28.0%"),
                                value: "GST@28.0%",
                              ),
                              DropdownMenuItem(
                                child: Text("IGST@28.0%"),
                                value: "IGST@28.0%",
                              ),
                            ],
                            onChanged: (val) {
                              setState(() {
                                grpval1 = val as String;
                                taxval1 = grpval1;
                                if (grpval1 == "None" ||
                                    grpval1 == "Exempted" ||
                                    grpval1 == "GST@0%" ||
                                    grpval1 == "IGST@0%") {
                                  tax1 = 0;
                                }
                                if (grpval1 == "GST@0.25%" ||
                                    grpval1 == "IGST@0.25%") {
                                  tax1 = subtotal1 * 0.25 / 10;
                                  total1 = subtotal1 + tax1;
                                }
                                if (grpval1 == "GST@3.0%" ||
                                    grpval1 == "IGST@3.0%") {
                                  tax1 = subtotal1 * 3 / 10;
                                }
                                if (grpval1 == "GST@5.0%" ||
                                    grpval1 == "IGST@5.0%") {
                                  tax1 = subtotal1 * 5 / 10;
                                }
                                if (grpval1 == "GST@12.0%" ||
                                    grpval1 == "IGST@12.0%") {
                                  tax1 = subtotal1 * 12 / 10;
                                  total1 = subtotal1 + tax1;
                                }
                                if (grpval1 == "GST@28.0%" ||
                                    grpval1 == "IGST@28.0%") {
                                  tax1 = subtotal1 * 28 / 10;
                                  total1 = subtotal1 + tax1;
                                }
                              });
                            }),
                      ),
                      Text("₹ ${tax1}"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  width: _w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total Amount:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text("₹ ${total1}"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        if (salekey1.currentState!.validate()) {
                          salekey1.currentState!.save();

                          subtotal1 = quantity1 * rate1;
                          total1 = subtotal1 + tax1;

                          details.itemname1 = itemname1!;
                          details.quantity1 = quantity1;
                          details.rate1 = rate1;
                          details.tax1 = tax1;
                          details.subtotal1 = subtotal1;
                          details.total1 = total1;
                          details.taxval1 = taxval1!;

                          print(details.itemname1);
                          print(details.quantity1);
                          print(details.rate1);
                          print(details.subtotal1);
                          print(details.tax1);
                          print(details.total1);
                        }
                        setState(() {
                          Navigator.of(context).pushNamed(
                            "salepage2",
                          );
                        });
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text("Save",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ))),
                    ),
                    InkWell(
                      onTap: () {
                        salekey1.currentState!.reset();

                        _itemname1.clear();
                        _quantity1.clear();
                        _rate1.clear();
                        _controller1.clear();

                        details.itemname1 = '';
                        details.quantity1 = 0;
                        details.rate1 = 0;
                        details.tax1 = 0;
                        details.subtotal1 = 0;
                        details.total1 = 0;

                        itemname1 = '';
                        quantity1 = 0;
                        rate1 = 0;
                        tax1 = 0;
                        subtotal1 = 0;
                        total1 = 0;
                        signature1.clear();

                        print(details.itemname1);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text("Reset",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
