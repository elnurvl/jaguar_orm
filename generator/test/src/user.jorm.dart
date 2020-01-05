// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _UserBean implements Bean<_$User> {
  final id = IntField('id');
  final name = StrField('name');
  final isActive = BoolField('is_active');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        name.name: name,
        isActive.name: isActive,
      };
  _$User fromMap(Map map) {
    User model = User((b) => b
      ..id = adapter.parseValue(map['id'])
      ..name = adapter.parseValue(map['name'])
      ..isActive = adapter.parseValue(map['is_active']));

    return model;
  }

  List<SetColumn> toSetColumns(User model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(name.set(model.name));
      ret.add(isActive.set(model.isActive));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(name.name)) ret.add(name.set(model.name));
      if (only.contains(isActive.name)) ret.add(isActive.set(model.isActive));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
      if (model.isActive != null) {
        ret.add(isActive.set(model.isActive));
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
      name.name,
      Str(),
    );
    st.addByType(
      isActive.name,
      Bool(),
    );
    return adapter.createTable(st, withConn: withConn);
  }

  Future<dynamic> insert(User model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only,
      Connection withConn}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert, withConn: withConn);
    if (cascade) {
      User newModel;
      if (model.addresses != null) {
        newModel ??= await find(model.id, withConn: withConn);
        model.addresses.forEach((x) => postBean.associateUser(x, newModel));
        for (final child in model.addresses) {
          await postBean.insert(child, cascade: cascade);
        }
      }
      if (model.address != null) {
        newModel ??= await find(model.id, withConn: withConn);
        addressBean.associateUser(model.address, newModel);
        await addressBean.insert(model.address,
            cascade: cascade, withConn: withConn);
      }
      if (model.roles != null) {
        newModel ??= await find(model.id, withConn: withConn);
        for (final child in model.roles) {
          await roleBean.insert(child, cascade: cascade, withConn: withConn);
          await pivotBean.attach(newModel, child);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<User> models,
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

  Future<dynamic> upsert(User model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      Connection withConn}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert, withConn: withConn);
    if (cascade) {
      User newModel;
      if (model.addresses != null) {
        newModel ??= await find(model.id, withConn: withConn);
        model.addresses.forEach((x) => postBean.associateUser(x, newModel));
        for (final child in model.addresses) {
          await postBean.upsert(child, cascade: cascade, withConn: withConn);
        }
      }
      if (model.address != null) {
        newModel ??= await find(model.id, withConn: withConn);
        addressBean.associateUser(model.address, newModel);
        await addressBean.upsert(model.address,
            cascade: cascade, withConn: withConn);
      }
      if (model.roles != null) {
        newModel ??= await find(model.id, withConn: withConn);
        for (final child in model.roles) {
          await roleBean.upsert(child, cascade: cascade, withConn: withConn);
          await pivotBean.attach(newModel, child,
              upsert: true, withConn: withConn);
        }
      }
    }
    model.rebuild((u) => u..id = retId);
    return retId;
  }

  Future<void> upsertMany(List<User> models,
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

  Future<int> update(User model,
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
      User newModel;
      if (model.addresses != null) {
        if (associate) {
          newModel ??= await find(model.id, withConn: withConn);
          model.addresses.forEach((x) => postBean.associateUser(x, newModel));
        }
        for (final child in model.addresses) {
          await postBean.update(child,
              cascade: cascade, associate: associate, withConn: withConn);
        }
      }
      if (model.address != null) {
        if (associate) {
          newModel ??= await find(model.id, withConn: withConn);
          addressBean.associateUser(model.address, newModel);
        }
        await addressBean.update(model.address,
            cascade: cascade, associate: associate, withConn: withConn);
      }
      if (model.roles != null) {
        for (final child in model.roles) {
          await roleBean.update(child,
              cascade: cascade, associate: associate, withConn: withConn);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<User> models,
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

  Future<User> find(int id,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
    final Find find = finder.where(this.id.eq(id));
    final User model = await findOne(find, withConn: withConn);
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
      final User newModel = await find(id, withConn: withConn);
      if (newModel != null) {
        await postBean.removeByUser(newModel.id, withConn: withConn);
        await addressBean.removeByUser(newModel.id, withConn: withConn);
        await pivotBean.detachUser(newModel,
            withConn: withConn, removeOrphans: removeOrphans);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove, withConn: withConn);
  }

  Future<int> removeMany(List<User> models, {Connection withConn}) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove, withConn: withConn);
  }

  Future<User> preload(User model,
      {bool cascade = false, Connection withConn}) async {
    var addresses = await postBean.findByUser(model.id,
        preload: cascade, cascade: cascade, withConn: withConn);
    model = model.rebuild(
        (m) => m..addresses = BuiltList<Post>.from(addresses).toBuilder());
    var address = await addressBean.findByUser(model.id,
        preload: cascade, cascade: cascade, withConn: withConn);
    model = model.rebuild((m) => m..address = address.toBuilder());
    var roles = await pivotBean.fetchByUser(model, withConn: withConn);
    model = model
        .rebuild((m) => m..roles = BuiltList<Role>.from(roles).toBuilder());
    return model;
  }

  Future<List<User>> preloadAll(List<User> models,
      {bool cascade = false, Connection withConn}) async {
    models.forEach((User model) => model = model
        .rebuild((m) => m..addresses ??= BuiltList<Post>.from([]).toBuilder()));
    await OneToXHelper.preloadAll<User, Post>(
        models,
        (User model) => [model.id],
        postBean.findByUserList,
        (Post model) => [model.userId],
        (User model, Post child) => model = model.rebuild((m) => m
          ..addresses =
              BuiltList<Post>.from(List.from(model.addresses)..add(child))
                  .toBuilder()),
        cascade: cascade,
        withConn: withConn);
    await OneToXHelper.preloadAll<User, Address>(
        models,
        (User model) => [model.id],
        addressBean.findByUserList,
        (Address model) => [model.userId],
        (User model, Address child) =>
            model = model.rebuild((m) => m..address = child.toBuilder()),
        cascade: cascade,
        withConn: withConn);
    for (User model in models) {
      var temp = await pivotBean.fetchByUser(model, withConn: withConn);
      if (model.roles == null)
        model = model
            .rebuild((m) => m..roles = BuiltList<Role>.from(temp).toBuilder());
      else {
        model = model.rebuild((m) => m..roles.clear());
        model =
            model.rebuild((m) => m..roles.addAll(BuiltList<Role>.from(temp)));
      }
    }
    return models;
  }

  PostBean get postBean => beanRepo[PostBean];
  AddressBean get addressBean => beanRepo[AddressBean];
  PivotBean get pivotBean => beanRepo[PivotBean];

  RoleBean get roleBean => beanRepo[RoleBean];
  BeanRepo get beanRepo;
}
