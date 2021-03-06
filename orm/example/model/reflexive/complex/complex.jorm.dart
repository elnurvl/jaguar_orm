// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _ProductItemsBean implements Bean<ProductItems> {
  final id = StrField('id');
  final name = StrField('name');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        name.name: name,
      };
  ProductItems fromMap(Map map) {
    ProductItems model = ProductItems();
    model.id = adapter.parseValue(map['id']);
    model.name = adapter.parseValue(map['name']);

    return model;
  }

  List<SetColumn> toSetColumns(ProductItems model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(name.set(model.name));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(name.name)) ret.add(name.set(model.name));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
    }

    return ret;
  }

  Future<void> createTable(
      {bool ifNotExists = false, Connection withConn}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addByType(
      id.name,
      Str(),
      isPrimary: true,
    );
    st.addByType(
      name.name,
      Str(),
      notNull: true,
    );
    return adapter.createTable(st, withConn: withConn);
  }

  Future<dynamic> insert(ProductItems model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only,
      Connection withConn}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert, withConn: withConn);
    if (cascade) {
      ProductItems newModel;
      if (model.items != null) {
        newModel ??= await find(model.id, withConn: withConn);
        for (final child in model.items) {
          await productBean.insert(child, cascade: cascade, withConn: withConn);
          await productItemsPivotBean.attach(newModel, child);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<ProductItems> models,
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

  Future<dynamic> upsert(ProductItems model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      Connection withConn}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert, withConn: withConn);
    if (cascade) {
      ProductItems newModel;
      if (model.items != null) {
        newModel ??= await find(model.id, withConn: withConn);
        for (final child in model.items) {
          await productBean.upsert(child, cascade: cascade, withConn: withConn);
          await productItemsPivotBean.attach(newModel, child,
              upsert: true, withConn: withConn);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<ProductItems> models,
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

  Future<int> update(ProductItems model,
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
      ProductItems newModel;
      if (model.items != null) {
        for (final child in model.items) {
          await productBean.update(child,
              cascade: cascade, associate: associate, withConn: withConn);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<ProductItems> models,
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

  Future<ProductItems> find(String id,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
    final Find find = finder.where(this.id.eq(id));
    final ProductItems model = await findOne(find, withConn: withConn);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade, withConn: withConn);
    }
    return model;
  }

  Future<int> remove(String id,
      {bool cascade = false,
      Connection withConn,
      bool removeOrphans = false}) async {
    if (cascade) {
      final ProductItems newModel = await find(id, withConn: withConn);
      if (newModel != null) {
        await productItemsPivotBean.detachProductItems(newModel,
            withConn: withConn, removeOrphans: removeOrphans);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove, withConn: withConn);
  }

  Future<int> removeMany(List<ProductItems> models,
      {Connection withConn}) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove, withConn: withConn);
  }

  Future<ProductItems> preload(ProductItems model,
      {bool cascade = false, Connection withConn}) async {
    model.items = await productItemsPivotBean.fetchByProductItems(model,
        withConn: withConn);
    return model;
  }

  Future<List<ProductItems>> preloadAll(List<ProductItems> models,
      {bool cascade = false, Connection withConn}) async {
    for (ProductItems model in models) {
      var temp = await productItemsPivotBean.fetchByProductItems(model,
          withConn: withConn);
      if (model.items == null)
        model.items = temp;
      else {
        model.items.clear();
        model.items.addAll(temp);
      }
    }
    return models;
  }

  ProductItemsPivotBean get productItemsPivotBean =>
      beanRepo[ProductItemsPivotBean];

  ProductBean get productBean => beanRepo[ProductBean];
  BeanRepo get beanRepo;
}

abstract class _ProductItemsPivotBean implements Bean<ProductItemsPivot> {
  final productId = StrField('product_id');
  final productListId = StrField('product_list_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        productId.name: productId,
        productListId.name: productListId,
      };
  ProductItemsPivot fromMap(Map map) {
    ProductItemsPivot model = ProductItemsPivot();
    model.productId = adapter.parseValue(map['product_id']);
    model.productListId = adapter.parseValue(map['product_list_id']);

    return model;
  }

  List<SetColumn> toSetColumns(ProductItemsPivot model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(productId.set(model.productId));
      ret.add(productListId.set(model.productListId));
    } else if (only != null) {
      if (only.contains(productId.name))
        ret.add(productId.set(model.productId));
      if (only.contains(productListId.name))
        ret.add(productListId.set(model.productListId));
    } else /* if (onlyNonNull) */ {
      if (model.productId != null) {
        ret.add(productId.set(model.productId));
      }
      if (model.productListId != null) {
        ret.add(productListId.set(model.productListId));
      }
    }

    return ret;
  }

  Future<void> createTable(
      {bool ifNotExists = false, Connection withConn}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addByType(
      productId.name,
      Str(),
      foreign: References(productBean.tableName, "id"),
    );
    st.addByType(
      productListId.name,
      Str(),
      foreign: References(productItemsBean.tableName, "id"),
    );
    return adapter.createTable(st, withConn: withConn);
  }

  Future<void> insert(ProductItemsPivot model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only,
      Connection withConn}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert, withConn: withConn);
  }

  Future<void> insertMany(List<ProductItemsPivot> models,
      {bool onlyNonNull = false, Set<String> only, Connection withConn}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = insertser.addAll(data);
    await adapter.insertMany(insert, withConn: withConn);
    return;
  }

  Future<void> upsert(ProductItemsPivot model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      Connection withConn}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert, withConn: withConn);
  }

  Future<void> upsertMany(List<ProductItemsPivot> models,
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

  Future<void> updateMany(List<ProductItemsPivot> models,
      {bool onlyNonNull = false, Set<String> only, Connection withConn}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(toSetColumns(model,
              only: only, onlyNonNull: onlyNonNull, update: true)
          .toList());
      where.add(null);
    }
    final UpdateMany update = updateser.addAll(data, where);
    await adapter.updateMany(update, withConn: withConn);
    return;
  }

  Future<List<ProductItemsPivot>> findByProduct(String productId,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
    final Find find = finder.where(this.productId.eq(productId));
    return findMany(find, withConn: withConn);
  }

  Future<List<ProductItemsPivot>> findByProductList(List<Product> models,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Product model in models) {
      find.or(this.productId.eq(model.id));
    }
    return findMany(find, withConn: withConn);
  }

  Future<int> removeByProduct(String productId, {Connection withConn}) async {
    final Remove rm = remover.where(this.productId.eq(productId));
    return await adapter.remove(rm, withConn: withConn);
  }

  void associateProduct(ProductItemsPivot child, Product parent) {
    child.productId = parent.id;
  }

  Future<int> detachProduct(Product model,
      {Connection withConn, bool removeOrphans = false}) async {
    int ret = 0;
    final dels = await findByProduct(model.id, withConn: withConn);
    if (dels.isNotEmpty) {
      ret = await removeByProduct(model.id, withConn: withConn);
      if (removeOrphans) {
        final exp = Or();
        for (final t in dels) {
          exp.or((productItemsBean.id.eq(t.productListId)) &
              ~exists(
                  finder.sel(nil).where(productListId.eq(t.productListId))));
        }
        await productItemsBean.removeWhere(exp, withConn: withConn);
      }
    }
    return ret;
  }

  Future<List<ProductItems>> fetchByProduct(Product model,
      {Connection withConn}) async {
    final pivots = await findByProduct(model.id);
// Return if model has no pivots. If this is not done, all records will be removed!
    if (pivots.isEmpty) return [];

    final duplicates = <Tuple, int>{};

    final exp = Or();
    for (final t in pivots) {
      final tup = Tuple([t.productListId]);
      if (duplicates[tup] == null) {
        exp.or(productItemsBean.id.eq(t.productListId));
        duplicates[tup] = 1;
      } else {
        duplicates[tup] += 1;
      }
    }

    final returnList =
        await productItemsBean.findWhere(exp, withConn: withConn);

    if (duplicates.length != pivots.length) {
      for (Tuple tup in duplicates.keys) {
        int n = duplicates[tup] - 1;
        for (int i = 0; i < n; i++) {
          returnList
              .add(await productItemsBean.find(tup[0], withConn: withConn));
        }
      }
    }

    return returnList;
  }

  Future<List<ProductItemsPivot>> findByProductItems(String productListId,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
    final Find find = finder.where(this.productListId.eq(productListId));
    return findMany(find, withConn: withConn);
  }

  Future<List<ProductItemsPivot>> findByProductItemsList(
      List<ProductItems> models,
      {bool preload = false,
      bool cascade = false,
      Connection withConn}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (ProductItems model in models) {
      find.or(this.productListId.eq(model.id));
    }
    return findMany(find, withConn: withConn);
  }

  Future<int> removeByProductItems(String productListId,
      {Connection withConn}) async {
    final Remove rm = remover.where(this.productListId.eq(productListId));
    return await adapter.remove(rm, withConn: withConn);
  }

  void associateProductItems(ProductItemsPivot child, ProductItems parent) {
    child.productListId = parent.id;
  }

  Future<int> detachProductItems(ProductItems model,
      {Connection withConn, bool removeOrphans = false}) async {
    int ret = 0;
    final dels = await findByProductItems(model.id, withConn: withConn);
    if (dels.isNotEmpty) {
      ret = await removeByProductItems(model.id, withConn: withConn);
      if (removeOrphans) {
        final exp = Or();
        for (final t in dels) {
          exp.or((productBean.id.eq(t.productId)) &
              ~exists(finder.sel(nil).where(productId.eq(t.productId))));
        }
        await productBean.removeWhere(exp, withConn: withConn);
      }
    }
    return ret;
  }

  Future<List<Product>> fetchByProductItems(ProductItems model,
      {Connection withConn}) async {
    final pivots = await findByProductItems(model.id);
// Return if model has no pivots. If this is not done, all records will be removed!
    if (pivots.isEmpty) return [];

    final duplicates = <Tuple, int>{};

    final exp = Or();
    for (final t in pivots) {
      final tup = Tuple([t.productId]);
      if (duplicates[tup] == null) {
        exp.or(productBean.id.eq(t.productId));
        duplicates[tup] = 1;
      } else {
        duplicates[tup] += 1;
      }
    }

    final returnList = await productBean.findWhere(exp, withConn: withConn);

    if (duplicates.length != pivots.length) {
      for (Tuple tup in duplicates.keys) {
        int n = duplicates[tup] - 1;
        for (int i = 0; i < n; i++) {
          returnList.add(await productBean.find(tup[0], withConn: withConn));
        }
      }
    }

    return returnList;
  }

  Future<dynamic> attach(ProductItems one, Product two,
      {bool upsert = false, Connection withConn}) async {
    final ret = ProductItemsPivot();
    ret.productListId = one.id;
    ret.productId = two.id;
    if (!upsert) {
      return insert(ret, withConn: withConn);
    } else {
      return this.upsert(ret, withConn: withConn);
    }
  }

  ProductBean get productBean => beanRepo[ProductBean];
  ProductItemsBean get productItemsBean => beanRepo[ProductItemsBean];
  BeanRepo get beanRepo;
}

