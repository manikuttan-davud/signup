
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/page/welcome.dart';
import 'package:get/get.dart';
import 'dart:html';

class signupPage extends StatelessWidget {
  const signupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final userNameTextEditingController = TextEditingController();

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(children: [
      Container(
        width: w,
        height: h * 0.3,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/loginimage.png'),
                fit: BoxFit.cover)),
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: userNameTextEditingController,
          decoration: InputDecoration(
              hintText: 'User Name',
              prefixIcon: Icon(Icons.verified_user),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue, width: 20),
                  borderRadius: BorderRadius.circular(30))),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: emailTextEditingController,
          decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue, width: 20),
                  borderRadius: BorderRadius.circular(30))),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: passwordTextEditingController,
          obscureText: true,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.password),
              hintText: 'Password',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue, width: 20),
                  borderRadius: BorderRadius.circular(30))),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
          child: Column(children: [
        SizedBox(
          width: 150,
          height: 50,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {
             {
             Get.toNamed('/welcome', arguments: welcomePage());
                }
              },
              child: Text(
                'sign up',
                style: TextStyle(fontSize: 12),
              )),
        ),
      ]))
    ]));
  }
}
