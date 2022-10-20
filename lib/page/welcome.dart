import 'package:flutter/material.dart';
import 'package:food_delivery_app/db/sign_in_db.dart';
import 'package:food_delivery_app/model/sign_in_model.dart';
import 'package:food_delivery_app/page/login_page.dart';
import 'package:get/get.dart';

class welcomePage extends StatelessWidget {
  const welcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ValueListenableBuilder(valueListenable:signInListNotifier,
     builder: (BuildContext context, List<signInModel>newList, Widget?_){
      return Card(
         child: ListView.separated(itemBuilder:((context, index) {
          final category=newList[index];
           return  ListTile(
              title: Text(category.name),
              subtitle: Text(category.email),
               leading:const Text('Welcome',
               style: TextStyle(
                fontWeight: FontWeight.bold
               ),
               ),
              trailing:  ElevatedButton.icon(onPressed: (){
                signInDb.instance.deleteCategories(category.id);
                Get.toNamed('/login', arguments: loginPage());
              }, icon: Icon(Icons.logout_outlined,),
              label: Text('Logout'),
              ),
             );
          }), 
          separatorBuilder:( context,  index) {
          return  Divider();
          }, 
          itemCount: newList.length),
       );
     }),
     
 
    );

    
  }
}
     