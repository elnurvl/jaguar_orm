library jaguar_orm.generator.model;

import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:meta/meta.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:jaguar_orm_gen/src/common/common.dart';
import 'package:jaguar_orm/src/annotations/column.dart';
import 'package:tuple/tuple.dart';
import 'preloads.dart';

export 'preloads.dart';

part 'association.dart';
part 'foreign.dart';

class ParsedField {
  final String type;

  final String field;

  final bool isFinal;

  final Column column;

  final String dataType;

  final String dataTypeDecl;

  final ForeignSpec foreign;

  final bool isAuto;

  final List<String> constraints;

  ParsedField(this.type, this.field,
      {@required Column column,
      @required this.dataType,
      @required this.dataTypeDecl,
      @required this.foreign,
      @required this.isFinal,
      @required this.isAuto,
      this.constraints: const []})
      : column = column ?? Column();

  String get colName => column?.name ?? field;

  String get vType {
    final index = dataType.indexOf('<');
    if (index == -1) return dataType + 'Field';
    return dataType.substring(0, index) + 'Field' + dataType.substring(index);
  }
}

class ParsedBean extends UnAssociatedBean {
  /// A map of bean to [AssociationByRelation]
  final Map<Tuple2<DartType, String>, AssociationByRelation>
      associationsWithRelations;

  /// A map of association to [AssociationWithoutRelation]
  final Map<DartType, AssociationWithoutRelation> associationsWithoutRelations;

  bool get hasManyToManyRelation => preloads.any((p) => p is PreloadManyToMany);

  ParsedBean(
    String name, {
    @required String modelType,
    @required bool hasFactory,
    @required Map<String, ParsedField> fields,
    @required List<ParsedField> primary,
    @required List<Preload> preloads,
    @required Map<String, RelationSpec> relations,
    @required this.associationsWithRelations,
    @required this.associationsWithoutRelations,
  }) : super(name, modelType,
            hasFactory: hasFactory,
            fields: fields,
            primary: primary,
            relations: relations,
            preloads: preloads);

  factory ParsedBean.fromPreAssociated(
    UnAssociatedBean bean, {
    @required Map<Tuple2<DartType, String>, AssociationByRelation> belongTos,
    @required
        Map<DartType, AssociationWithoutRelation> beanedForeignAssociations,
  }) {
    return ParsedBean(bean.name,
        modelType: bean.modelType,
        hasFactory: bean.hasFactory,
        fields: bean.fields,
        primary: bean.primary,
        preloads: bean.preloads,
        relations: bean.relations,
        associationsWithRelations: belongTos,
        associationsWithoutRelations: beanedForeignAssociations);
  }

  AssociationByRelation getMatchingManyToMany(AssociationByRelation val) {
    for (AssociationByRelation f in associationsWithRelations.values) {
      if (!f.isManyToMany) continue;

      if (f == val) continue;

      return f;
    }
    return null;
  }
}

class UnAssociatedBean {
  final String name;

  final String modelType;

  final bool hasFactory;

  final Map<String, ParsedField> fields;

  final List<ParsedField> primary;

  final List<Preload> preloads;

  String get superType => getPublicType(modelType);

  /// Map of field name to relation.
  final Map<String, RelationSpec> relations;

  UnAssociatedBean(this.name, this.modelType,
      {@required this.hasFactory,
      @required this.fields,
      @required this.primary,
      @required this.relations,
      @required this.preloads});

  Preload findHasXByAssociation(DartType association, {@required String name}) {
    return preloads.firstWhere((p) => p.bean == association && p.linkBy == name,
        orElse: () => null);
  }

  ParsedField fieldByColName(String colName) => fields.values
      .firstWhere((ParsedField f) => f.colName == colName, orElse: () => null);
}
