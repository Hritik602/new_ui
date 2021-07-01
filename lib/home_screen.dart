import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main ()=>runApp(MaterialApp(
debugShowCheckedModeBanner: false,
home: Screen(),
));

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Welcome to this '),


      ),
      drawer: Drawer(
        child:Container(


          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50,left: 10),
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.purpleAccent.shade400, Colors.purpleAccent.shade400])
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/Wallpaper4.jpg.jpg"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Name",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("something@mail.com",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.normal
                      ),
                    )
                  ],
                ),
              ),

            Container(
              width: MediaQuery.of(context).size.width,
                height: 420,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.purpleAccent.shade400, Colors.purpleAccent.shade100])
            ),
              child: Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap:() async {
                        await Future.delayed(Duration(seconds:5));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Screen()));
                      },
                      child: list("Home",
                      Icon(CupertinoIcons.home,
                      size: 30,
                        color: Colors.black,
                      )
                      ),
                      splashColor: Colors.white,
                    ),
                  ),
                  list("Profile",
                      Icon(CupertinoIcons.profile_circled,
                        size: 30,
                        color: Colors.black,
                      )
                  ),
                  list("Notification",
                      Icon(CupertinoIcons.bell,
                        size: 30,
                        color: Colors.black,
                      )
                  ),
                ],
              ),
            )

            ],
          ),
        ) ,

      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.purple, Colors.blue])
        ),
      ),
    );
  }

  Widget  list(String name,Widget icon){
   return   ListTile(
      leading: icon,
      title: Text(name,
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,

        ),
      )
      );
  }
}
