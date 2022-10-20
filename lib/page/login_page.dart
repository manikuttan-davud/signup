import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/db/sign_in_db.dart';
import 'package:food_delivery_app/model/sign_in_model.dart';
import 'package:food_delivery_app/page/welcome.dart';
import 'package:get/get.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final userNameTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/loginimage.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Hello',
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Sign into your account',
                    style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                            borderSide:
                                BorderSide(color: Colors.lightBlue, width: 20),
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
                            borderSide:
                                BorderSide(color: Colors.lightBlue, width: 20),
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 300),
                  child: Text(
                    'Forgot your password ?',
                    style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      onPressed: () {
                        sigIn();
                      },
                      child: Text(
                        'sign in',
                        style: TextStyle(fontSize: 12),
                      )),
                ),
                
                
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> sigIn() async {
    final emailText = emailTextEditingController.text;
    final passwordText = passwordTextEditingController.text;
    final nameText=userNameTextEditingController.text;
    if (emailText.isEmpty) {
      return;
    }
    else if (passwordText.isEmpty) {
      return;
    } 
    final model = signInModel(email: emailText, password: passwordText,name:nameText ,id: DateTime.now().millisecondsSinceEpoch.toString());
    await signInDb.instance.InsertsignIn(model);
    Get.toNamed('/welcome', arguments: welcomePage());
  }
}
