import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import 'modal/modal.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  GlobalKey<FormState> salekey = GlobalKey<FormState>();

  TextEditingController _itemname = TextEditingController();
  TextEditingController _quantity = TextEditingController();
  TextEditingController _rate = TextEditingController();

  String? itemname;
  double quantity = 0;
  double rate = 0;
  String grpval = "GST@12.0%";
  double tax = 0;
  double subtotal = 0;
  double total = 0;
  String? taxval;
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.green,
    exportBackgroundColor: Colors.white,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print('Value changed'));
  }

  late Uint8List signature;

  @override
  Widget build(BuildContext context) {
    total = tax + subtotal;
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
            key: salekey,
            child: Column(
              children: [
                TextFormField(
                  controller: _itemname,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter item name first";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    itemname = val;
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
                  controller: _quantity,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter quantity first";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    quantity = double.parse(val!);
                  },
                  onChanged: (val) {
                    setState(() {
                      quantity = double.parse(val);
                      subtotal = quantity * rate;
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
                  controller: _rate,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter rate first";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      rate = double.parse(val);
                      subtotal = quantity * rate;
                    });
                  },
                  onSaved: (val) {
                    rate = double.parse(val!);
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
                      Text("₹ ${subtotal}"),
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
                            value: grpval,
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
                                grpval = val as String;
                                taxval = grpval;
                                if (grpval == "None" ||
                                    grpval == "Exempted" ||
                                    grpval == "GST@0%" ||
                                    grpval == "IGST@0%") {
                                  tax = 0;
                                }
                                if (grpval == "GST@0.25%" ||
                                    grpval == "IGST@0.25%") {
                                  tax = subtotal * 0.25 / 10;
                                  total = subtotal + tax;

                                  print(tax);
                                  print(total);
                                }
                                if (grpval == "GST@3.0%" ||
                                    grpval == "IGST@3.0%") {
                                  tax = subtotal * 3 / 10;
                                }
                                if (grpval == "GST@5.0%" ||
                                    grpval == "IGST@5.0%") {
                                  tax = subtotal * 5 / 10;
                                }
                                if (grpval == "GST@12.0%" ||
                                    grpval == "IGST@12.0%") {
                                  tax = subtotal * 12 / 10;
                                  total = subtotal + tax;
                                }
                                if (grpval == "GST@28.0%" ||
                                    grpval == "IGST@28.0%") {
                                  tax = subtotal * 28 / 10;
                                  total = subtotal + tax;
                                }
                              });
                            }),
                      ),
                      Text("₹ ${tax}"),
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
                      Text("₹ ${total}"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Signature",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Signature(
                  controller: _controller,
                  height: 250,
                  backgroundColor: Colors.black.withOpacity(0.2),
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.check),
                        color: Colors.green,
                        onPressed: () async {
                          if (_controller.isNotEmpty) {
                            final Uint8List? data =
                                await _controller.toPngBytes();
                            if (data != null) {
                              signature = data;
                            }
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.undo),
                        color: Colors.green,
                        onPressed: () {
                          setState(() => _controller.undo());
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.redo),
                        color: Colors.green,
                        onPressed: () {
                          setState(() => _controller.redo());
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.clear),
                        color: Colors.green,
                        onPressed: () {
                          setState(() => _controller.clear());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        if (salekey.currentState!.validate()) {
                          salekey.currentState!.save();

                          subtotal = quantity * rate;
                          total = subtotal + tax;

                          details.itemname = itemname!;
                          details.quantity = quantity;
                          details.rate = rate;
                          details.tax = tax;
                          details.subtotal = subtotal;
                          details.total = total;
                          details.signature = signature;
                          details.taxval = taxval!;

                          print(details.itemname);
                          print(details.quantity);
                          print(details.rate);
                          print(details.subtotal);
                          print(details.tax);
                          print(details.total);
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
                        salekey.currentState!.reset();

                        _itemname.clear();
                        _quantity.clear();
                        _rate.clear();
                        _controller.clear();

                        details.itemname = '';
                        details.quantity = 0;
                        details.rate = 0;
                        details.tax = 0;
                        details.subtotal = 0;
                        details.total = 0;
                        details.signature?.clear();

                        itemname = '';
                        quantity = 0;
                        rate = 0;
                        tax = 0;
                        subtotal = 0;
                        total = 0;
                        signature.clear();

                        print(details.itemname);
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
