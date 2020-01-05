// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$User extends User {
  @override
  final int id;
  @override
  final String name;
  @override
  final bool isActive;
  @override
  final BuiltList<Post> addresses;
  @override
  final Address address;
  @override
  final BuiltList<Role> roles;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.id,
      this.name,
      this.isActive,
      this.addresses,
      this.address,
      this.roles})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('User', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('User', 'name');
    }
    if (isActive == null) {
      throw new BuiltValueNullFieldError('User', 'isActive');
    }
    if (addresses == null) {
      throw new BuiltValueNullFieldError('User', 'addresses');
    }
    if (address == null) {
      throw new BuiltValueNullFieldError('User', 'address');
    }
    if (roles == null) {
      throw new BuiltValueNullFieldError('User', 'roles');
    }
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        name == other.name &&
        isActive == other.isActive &&
        addresses == other.addresses &&
        address == other.address &&
        roles == other.roles;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), name.hashCode), isActive.hashCode),
                addresses.hashCode),
            address.hashCode),
        roles.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('id', id)
          ..add('name', name)
          ..add('isActive', isActive)
          ..add('addresses', addresses)
          ..add('address', address)
          ..add('roles', roles))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _isActive;
  bool get isActive => _$this._isActive;
  set isActive(bool isActive) => _$this._isActive = isActive;

  ListBuilder<Post> _addresses;
  ListBuilder<Post> get addresses =>
      _$this._addresses ??= new ListBuilder<Post>();
  set addresses(ListBuilder<Post> addresses) => _$this._addresses = addresses;

  AddressBuilder _address;
  AddressBuilder get address => _$this._address ??= new AddressBuilder();
  set address(AddressBuilder address) => _$this._address = address;

  ListBuilder<Role> _roles;
  ListBuilder<Role> get roles => _$this._roles ??= new ListBuilder<Role>();
  set roles(ListBuilder<Role> roles) => _$this._roles = roles;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _isActive = _$v.isActive;
      _addresses = _$v.addresses?.toBuilder();
      _address = _$v.address?.toBuilder();
      _roles = _$v.roles?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              id: id,
              name: name,
              isActive: isActive,
              addresses: addresses.build(),
              address: address.build(),
              roles: roles.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'addresses';
        addresses.build();
        _$failedField = 'address';
        address.build();
        _$failedField = 'roles';
        roles.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
