// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pivot.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Pivot extends Pivot {
  @override
  final int id;
  @override
  final int userId;
  @override
  final int role;

  factory _$Pivot([void Function(PivotBuilder) updates]) =>
      (new PivotBuilder()..update(updates)).build();

  _$Pivot._({this.id, this.userId, this.role}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Pivot', 'id');
    }
    if (userId == null) {
      throw new BuiltValueNullFieldError('Pivot', 'userId');
    }
    if (role == null) {
      throw new BuiltValueNullFieldError('Pivot', 'role');
    }
  }

  @override
  Pivot rebuild(void Function(PivotBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PivotBuilder toBuilder() => new PivotBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pivot &&
        id == other.id &&
        userId == other.userId &&
        role == other.role;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), userId.hashCode), role.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Pivot')
          ..add('id', id)
          ..add('userId', userId)
          ..add('role', role))
        .toString();
  }
}

class PivotBuilder implements Builder<Pivot, PivotBuilder> {
  _$Pivot _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _userId;
  int get userId => _$this._userId;
  set userId(int userId) => _$this._userId = userId;

  int _role;
  int get role => _$this._role;
  set role(int role) => _$this._role = role;

  PivotBuilder();

  PivotBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _userId = _$v.userId;
      _role = _$v.role;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Pivot other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Pivot;
  }

  @override
  void update(void Function(PivotBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Pivot build() {
    final _$result = _$v ?? new _$Pivot._(id: id, userId: userId, role: role);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
