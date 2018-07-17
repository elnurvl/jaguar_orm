import 'dart:async';
import 'package:jaguar_orm/jaguar_orm.dart';

part 'simple.jorm.dart';

class User {
  @PrimaryKey()
  String id;

  String name;

  int age;

  User({this.id, this.name, this.age});

  bool operator ==(final other) {
    if (other is User)
      return id == other.id && name == other.name && age == other.age;
    return false;
  }

  String toString() => "User($id, $name)";
}

/// Bean logic is generated by Jaguar ORM
@GenBean()
class UserBean extends Bean<User> with _UserBean {
  UserBean(Adapter adapter) : super(adapter);

  String get tableName => 'simple_user';
}
