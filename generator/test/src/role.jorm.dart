// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _RoleBean implements Bean<_$Role> {
  final id = IntField('id');
  final description = StrField('description');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        description.name: description,
      };
  _$Role fromMap(Map map) {
    Role model = Role((b) => b
      ..id = adapter.parseValue(map['id'])
      ..description = adapter.parseValue(map['description']));

    return model;
  }

  List<SetColumn> toSetColumns(Role model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(description.set(model.description));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(description.name))
        ret.add(description.set(model.description));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.description != null) {
        ret.add(description.set(model.description));
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
      description.name,
      Str(),
    );
    return adapter.createTable(st, withConn: withConn);
  }

  Future<dynamic> insert(Role model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only,
      Connection withConn}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert, withConn: withConn);
    if (cascade) {
      Role newModel;
      if (model.categories != null) {
        newModel ??= await find(model.id, withConn: withConn);
        for (final child in model.categories) {
          await userBean.insert(child, cascade: cascade, withConn: withConn);
          await pivotBean.attach(child, newModel, withConn: withConn);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Role> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only,
      Connection withConn}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(insert(model, cascade: cascade, withConn: withConn));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = models
          .map((model) =>
              toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
          .toList();
      final InsertMany insert = insertser.addAll(data);
      await adapter.insertMany(insert, withConn: withConn);
      return;
    }
  }

  Future<dynamic> upsert(Role model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      Connection withConn}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert, withConn: withConn);
    if (cascade) {
      Role newModel;
      if (model.categories != null) {
        newModel ??= await find(model.id, withConn: withConn);
        for (final child in model.categories) {
          await userBean.upsert(child, cascade: cascade, withConn: withConn);
          await pivotBean.attach(child, newModel,
              upsert: true, withConn: withConn);
        }
      }
    }
    model.rebuild((u) => u..id = retId);
    return retId;
  }

  Future<void> upsertMany(List<Role> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only,
      Connection withConn}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(upsert(model, cascade: cascade, withConn: withConn));
      }
      await Future.wait(futures);
      return;
    } else {
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
  }

  Future<int> update(Role model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false,
      Connection withConn}) async {
    final Update update = updater.where(this.id.eq(model.id)).setMany(
        toSetColumns(model,
            only: only, onlyNonNull: onlyNonNull, update: true));
    final ret = adapter.update(update, withConn: withConn);
    if (cascade) {
      Role newModel;
      if (model.categories != null) {
        for (final child in model.categories) {
          await userBean.update(child,
              cascade: cascade, associate: associate, withConn: withConn);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Role> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only,
      Connection withConn}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(update(model, cascade: cascade, withConn: withConn));
      }
      await Future.wait(futures);
      return;
    } else {
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
  }

  Future<Role> find(int id,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
    final Find find = finder.where(this.id.eq(id));
    final Role model = await findOne(find, withConn: withConn);
    if (preload && model != null) {
      return await this.preload(model, cascade: cascade, withConn: withConn);
    }
    return model;
  }

  Future<int> remove(int id,
      {bool cascade = false,
      Connection withConn,
      bool removeOrphans = false}) async {
    if (cascade) {
      final Role newModel = await find(id, withConn: withConn);
      if (newModel != null) {
        await pivotBean.detachRole(newModel,
            withConn: withConn, removeOrphans: removeOrphans);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove, withConn: withConn);
  }

  Future<int> removeMany(List<Role> models, {Connection withConn}) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove, withConn: withConn);
  }

  Future<Role> preload(Role model,
      {bool cascade = false, Connection withConn}) async {
    var categories = await pivotBean.fetchByRole(model, withConn: withConn);
    model = model.rebuild(
        (m) => m..categories = BuiltList<User>.from(categories).toBuilder());
    return model;
  }

  Future<List<Role>> preloadAll(List<Role> models,
      {bool cascade = false, Connection withConn}) async {
    for (Role model in models) {
      var temp = await pivotBean.fetchByRole(model, withConn: withConn);
      if (model.categories == null)
        model = model.rebuild(
            (m) => m..categories = BuiltList<User>.from(temp).toBuilder());
      else {
        model = model.rebuild((m) => m..categories.clear());
        model = model
            .rebuild((m) => m..categories.addAll(BuiltList<User>.from(temp)));
      }
    }
    return models;
  }

  PivotBean get pivotBean => beanRepo[PivotBean];

  UserBean get userBean => beanRepo[UserBean];
  BeanRepo get beanRepo;
}
