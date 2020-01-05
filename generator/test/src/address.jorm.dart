// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _AddressBean implements Bean<_$Address> {
  final id = IntField('id');
  final streetName = StrField('street_name');
  final postalCode = StrField('postal_code');
  final userId = IntField('user_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        streetName.name: streetName,
        postalCode.name: postalCode,
        userId.name: userId,
      };
  _$Address fromMap(Map map) {
    Address model = Address((b) => b
      ..id = adapter.parseValue(map['id'])
      ..streetName = adapter.parseValue(map['street_name'])
      ..postalCode = adapter.parseValue(map['postal_code'])
      ..userId = adapter.parseValue(map['user_id']));

    return model;
  }

  List<SetColumn> toSetColumns(Address model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(streetName.set(model.streetName));
      ret.add(postalCode.set(model.postalCode));
      ret.add(userId.set(model.userId));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(streetName.name))
        ret.add(streetName.set(model.streetName));
      if (only.contains(postalCode.name))
        ret.add(postalCode.set(model.postalCode));
      if (only.contains(userId.name)) ret.add(userId.set(model.userId));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.streetName != null) {
        ret.add(streetName.set(model.streetName));
      }
      if (model.postalCode != null) {
        ret.add(postalCode.set(model.postalCode));
      }
      if (model.userId != null) {
        ret.add(userId.set(model.userId));
      }
    }

    return ret;
  }

  Future<void> createTable(
      {bool ifNotExists = false, Connection withConn}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addByType(
      id.name,
      Int(),
      isPrimary: true,
    );
    st.addByType(
      streetName.name,
      Str(),
    );
    st.addByType(
      postalCode.name,
      Str(),
    );
    st.addByType(
      userId.name,
      Int(),
      foreign: References(userBean.tableName, "id"),
    );
    return adapter.createTable(st, withConn: withConn);
  }

  Future<void> insert(Address model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only,
      Connection withConn}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert, withConn: withConn);
  }

  Future<void> insertMany(List<Address> models,
      {bool onlyNonNull = false, Set<String> only, Connection withConn}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = insertser.addAll(data);
    await adapter.insertMany(insert, withConn: withConn);
    return;
  }

  Future<void> upsert(Address model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      Connection withConn}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var id = await adapter.upsert(upsert, withConn: withConn);
    model.rebuild((u) => u..id = id);
    return id;
  }

  Future<void> upsertMany(List<Address> models,
      {bool onlyNonNull = false, Set<String> only, Connection withConn}) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
    }
    final UpsertMany upsert = upsertser.addAll(data);
    await adapter.upsertMany(upsert, withConn: withConn);
    return;
  }

  Future<int> update(Address model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false,
      Connection withConn}) async {
    final Update update = updater.where(this.id.eq(model.id)).setMany(
        toSetColumns(model,
            only: only, onlyNonNull: onlyNonNull, update: true));
    return adapter.update(update, withConn: withConn);
  }

  Future<void> updateMany(List<Address> models,
      {bool onlyNonNull = false, Set<String> only, Connection withConn}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(toSetColumns(model,
              only: only, onlyNonNull: onlyNonNull, update: true)
          .toList());
      where.add(this.id.eq(model.id));
    }
    final UpdateMany update = updateser.addAll(data, where);
    await adapter.updateMany(update, withConn: withConn);
    return;
  }

  Future<Address> find(int id,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find, withConn: withConn);
  }

  Future<int> remove(int id, {Connection withConn}) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove, withConn: withConn);
  }

  Future<int> removeMany(List<Address> models, {Connection withConn}) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove, withConn: withConn);
  }

  Future<Address> findByUser(int userId,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
    final Find find = finder.where(this.userId.eq(userId));
    return findOne(find, withConn: withConn);
  }

  Future<List<Address>> findByUserList(List<User> models,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (User model in models) {
      find.or(this.userId.eq(model.id));
    }
    return findMany(find, withConn: withConn);
  }

  Future<int> removeByUser(int userId, {Connection withConn}) async {
    final Remove rm = remover.where(this.userId.eq(userId));
    return await adapter.remove(rm, withConn: withConn);
  }

  void associateUser(Address child, User parent) {
    child = child.rebuild((c) => c..userId = parent.id);
  }

  Future<User> fetchUser(Address model, {Connection withConn}) async {
    return userBean.findOneWhere(userBean.id.eq(model.userId),
        withConn: withConn);
  }

  UserBean get userBean => beanRepo[UserBean];
  BeanRepo get beanRepo;
}
