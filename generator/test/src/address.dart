import 'package:built_value/built_value.dart';
import 'package:jaguar_orm/jaguar_orm.dart';

import 'user.dart';

part 'address.bv.dart';
part 'address.jorm.dart';

abstract class Address implements Built<Address, AddressBuilder> {
  @primaryKey
  int get id;
  String get streetName;
  String get postalCode;
  @BelongsTo(UserBean, references: 'id')
  int get userId;

  Address._();

  factory Address([void Function(AddressBuilder) updates]) = _$Address;
}

@GenBean()
class AddressBean extends Bean<_$Address> with _AddressBean {
  final BeanRepo beanRepo;

  AddressBean(Adapter adapter, this.beanRepo) : super(adapter);

  @override
  String get tableName => 'addresses';
}
