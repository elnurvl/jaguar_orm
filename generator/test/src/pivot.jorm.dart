// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pivot.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _PivotBean implements Bean<_$Pivot> {
  final id = IntField('id');
  final userId = IntField('user_id');
  final role = IntField('role');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        userId.name: userId,
        role.name: role,
      };
  _$Pivot fromMap(Map map) {
    Pivot model = Pivot((b) => b
      ..id = adapter.parseValue(map['id'])
      ..userId = adapter.parseValue(map['user_id'])
      ..role = adapter.parseValue(map['role']));

    return model;
  }

  List<SetColumn> toSetColumns(Pivot model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(userId.set(model.userId));
      ret.add(role.set(model.role));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(userId.name)) ret.add(userId.set(model.userId));
      if (only.contains(role.name)) ret.add(role.set(model.role));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.userId != null) {
        ret.add(userId.set(model.userId));
      }
      if (model.role != null) {
        ret.add(role.set(model.role));
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
      userId.name,
      Int(),
      foreign: References(userBean.tableName, "id"),
    );
    st.addByType(
      role.name,
      Int(),
      foreign: References(roleBean.tableName, "id"),
    );
    return adapter.createTable(st, withConn: withConn);
  }

  Future<void> insert(Pivot model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only,
      Connection withConn}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert, withConn: withConn);
  }

  Future<void> insertMany(List<Pivot> models,
      {bool onlyNonNull = false, Set<String> only, Connection withConn}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = insertser.addAll(data);
    await adapter.insertMany(insert, withConn: withConn);
    return;
  }

  Future<void> upsert(Pivot model,
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

  Future<void> upsertMany(List<Pivot> models,
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

  Future<int> update(Pivot model,
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

  Future<void> updateMany(List<Pivot> models,
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

  Future<Pivot> find(int id,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find, withConn: withConn);
  }

  Future<int> remove(int id, {Connection withConn}) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove, withConn: withConn);
  }

  Future<int> removeMany(List<Pivot> models, {Connection withConn}) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove, withConn: withConn);
  }

  Future<List<Pivot>> findByUser(int userId,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
    final Find find = finder.where(this.userId.eq(userId));
    return findMany(find, withConn: withConn);
  }

  Future<List<Pivot>> findByUserList(List<User> models,
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

  void associateUser(Pivot child, User parent) {
    child = child.rebuild((c) => c..userId = parent.id);
  }

  Future<int> detachUser(User model,
      {Connection withConn, bool removeOrphans = false}) async {
    int ret = 0;
    final dels = await findByUser(model.id, withConn: withConn);
    if (dels.isNotEmpty) {
      ret = await removeByUser(model.id, withConn: withConn);
      if (removeOrphans) {
        final exp = Or();
        for (final t in dels) {
          exp.or((roleBean.id.eq(t.role)) &
              ~exists(finder.sel(nil).where(role.eq(t.role))));
        }
        await roleBean.removeWhere(exp, withConn: withConn);
      }
    }
    return ret;
  }

  Future<List<Role>> fetchByUser(User model, {Connection withConn}) async {
    final pivots = await findByUser(model.id);
// Return if model has no pivots. If this is not done, all records will be removed!
    if (pivots.isEmpty) return [];

    final duplicates = <Tuple, int>{};

    final exp = Or();
    for (final t in pivots) {
      final tup = Tuple([t.role]);
      if (duplicates[tup] == null) {
        exp.or(roleBean.id.eq(t.role));
        duplicates[tup] = 1;
      } else {
        duplicates[tup] += 1;
      }
    }

    final returnList = await roleBean.findWhere(exp, withConn: withConn);

    if (duplicates.length != pivots.length) {
      for (Tuple tup in duplicates.keys) {
        int n = duplicates[tup] - 1;
        for (int i = 0; i < n; i++) {
          returnList.add(await roleBean.find(tup[0], withConn: withConn));
        }
      }
    }

    return returnList;
  }

  Future<List<Pivot>> findByRole(int role,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
    final Find find = finder.where(this.role.eq(role));
    return findMany(find, withConn: withConn);
  }

  Future<List<Pivot>> findByRoleList(List<Role> models,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Role model in models) {
      find.or(this.role.eq(model.id));
    }
    return findMany(find, withConn: withConn);
  }

  Future<int> removeByRole(int role, {Connection withConn}) async {
    final Remove rm = remover.where(this.role.eq(role));
    return await adapter.remove(rm, withConn: withConn);
  }

  void associateRole(Pivot child, Role parent) {
    child = child.rebuild((c) => c..role = parent.id);
  }

  Future<int> detachRole(Role model,
      {Connection withConn, bool removeOrphans = false}) async {
    int ret = 0;
    final dels = await findByRole(model.id, withConn: withConn);
    if (dels.isNotEmpty) {
      ret = await removeByRole(model.id, withConn: withConn);
      if (removeOrphans) {
        final exp = Or();
        for (final t in dels) {
          exp.or((userBean.id.eq(t.userId)) &
              ~exists(finder.sel(nil).where(userId.eq(t.userId))));
        }
        await userBean.removeWhere(exp, withConn: withConn);
      }
    }
    return ret;
  }

  Future<List<User>> fetchByRole(Role model, {Connection withConn}) async {
    final pivots = await findByRole(model.id);
// Return if model has no pivots. If this is not done, all records will be removed!
    if (pivots.isEmpty) return [];

    final duplicates = <Tuple, int>{};

    final exp = Or();
    for (final t in pivots) {
      final tup = Tuple([t.userId]);
      if (duplicates[tup] == null) {
        exp.or(userBean.id.eq(t.userId));
        duplicates[tup] = 1;
      } else {
        duplicates[tup] += 1;
      }
    }

    final returnList = await userBean.findWhere(exp, withConn: withConn);

    if (duplicates.length != pivots.length) {
      for (Tuple tup in duplicates.keys) {
        int n = duplicates[tup] - 1;
        for (int i = 0; i < n; i++) {
          returnList.add(await userBean.find(tup[0], withConn: withConn));
        }
      }
    }

    return returnList;
  }

  Future<dynamic> attach(User one, Role two,
      {bool upsert = false, Connection withConn}) async {
    final ret = Pivot();
    ret.rebuild((r) => r..userId = one.id);
    ret.rebuild((r) => r..role = two.id);
    if (!upsert) {
      return insert(ret, withConn: withConn);
    } else {
      return this.upsert(ret, withConn: withConn);
    }
  }

  UserBean get userBean => beanRepo[UserBean];
  RoleBean get roleBean => beanRepo[RoleBean];
  BeanRepo get beanRepo;
}
