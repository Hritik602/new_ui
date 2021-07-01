import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:ui/home_screen.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUp0State createState() => _SignUp0State();
}

class _SignUp0State extends State<SignUp> {
  File _image;
  _imgFromCamera() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            _image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50)),
                          width: 100,
                          height: 100,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Welcome $clickedName",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            TextFormField(
              onChanged: (value) {
                clickedName = value;
                if (value.isEmpty){
                  return "Complete ";
                }
                else{
                  setState(() {
                    userEnabled= true;
                  });
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 6),
                labelText: "Username",
                hintText: "Username",
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {
                clickedPassword = value;
                if (value.isEmpty){
                  return "Complete ";
                }
                else{
                  setState(() {
                    passwordEnabled= true;
                  });
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 6),
                labelText: "Password",
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {
                clickedEmail = value;
                if (value.isEmpty){
               return "Complete ";
                }
               else{
                   setState(() {
                     emailEnabled= true;
                  });
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 6),
                labelText: "Email",
                hintText: "Enter email",
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton<String>(
              items: gender.map((String dropDownMenu) {
                return DropdownMenuItem(
                    value: dropDownMenu, child: Text(dropDownMenu));
              }).toList(),
              // ignore: non_constant_identifier_names
              onChanged: (String Selected) {
                setState(() {
                  this.newSelected = Selected;
                });
              },
              value: newSelected,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              // ignore: deprecated_member_use
              child: FlatButton(
                // ignore: unnecessary_statements
                onPressed: () {
                  Navigator.of(context)
                      // ignore: unnecessary_statements
                      .push(MaterialPageRoute(builder: (context) => Screen()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "SignIn",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  check(){
    if((userEnabled==true)  &&  (passwordEnabled==true)  &&  (emailEnabled==true)){
      turnOpacity();
    }
    else
      return unTurnOpacity();
  }
  turnOpacity(){
    return Opacity(opacity: 1.0);
  }
  unTurnOpacity(){
    return Opacity(opacity: 0.2);
  }

   bool userEnabled=false;
  bool passwordEnabled=false;
  bool emailEnabled=false;
  var gender = ["Male", "Female", "Others"];
  var newSelected = "Male";
  String clickedName = '';
  String clickedPassword = '';
  String clickedEmail = '';
}
