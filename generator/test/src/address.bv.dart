// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Address extends Address {
  @override
  final int id;
  @override
  final String streetName;
  @override
  final String postalCode;
  @override
  final int userId;

  factory _$Address([void Function(AddressBuilder) updates]) =>
      (new AddressBuilder()..update(updates)).build();

  _$Address._({this.id, this.streetName, this.postalCode, this.userId})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Address', 'id');
    }
    if (streetName == null) {
      throw new BuiltValueNullFieldError('Address', 'streetName');
    }
    if (postalCode == null) {
      throw new BuiltValueNullFieldError('Address', 'postalCode');
    }
    if (userId == null) {
      throw new BuiltValueNullFieldError('Address', 'userId');
    }
  }

  @override
  Address rebuild(void Function(AddressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressBuilder toBuilder() => new AddressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Address &&
        id == other.id &&
        streetName == other.streetName &&
        postalCode == other.postalCode &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), streetName.hashCode), postalCode.hashCode),
        userId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Address')
          ..add('id', id)
          ..add('streetName', streetName)
          ..add('postalCode', postalCode)
          ..add('userId', userId))
        .toString();
  }
}

class AddressBuilder implements Builder<Address, AddressBuilder> {
  _$Address _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _streetName;
  String get streetName => _$this._streetName;
  set streetName(String streetName) => _$this._streetName = streetName;

  String _postalCode;
  String get postalCode => _$this._postalCode;
  set postalCode(String postalCode) => _$this._postalCode = postalCode;

  int _userId;
  int get userId => _$this._userId;
  set userId(int userId) => _$this._userId = userId;

  AddressBuilder();

  AddressBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _streetName = _$v.streetName;
      _postalCode = _$v.postalCode;
      _userId = _$v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Address other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Address;
  }

  @override
  void update(void Function(AddressBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Address build() {
    final _$result = _$v ??
        new _$Address._(
            id: id,
            streetName: streetName,
            postalCode: postalCode,
            userId: userId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
