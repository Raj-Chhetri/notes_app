import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/modules/notes/views/home_page.dart';

class SpalshPage extends StatefulWidget {
  const SpalshPage({super.key});

  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), (){
      Get.off(() => HomePage());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Notes"),
      ),
    );
  }
}