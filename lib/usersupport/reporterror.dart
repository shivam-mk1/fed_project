import 'package:fed/custom_drawer.dart';
import 'package:fed/drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Reporterror extends StatefulWidget {
  const Reporterror({super.key});

  @override
  State<Reporterror> createState() => _ReporterrorState();
}

class _ReporterrorState extends State<Reporterror> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<DrawerProvider>(context, listen: false)
          .setScreen('reporterror');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Report an Error'),
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
