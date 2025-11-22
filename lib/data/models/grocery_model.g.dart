// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGroceryRecipeGroupModelCollection on Isar {
  IsarCollection<GroceryRecipeGroupModel> get groceryRecipeGroupModels =>
      this.collection();
}

const GroceryRecipeGroupModelSchema = CollectionSchema(
  name: r'GroceryRecipeGroupModel',
  id: -9167354047759218267,
  properties: {
    r'isCreatedByUser': PropertySchema(
      id: 0,
      name: r'isCreatedByUser',
      type: IsarType.bool,
    ),
    r'link': PropertySchema(id: 1, name: r'link', type: IsarType.string),
    r'name': PropertySchema(id: 2, name: r'name', type: IsarType.string),
  },

  estimateSize: _groceryRecipeGroupModelEstimateSize,
  serialize: _groceryRecipeGroupModelSerialize,
  deserialize: _groceryRecipeGroupModelDeserialize,
  deserializeProp: _groceryRecipeGroupModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {
    r'groceries': LinkSchema(
      id: -7594204478624994827,
      name: r'groceries',
      target: r'GroceryItemModel',
      single: false,
    ),
  },
  embeddedSchemas: {},

  getId: _groceryRecipeGroupModelGetId,
  getLinks: _groceryRecipeGroupModelGetLinks,
  attach: _groceryRecipeGroupModelAttach,
  version: '3.3.0-dev.3',
);

int _groceryRecipeGroupModelEstimateSize(
  GroceryRecipeGroupModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.link;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _groceryRecipeGroupModelSerialize(
  GroceryRecipeGroupModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isCreatedByUser);
  writer.writeString(offsets[1], object.link);
  writer.writeString(offsets[2], object.name);
}

GroceryRecipeGroupModel _groceryRecipeGroupModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GroceryRecipeGroupModel(
    id: id,
    isCreatedByUser: reader.readBool(offsets[0]),
    link: reader.readStringOrNull(offsets[1]),
    name: reader.readString(offsets[2]),
  );
  return object;
}

P _groceryRecipeGroupModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _groceryRecipeGroupModelGetId(GroceryRecipeGroupModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _groceryRecipeGroupModelGetLinks(
  GroceryRecipeGroupModel object,
) {
  return [object.groceries];
}

void _groceryRecipeGroupModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  GroceryRecipeGroupModel object,
) {
  object.id = id;
  object.groceries.attach(
    col,
    col.isar.collection<GroceryItemModel>(),
    r'groceries',
    id,
  );
}

extension GroceryRecipeGroupModelByIndex
    on IsarCollection<GroceryRecipeGroupModel> {
  Future<GroceryRecipeGroupModel?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  GroceryRecipeGroupModel? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<GroceryRecipeGroupModel?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<GroceryRecipeGroupModel?> getAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'name', values);
  }

  Future<int> deleteAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'name', values);
  }

  int deleteAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'name', values);
  }

  Future<Id> putByName(GroceryRecipeGroupModel object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(GroceryRecipeGroupModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<GroceryRecipeGroupModel> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(
    List<GroceryRecipeGroupModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension GroceryRecipeGroupModelQueryWhereSort
    on QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QWhere> {
  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GroceryRecipeGroupModelQueryWhere
    on
        QueryBuilder<
          GroceryRecipeGroupModel,
          GroceryRecipeGroupModel,
          QWhereClause
        > {
  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterWhereClause
  >
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterWhereClause
  >
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterWhereClause
  >
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterWhereClause
  >
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterWhereClause
  >
  nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: [name]),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterWhereClause
  >
  nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension GroceryRecipeGroupModelQueryFilter
    on
        QueryBuilder<
          GroceryRecipeGroupModel,
          GroceryRecipeGroupModel,
          QFilterCondition
        > {
  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  isCreatedByUserEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isCreatedByUser', value: value),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  linkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'link'),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  linkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'link'),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  linkEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'link',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  linkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'link',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  linkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'link',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  linkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'link',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  linkStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'link',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  linkEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'link',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  linkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'link',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  linkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'link',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  linkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'link', value: ''),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  linkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'link', value: ''),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  nameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }
}

extension GroceryRecipeGroupModelQueryObject
    on
        QueryBuilder<
          GroceryRecipeGroupModel,
          GroceryRecipeGroupModel,
          QFilterCondition
        > {}

extension GroceryRecipeGroupModelQueryLinks
    on
        QueryBuilder<
          GroceryRecipeGroupModel,
          GroceryRecipeGroupModel,
          QFilterCondition
        > {
  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  groceries(FilterQuery<GroceryItemModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'groceries');
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  groceriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'groceries', length, true, length, true);
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  groceriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'groceries', 0, true, 0, true);
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  groceriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'groceries', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  groceriesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'groceries', 0, true, length, include);
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  groceriesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'groceries', length, include, 999999, true);
    });
  }

  QueryBuilder<
    GroceryRecipeGroupModel,
    GroceryRecipeGroupModel,
    QAfterFilterCondition
  >
  groceriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
        r'groceries',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension GroceryRecipeGroupModelQuerySortBy
    on QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QSortBy> {
  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterSortBy>
  sortByIsCreatedByUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCreatedByUser', Sort.asc);
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterSortBy>
  sortByIsCreatedByUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCreatedByUser', Sort.desc);
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterSortBy>
  sortByLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.asc);
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterSortBy>
  sortByLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.desc);
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterSortBy>
  sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension GroceryRecipeGroupModelQuerySortThenBy
    on
        QueryBuilder<
          GroceryRecipeGroupModel,
          GroceryRecipeGroupModel,
          QSortThenBy
        > {
  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterSortBy>
  thenByIsCreatedByUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCreatedByUser', Sort.asc);
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterSortBy>
  thenByIsCreatedByUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCreatedByUser', Sort.desc);
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterSortBy>
  thenByLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.asc);
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterSortBy>
  thenByLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.desc);
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterSortBy>
  thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension GroceryRecipeGroupModelQueryWhereDistinct
    on
        QueryBuilder<
          GroceryRecipeGroupModel,
          GroceryRecipeGroupModel,
          QDistinct
        > {
  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QDistinct>
  distinctByIsCreatedByUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCreatedByUser');
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QDistinct>
  distinctByLink({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'link', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, GroceryRecipeGroupModel, QDistinct>
  distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension GroceryRecipeGroupModelQueryProperty
    on
        QueryBuilder<
          GroceryRecipeGroupModel,
          GroceryRecipeGroupModel,
          QQueryProperty
        > {
  QueryBuilder<GroceryRecipeGroupModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, bool, QQueryOperations>
  isCreatedByUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCreatedByUser');
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, String?, QQueryOperations>
  linkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'link');
    });
  }

  QueryBuilder<GroceryRecipeGroupModel, String, QQueryOperations>
  nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGroceryItemModelCollection on Isar {
  IsarCollection<GroceryItemModel> get groceryItemModels => this.collection();
}

