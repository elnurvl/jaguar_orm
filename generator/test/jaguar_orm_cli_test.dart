// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.


import 'package:jaguar_orm_gen/src/hook/hook.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build_test/build_test.dart';
import 'package:test/test.dart';

import 'fileReader.dart';

void main() {
  group('A group of tests', () {
    setUp(() {});

    test('Generator generates the content correctly', () async {
      var builder = PartBuilder([BeanGenerator()], '.jorm.dart');
      var assets = {
        'jaguar_orm|test/address.dart': address,
        'jaguar_orm|test/pivot.dart': client,
        'jaguar_orm|test/post.dart': address,
        'jaguar_orm|test/role.dart': address,
        'jaguar_orm|test/user.dart': address,
      };
      await testBuilder(builder, assets, reader: await PackageAssetReader.currentIsolate(), rootPackage: 'jaguar_orm');
    });
  });
}

var address = readFile('test/src/address.dart');
var pivot = readFile('test/src/pivot.dart');
var post = readFile('test/src/post.dart');
var todoList = readFile('test/src/role.dart');
var client = readFile('test/src/user.dart');
