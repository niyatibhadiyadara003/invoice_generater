import 'package:flutter/material.dart';

import 'modal/modal.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> _phonekey = GlobalKey();
  TextEditingController _phone = TextEditingController();
  String? phone;

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    String text1 = "+91";
    dynamic grpval;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: _h,
        width: _w,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Container(
              alignment: Alignment(-0.9, 0),
              width: _w,
              child: const Text(
                "SignUp",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.none),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment(-0.8, 0),
              width: _w,
              child: Text(
                "Get Control of your business with Invoice",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.5),
                    decoration: TextDecoration.none),
              ),
            ),
            const SizedBox(height: 60),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: _w * 0.80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Form(
                key: _phonekey,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Mobile Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your Mobile Number First";
                    }
                    if (val!.length != 10) {
                      return "Enter Valid Mobile Number";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    phone = val;
                  },
                ),
              ),
            ),
            const SizedBox(height: 150),
            InkWell(
              onTap: () {
                setState(() {
                  if (_phonekey.currentState!.validate()) {
                    _phonekey.currentState!.save();
                    details.phone = phone!;
                    print(details.phone);
                    Navigator.of(context).pushNamed("circularpage");
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: _w * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.green,
                ),
                child: Text("Get OTP",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
