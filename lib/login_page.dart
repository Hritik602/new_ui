import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Sign_Up.dart';
import 'forget_password.dart';
import 'home_screen.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey=GlobalKey<FormState>();
  String name="";

  moveHome(BuildContext context) async{
    if(_formKey.currentState.validate()){
      await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Screen()));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Stack(
          children:[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Wallpaper3.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black26,
                    BlendMode.darken,
                  ),
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[600].withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              // ignore: missing_return
                              validator: (value){
                                if(value.isEmpty){
                                  // ignore: missing_return
                                  return "Username cannot be empty";
                                }
                                return null;
                              },

                              decoration: InputDecoration(
                                contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: "Email or Phone number ",
                                prefixIcon: Icon(
                                  Icons.email,
                                  size: 20,
                                  color: Colors.white70,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[600].withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              onChanged: (value){
                                name =value;
                              },
                              // ignore: missing_return
                              validator: (value){
                                if(value.isEmpty){
                                  // ignore: missing_return
                                  return "Password cannot be empty";
                                }
                                else if(value.length<6){
                                  return "Password be more than 6";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: "Password",
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Forget()));
                              },
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            alignment: Alignment.bottomRight,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, 1),
                                  ])),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                // ignore: deprecated_member_use
                                child: FlatButton(
                                  onPressed: ()=>moveHome(context),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, 1),
                                  ])),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                // ignore: deprecated_member_use
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => SignUp()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: Text(
                                      "SignUp",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]
      ),

    );
  }
}