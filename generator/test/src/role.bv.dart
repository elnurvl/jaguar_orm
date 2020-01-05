// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Role extends Role {
  @override
  final int id;
  @override
  final String description;
  @override
  final BuiltList<User> categories;

  factory _$Role([void Function(RoleBuilder) updates]) =>
      (new RoleBuilder()..update(updates)).build();

  _$Role._({this.id, this.description, this.categories}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Role', 'id');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('Role', 'description');
    }
    if (categories == null) {
      throw new BuiltValueNullFieldError('Role', 'categories');
    }
  }

  @override
  Role rebuild(void Function(RoleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoleBuilder toBuilder() => new RoleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Role &&
        id == other.id &&
        description == other.description &&
        categories == other.categories;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, id.hashCode), description.hashCode), categories.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Role')
          ..add('id', id)
          ..add('description', description)
          ..add('categories', categories))
        .toString();
  }
}

class RoleBuilder implements Builder<Role, RoleBuilder> {
  _$Role _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ListBuilder<User> _categories;
  ListBuilder<User> get categories =>
      _$this._categories ??= new ListBuilder<User>();
  set categories(ListBuilder<User> categories) =>
      _$this._categories = categories;

  RoleBuilder();

  RoleBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _description = _$v.description;
      _categories = _$v.categories?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Role other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Role;
  }

  @override
  void update(void Function(RoleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Role build() {
    _$Role _$result;
    try {
      _$result = _$v ??
          new _$Role._(
              id: id, description: description, categories: categories.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'categories';
        categories.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Role', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