const GroceryItemModelSchema = CollectionSchema(
  name: r'GroceryItemModel',
  id: 6390189550042318546,
  properties: {
    r'isChecked': PropertySchema(
      id: 0,
      name: r'isChecked',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(id: 1, name: r'name', type: IsarType.string),
  },

  estimateSize: _groceryItemModelEstimateSize,
  serialize: _groceryItemModelSerialize,
  deserialize: _groceryItemModelDeserialize,
  deserializeProp: _groceryItemModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _groceryItemModelGetId,
  getLinks: _groceryItemModelGetLinks,
  attach: _groceryItemModelAttach,
  version: '3.3.0-dev.3',
);

int _groceryItemModelEstimateSize(
  GroceryItemModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _groceryItemModelSerialize(
  GroceryItemModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isChecked);
  writer.writeString(offsets[1], object.name);
}

GroceryItemModel _groceryItemModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GroceryItemModel(
    id: id,
    isChecked: reader.readBoolOrNull(offsets[0]) ?? false,
    name: reader.readString(offsets[1]),
  );
  return object;
}

P _groceryItemModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _groceryItemModelGetId(GroceryItemModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _groceryItemModelGetLinks(GroceryItemModel object) {
  return [];
}

void _groceryItemModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  GroceryItemModel object,
) {
  object.id = id;
}

extension GroceryItemModelQueryWhereSort
    on QueryBuilder<GroceryItemModel, GroceryItemModel, QWhere> {
  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GroceryItemModelQueryWhere
    on QueryBuilder<GroceryItemModel, GroceryItemModel, QWhereClause> {
  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension GroceryItemModelQueryFilter
    on QueryBuilder<GroceryItemModel, GroceryItemModel, QFilterCondition> {
  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  isCheckedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isChecked', value: value),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  nameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }
}

extension GroceryItemModelQueryObject
    on QueryBuilder<GroceryItemModel, GroceryItemModel, QFilterCondition> {}

extension GroceryItemModelQueryLinks
    on QueryBuilder<GroceryItemModel, GroceryItemModel, QFilterCondition> {}

extension GroceryItemModelQuerySortBy
    on QueryBuilder<GroceryItemModel, GroceryItemModel, QSortBy> {
  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterSortBy>
  sortByIsChecked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChecked', Sort.asc);
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterSortBy>
  sortByIsCheckedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChecked', Sort.desc);
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension GroceryItemModelQuerySortThenBy
    on QueryBuilder<GroceryItemModel, GroceryItemModel, QSortThenBy> {
  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterSortBy>
  thenByIsChecked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChecked', Sort.asc);
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterSortBy>
  thenByIsCheckedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChecked', Sort.desc);
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension GroceryItemModelQueryWhereDistinct
    on QueryBuilder<GroceryItemModel, GroceryItemModel, QDistinct> {
  QueryBuilder<GroceryItemModel, GroceryItemModel, QDistinct>
  distinctByIsChecked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isChecked');
    });
  }

  QueryBuilder<GroceryItemModel, GroceryItemModel, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension GroceryItemModelQueryProperty
    on QueryBuilder<GroceryItemModel, GroceryItemModel, QQueryProperty> {
  QueryBuilder<GroceryItemModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GroceryItemModel, bool, QQueryOperations> isCheckedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isChecked');
    });
  }

  QueryBuilder<GroceryItemModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
