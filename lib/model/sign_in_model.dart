import 'package:hive/hive.dart';
part 'sign_in_model.g.dart';
@HiveType(typeId: 0)
class signInModel{
  @HiveField(0)
 final  String email;
  @HiveField(1)
  final String password;
  @HiveField(3)
  final String id;
   @HiveField(4)
  final String name;

 signInModel({required this.email,required  this.password,required this.id,required this.name});
}
