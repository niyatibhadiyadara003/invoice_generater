import 'package:flutter/material.dart';

import 'modal/modal.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  GlobalKey<FormState> otpkey = GlobalKey();
  TextEditingController _otp = TextEditingController();
  late int otp;

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    print(args);
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: _h,
        width: _w,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Container(
              alignment: const Alignment(-0.9, 0),
              width: _w,
              child: const Text(
                "Verifying OTP",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.none),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: const Alignment(-0.9, 0),
              width: _w,
              child: Text(
                "OTP sent to Change?",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.5),
                    decoration: TextDecoration.none),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: _w * 0.80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Form(
                key: otpkey,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "$args",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your otp First";
                    }
                    if (val.length != 4) {
                      return "Enter Valid otp";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    otp = int.parse(val!);
                    print(otp.runtimeType);
                  },
                ),
              ),
            ),
            const SizedBox(height: 190),
            InkWell(
              onTap: () {
                setState(() {
                  if (otpkey.currentState!.validate()) {
                    otpkey.currentState!.save();
                    details.otp = otp;
                    print(
                      details.otp.runtimeType,
                    );
                    print(details.otp);
                    print(details.phone);
                  }
                  Navigator.of(context).pushNamed(
                    "mainpage",
                  );
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
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
