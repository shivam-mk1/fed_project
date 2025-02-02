import 'package:fed/recr.dart';
import 'package:fed/studentbodies/comms.dart';
import 'package:fed/studentbodies/others.dart';
import 'package:fed/usersupport/deleteacc.dart';
import 'package:fed/usersupport/reporterror.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'drawer_provider.dart';
import 'home.dart';
import 'studentbodies/societies.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    Widget drawerButton(
        String title, String route, BuildContext context, Color color) {
      bool isActive = drawerProvider.currentScreen == route;
      return InkWell(
          onTap: isActive
              ? null
              : () {
                  drawerProvider.setScreen(route);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => getScreen(route)));
                },
          child: Container(
              height: screenHeight * 0.05,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.5),
                  color: isActive
                      ? Color(0xff098700).withAlpha(50)
                      : Color(0xff098700)),
              child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: isActive ? color.withAlpha(200) : color,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ))));
    }

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffE0E311), Color(0xff208539)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              screenWidth * 0.03, screenHeight * 0.04, screenWidth * 0.03, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close,
                          color: Colors.white, size: screenWidth * 0.08)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.logout,
                        color: Colors.red,
                        size: screenWidth * 0.08,
                      ))
                ],
              ),
              DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(radius: screenWidth * 0.09),
                    SizedBox(height: screenHeight * 0.005),
                    Text('2266_Shivam',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.065,
                            fontWeight: FontWeight.bold)),
                    Text('23052266@kiit.ac.in',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              drawerButton(
                  'Student Societies', 'societies', context, Colors.white),
              SizedBox(height: screenHeight * 0.015),
              drawerButton(
                  'Student Communities', 'comms', context, Colors.white),
              SizedBox(height: screenHeight * 0.015),
              drawerButton(
                  'Other Student Bodies', 'others', context, Colors.white),
              SizedBox(height: screenHeight * 0.015),
              Divider(color: Colors.white),
              SizedBox(height: screenHeight * 0.015),
              drawerButton('Upcoming Events', 'home', context, Colors.white),
              SizedBox(height: screenHeight * 0.015),
              drawerButton(
                  'Upcoming Recruitments', 'recr', context, Colors.white),
              SizedBox(height: screenHeight * 0.015),
              Divider(color: Colors.white),
              SizedBox(height: screenHeight * 0.015),
              drawerButton(
                  'Report an Error', 'reporterror', context, Colors.white),
              SizedBox(height: screenHeight * 0.015),
              drawerButton('Delete Account', 'deleteacc', context, Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  Widget getScreen(String route) {
    switch (route) {
      case 'societies':
        return Societies();
      case 'comms':
        return Comms();
      case 'others':
        return Others();
      case 'reporterror':
        return Reporterror();
      case 'deleteacc':
        return Deleteacc();
      case 'recr':
        return Recruitment();
      default:
        return Home();
    }
  }
}
