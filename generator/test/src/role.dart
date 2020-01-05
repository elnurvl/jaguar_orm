import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:jaguar_orm/jaguar_orm.dart';

import 'pivot.dart';
import 'user.dart';

part 'role.bv.dart';
part 'role.jorm.dart';

abstract class Role implements Built<Role, RoleBuilder> {
  @primaryKey
  int get id;

  String get description;

  @ManyToMany(PivotBean, UserBean)
  BuiltList<User> get categories;

  Role._();

  factory Role([void Function(RoleBuilder) updates]) = _$Role;
}

@GenBean()
class RoleBean extends Bean<_$Role> with _RoleBean {
  final BeanRepo beanRepo;

  RoleBean(Adapter adapter, this.beanRepo) : super(adapter);

  String get tableName => 'mtm_simple_todolist';
}