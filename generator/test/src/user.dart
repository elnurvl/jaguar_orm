import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:jaguar_orm/jaguar_orm.dart';

import 'address.dart';
import 'pivot.dart';
import 'post.dart';
import 'role.dart';

part 'user.bv.dart';
part 'user.jorm.dart';

abstract class User implements Built<User, UserBuilder> {
  @primaryKey
  int get id;
  String get name;
  bool get isActive;
  // DateTime get registrated;

  @HasMany(PostBean)
  BuiltList<Post> get addresses;

  @HasOne(AddressBean)
  Address get address;

  @ManyToMany(PivotBean, RoleBean)
  BuiltList<Role> get roles;

  User._();

  factory User([void Function(UserBuilder) updates]) = _$User;
}

@GenBean()
class UserBean extends Bean<_$User> with _UserBean {
  final BeanRepo beanRepo;

  UserBean(Adapter adapter, this.beanRepo) : super(adapter);

  @override
  String get tableName => 'users';
}
