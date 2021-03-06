import 'dart:async';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_orm/src/annotations/column.dart';

part 'simple.jorm.dart';

class User {
  @Column(notNull: true, isPrimary: true)
  @auto
  int id;

  String name;

  int age;

  User({this.id, this.name, this.age});

  bool operator ==(final other) {
    if (other is User)
      return id == other.id && name == other.name && age == other.age;
    return false;
  }

  @override
  int get hashCode => super.hashCode;

  String toString() => "User($id, $name, $age)";
}

/// Bean logic is generated by Jaguar ORM
@GenBean()
class UserBean extends Bean<User> with _UserBean {
  UserBean(Adapter adapter) : super(adapter);

  String get tableName => 'simple_user';
}
