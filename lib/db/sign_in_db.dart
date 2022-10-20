import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/sign_in_model.dart';
import 'package:hive/hive.dart';

const signInDBName='sign-database';
ValueNotifier<List<signInModel>>signInListNotifier=ValueNotifier([]);

abstract class signInFunction{
  Future<void>InsertsignIn(signInModel value);
   Future<List<signInModel>>sigInview();
  Future<void> deleteCategories(String categoryID);
}
class signInDb implements signInFunction{
 signInDb._internal();
 static signInDb instance=signInDb._internal();
 factory signInDb(){
  return instance;
 }
  @override
  Future<void> InsertsignIn(signInModel value) async{
   final DB= await Hive.openBox<signInModel>(signInDBName);
   DB.put(value.id, value);
   refreshUI();
  }
   Future<void>refreshUI() async{
final List=await sigInview();
signInListNotifier.value.clear();
signInListNotifier.value.addAll(List);
signInListNotifier.notifyListeners();

}

  @override
  Future<void> deleteCategories(String categoryID) async{
     final DB= await Hive.openBox<signInModel>(signInDBName);
       await DB.delete(categoryID);
  }
  
  @override
  Future<List<signInModel>> sigInview() async {
    final DB= await Hive.openBox<signInModel>(signInDBName);
    return DB.values.toList();
  
  }
  
 

}