abstract class _ProductBean implements Bean<Product> {
  final id = StrField('id');
  final sku = StrField('sku');
  final name = StrField('name');
  final categoryId = IntField('category_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        sku.name: sku,
        name.name: name,
        categoryId.name: categoryId,
      };
  Product fromMap(Map map) {
    Product model = Product();
    model.id = adapter.parseValue(map['id']);
    model.sku = adapter.parseValue(map['sku']);
    model.name = adapter.parseValue(map['name']);
    model.categoryId = adapter.parseValue(map['category_id']);

    return model;
  }

  List<SetColumn> toSetColumns(Product model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(sku.set(model.sku));
      ret.add(name.set(model.name));
      ret.add(categoryId.set(model.categoryId));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(sku.name)) ret.add(sku.set(model.sku));
      if (only.contains(name.name)) ret.add(name.set(model.name));
      if (only.contains(categoryId.name))
        ret.add(categoryId.set(model.categoryId));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.sku != null) {
        ret.add(sku.set(model.sku));
      }
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
      if (model.categoryId != null) {
        ret.add(categoryId.set(model.categoryId));
      }
    }

    return ret;
  }

  Future<void> createTable(
      {bool ifNotExists = false, Connection withConn}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addByType(
      id.name,
      Str(),
      isPrimary: true,
    );
    st.addByType(
      sku.name,
      Str(),
    );
    st.addByType(
      name.name,
      Str(),
      notNull: true,
    );
    st.addByType(
      categoryId.name,
      Int(),
      notNull: true,
      foreign: References(categoryBean.tableName, "id"),
    );
    return adapter.createTable(st, withConn: withConn);
  }

  Future<dynamic> insert(Product model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only,
      Connection withConn}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert, withConn: withConn);
    if (cascade) {
      Product newModel;
      if (model.lists != null) {
        newModel ??= await find(model.id, withConn: withConn);
        for (final child in model.lists) {
          await productItemsBean.insert(child,
              cascade: cascade, withConn: withConn);
          await productItemsPivotBean.attach(child, newModel,
              withConn: withConn);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Product> models,
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

  Future<dynamic> upsert(Product model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      Connection withConn}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert, withConn: withConn);
    if (cascade) {
      Product newModel;
      if (model.lists != null) {
        newModel ??= await find(model.id, withConn: withConn);
        for (final child in model.lists) {
          await productItemsBean.upsert(child,
              cascade: cascade, withConn: withConn);
          await productItemsPivotBean.attach(child, newModel,
              upsert: true, withConn: withConn);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Product> models,
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

  Future<int> update(Product model,
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
      Product newModel;
      if (model.lists != null) {
        for (final child in model.lists) {
          await productItemsBean.update(child,
              cascade: cascade, associate: associate, withConn: withConn);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Product> models,
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

  Future<Product> find(String id,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
    final Find find = finder.where(this.id.eq(id));
    final Product model = await findOne(find, withConn: withConn);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade, withConn: withConn);
    }
    return model;
  }

  Future<int> remove(String id,
      {bool cascade = false,
      Connection withConn,
      bool removeOrphans = false}) async {
    if (cascade) {
      final Product newModel = await find(id, withConn: withConn);
      if (newModel != null) {
        await productItemsPivotBean.detachProduct(newModel,
            withConn: withConn, removeOrphans: removeOrphans);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove, withConn: withConn);
  }

  Future<int> removeMany(List<Product> models, {Connection withConn}) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove, withConn: withConn);
  }

  Future<List<Product>> findByCategory(int categoryId,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
    final Find find = finder.where(this.categoryId.eq(categoryId));
    final List<Product> models = await findMany(find, withConn: withConn);
    if (preload) {
      await this.preloadAll(models, cascade: cascade, withConn: withConn);
    }
    return models;
  }

  Future<List<Product>> findByCategoryList(List<Category> models,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Category model in models) {
      find.or(this.categoryId.eq(model.id));
    }
    final List<Product> retModels = await findMany(find);
    if (preload) {
      await this.preloadAll(retModels, cascade: cascade, withConn: withConn);
    }
    return retModels;
  }

  Future<int> removeByCategory(int categoryId, {Connection withConn}) async {
    final Remove rm = remover.where(this.categoryId.eq(categoryId));
    return await adapter.remove(rm, withConn: withConn);
  }

  void associateCategory(Product child, Category parent) {
    child.categoryId = parent.id;
  }

  Future<List<Category>> fetchCategory(Product model,
      {Connection withConn}) async {
    return categoryBean.findWhere(categoryBean.id.eq(model.categoryId),
        withConn: withConn);
  }

  Future<Product> preload(Product model,
      {bool cascade = false, Connection withConn}) async {
    model.lists =
        await productItemsPivotBean.fetchByProduct(model, withConn: withConn);
    return model;
  }

  Future<List<Product>> preloadAll(List<Product> models,
      {bool cascade = false, Connection withConn}) async {
    for (Product model in models) {
      var temp =
          await productItemsPivotBean.fetchByProduct(model, withConn: withConn);
      if (model.lists == null)
        model.lists = temp;
      else {
        model.lists.clear();
        model.lists.addAll(temp);
      }
    }
    return models;
  }

  ProductItemsPivotBean get productItemsPivotBean =>
      beanRepo[ProductItemsPivotBean];

  ProductItemsBean get productItemsBean => beanRepo[ProductItemsBean];
  CategoryBean get categoryBean => beanRepo[CategoryBean];
  BeanRepo get beanRepo;
}

abstract class _CategoryBean implements Bean<Category> {
  final id = IntField('id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
      };
  Category fromMap(Map map) {
    Category model = Category();
    model.id = adapter.parseValue(map['id']);

    return model;
  }

  List<SetColumn> toSetColumns(Category model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
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
    return adapter.createTable(st, withConn: withConn);
  }

  Future<dynamic> insert(Category model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only,
      Connection withConn}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert, withConn: withConn);
    if (cascade) {
      Category newModel;
      if (model.products != null) {
        newModel ??= await find(model.id, withConn: withConn);
        model.products
            .forEach((x) => productBean.associateCategory(x, newModel));
        for (final child in model.products) {
          await productBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Category> models,
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

  Future<dynamic> upsert(Category model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false,
      Connection withConn}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert, withConn: withConn);
    if (cascade) {
      Category newModel;
      if (model.products != null) {
        newModel ??= await find(model.id, withConn: withConn);
        model.products
            .forEach((x) => productBean.associateCategory(x, newModel));
        for (final child in model.products) {
          await productBean.upsert(child, cascade: cascade, withConn: withConn);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Category> models,
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

  Future<int> update(Category model,
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
      Category newModel;
      if (model.products != null) {
        if (associate) {
          newModel ??= await find(model.id, withConn: withConn);
          model.products
              .forEach((x) => productBean.associateCategory(x, newModel));
        }
        for (final child in model.products) {
          await productBean.update(child,
              cascade: cascade, associate: associate, withConn: withConn);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Category> models,
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

  Future<Category> find(int id,
      {bool preload = false, bool cascade = false, Connection withConn}) async {
    final Find find = finder.where(this.id.eq(id));
    final Category model = await findOne(find, withConn: withConn);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade, withConn: withConn);
    }
    return model;
  }

  Future<int> remove(int id,
      {bool cascade = false, Connection withConn}) async {
    if (cascade) {
      final Category newModel = await find(id, withConn: withConn);
      if (newModel != null) {
        await productBean.removeByCategory(newModel.id, withConn: withConn);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove, withConn: withConn);
  }

  Future<int> removeMany(List<Category> models, {Connection withConn}) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove, withConn: withConn);
  }

  Future<Category> preload(Category model,
      {bool cascade = false, Connection withConn}) async {
    model.products = await productBean.findByCategory(model.id,
        preload: cascade, cascade: cascade, withConn: withConn);
    return model;
  }

  Future<List<Category>> preloadAll(List<Category> models,
      {bool cascade = false, Connection withConn}) async {
    models.forEach((Category model) => model.products ??= []);
    await OneToXHelper.preloadAll<Category, Product>(
        models,
        (Category model) => [model.id],
        productBean.findByCategoryList,
        (Product model) => [model.categoryId],
        (Category model, Product child) =>
            model.products = List.from(model.products)..add(child),
        cascade: cascade,
        withConn: withConn);
    return models;
  }

  ProductBean get productBean => beanRepo[ProductBean];
  BeanRepo get beanRepo;
}
