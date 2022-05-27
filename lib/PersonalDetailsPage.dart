import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'modal/modal.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  GlobalKey<FormState> personalkey = GlobalKey<FormState>();

  TextEditingController _companyname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _discription = TextEditingController();

  String? companyname;
  String? email;
  String? phone;
  String? address;
  String? discription;

  ImagePicker _picker = ImagePicker();
  File? _image;

  @override
  Widget build(BuildContext context) {
    _phone.text = details.phone;
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
          "Business Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black,
            backgroundImage: (_image != null) ? FileImage(_image!) : null,
            child: Stack(
              alignment: Alignment.center,
              children: [
                (_image != null)
                    ? Container()
                    : Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.green,
                      ),
                (_image != null)
                    ? Container()
                    : Align(
                        alignment: Alignment(0.9, 0.8),
                        child: InkWell(
                          onTap: () async {
                            XFile? xfile = await _picker.pickImage(
                                source: ImageSource.gallery);
                            String path = xfile!.path;
                            File file = File(path);

                            setState(() {
                              _image = file;
                              details.image = _image!;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: Icon(Icons.add),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(40),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: personalkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _companyname,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter company name first";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    companyname = val;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Company Name",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _email,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter email first";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    email = val;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _phone,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter phone number first";
                    } else if (val.length != 10) {
                      return "Enter valid number lenght";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    phone = val;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "phone",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _address,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter address first";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    address = val;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Address(Street,Building No)",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _discription,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter discription first";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    discription = val;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Discription",
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        if (personalkey.currentState!.validate()) {
                          personalkey.currentState!.save();
                          details.companyname = companyname!;
                          details.email = email!;
                          details.phone = phone!;
                          details.address = address!;
                          details.discription = discription!;

                          print(details.companyname);
                          print(details.phone);
                        }
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
                        personalkey.currentState!.reset();

                        _companyname.clear();
                        _email.clear();
                        _phone.clear();
                        _address.clear();
                        _discription.clear();

                        details.companyname = '';
                        details.email = "";
                        details.phone = "";
                        details.address = '';
                        details.discription = "";

                        companyname = '';
                        email = "";
                        phone = "";
                        address = '';
                        discription = "";

                        print(details.companyname);
                        print(details.phone);
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
