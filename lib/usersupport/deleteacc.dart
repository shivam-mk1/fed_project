import 'package:fed/custom_drawer.dart';
import 'package:fed/drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Deleteacc extends StatefulWidget {
  const Deleteacc({super.key});

  @override
  State<Deleteacc> createState() => _DeleteaccState();
}

class _DeleteaccState extends State<Deleteacc> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<DrawerProvider>(context, listen: false)
          .setScreen('deleteacc');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Delete Account'),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontFamily: 'Josefin',
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w900),
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffE0E311), Color(0xff208539)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
