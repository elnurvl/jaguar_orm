import 'package:built_value/built_value.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query/jaguar_query.dart';

import 'user.dart';

part 'post.bv.dart';
part 'post.jorm.dart';

abstract class Post implements Built<Post, PostBuilder> {
  @primaryKey
  int get id;
  String get content;

  @BelongsTo.many(UserBean, references: 'id')
  int get userId;

  Post._();

  factory Post([void Function(PostBuilder) updates]) = _$Post;
}

@GenBean()
class PostBean extends Bean<_$Post> with _PostBean {
  final BeanRepo beanRepo;

  PostBean(Adapter adapter, this.beanRepo) : super(adapter);

  @override
  String get tableName => 'posts';
}
