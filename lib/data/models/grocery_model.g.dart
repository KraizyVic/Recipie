// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

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
