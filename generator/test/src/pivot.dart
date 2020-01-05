import 'package:built_value/built_value.dart';
import 'package:jaguar_orm/jaguar_orm.dart';

import 'role.dart';
import 'user.dart';

part 'pivot.bv.dart';
part 'pivot.jorm.dart';

abstract class Pivot implements Built<Pivot, PivotBuilder> {
  @primaryKey
  int get id;

  @BelongsTo.many(UserBean, references: 'id')
  int get userId;

  @BelongsTo.many(RoleBean, references: 'id')
  int get role;

  Pivot._();

  factory Pivot([void Function(PivotBuilder) updates]) = _$Pivot;
}

@GenBean()
class PivotBean extends Bean<_$Pivot> with _PivotBean {
  BeanRepo beanRepo;

  PivotBean(Adapter adapter, this.beanRepo) : super(adapter);

  @override
  String get tableName => 'pivot';
}