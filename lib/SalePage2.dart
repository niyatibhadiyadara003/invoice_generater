import 'package:flutter/material.dart';

import 'modal/modal.dart';

class SalePage2 extends StatefulWidget {
  const SalePage2({Key? key}) : super(key: key);

  @override
  State<SalePage2> createState() => _SalePage2State();
}

class _SalePage2State extends State<SalePage2> {
  TextEditingController _customer = TextEditingController();

  String? customer;

  @override
  Widget build(BuildContext context) {
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
          "Sale",
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _customer,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter customer name first";
                  }
                  return null;
                },
                onSaved: (val) {
                  customer = val;
                  details.customer = customer!;
                  print(details.customer);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Customer name",
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                width: _w,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.green,
                ),
                child: Text(
                  "Billed Item",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: _w,
                height: 200,
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
                        Text("Item Subtotal"),
                        Text(
                            "${details.quantity}*₹${details.rate}=₹${details.subtotal}"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Discount(%):0"),
                        Text("₹0"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("tax ${details.taxval}%:"),
                        Text("₹${details.tax}"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              (details.quantity1 == 0)
                  ? Container()
                  : Container(
                      width: _w,
                      height: 200,
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
                              Text("${details.itemname1}"),
                              Text("${details.total1}"),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Item Subtotal"),
                              Text(
                                  "${details.quantity1}*₹${details.rate1}=₹${details.subtotal1}"),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Discount(%):0"),
                              Text("₹0"),
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
                onTap: () {
                  setState(() {
                    Navigator.of(context).pushNamed("addpage");
                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                          backgroundColor: Colors.white,
                        ),
                        Text("Add",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                      ],
                    )),
              ),
              const SizedBox(height: 20),
              Container(
                width: _w,
                height: 200,
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
                        Text(
                          "Total Amount",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Text("₹${details.total1 + details.total}"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Balance Due",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Text("₹${details.total1 + details.total}"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).pushNamed("mainpage");
                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Save",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
