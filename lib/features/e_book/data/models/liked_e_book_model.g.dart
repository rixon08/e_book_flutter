// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_e_book_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLikedEBookModelCollection on Isar {
  IsarCollection<LikedEBookModel> get likedEBookModels => this.collection();
}

const LikedEBookModelSchema = CollectionSchema(
  name: r'LikedEBookModel',
  id: -8158448465317275453,
  properties: {
    r'bookId': PropertySchema(
      id: 0,
      name: r'bookId',
      type: IsarType.long,
    ),
    r'likedAt': PropertySchema(
      id: 1,
      name: r'likedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _likedEBookModelEstimateSize,
  serialize: _likedEBookModelSerialize,
  deserialize: _likedEBookModelDeserialize,
  deserializeProp: _likedEBookModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _likedEBookModelGetId,
  getLinks: _likedEBookModelGetLinks,
  attach: _likedEBookModelAttach,
  version: '3.1.0+1',
);

int _likedEBookModelEstimateSize(
  LikedEBookModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _likedEBookModelSerialize(
  LikedEBookModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bookId);
  writer.writeDateTime(offsets[1], object.likedAt);
}

LikedEBookModel _likedEBookModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LikedEBookModel(
    reader.readLong(offsets[0]),
  );
  object.id = id;
  object.likedAt = reader.readDateTime(offsets[1]);
  return object;
}

P _likedEBookModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _likedEBookModelGetId(LikedEBookModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _likedEBookModelGetLinks(LikedEBookModel object) {
  return [];
}

void _likedEBookModelAttach(
    IsarCollection<dynamic> col, Id id, LikedEBookModel object) {
  object.id = id;
}

extension LikedEBookModelQueryWhereSort
    on QueryBuilder<LikedEBookModel, LikedEBookModel, QWhere> {
  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LikedEBookModelQueryWhere
    on QueryBuilder<LikedEBookModel, LikedEBookModel, QWhereClause> {
  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterWhereClause>
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

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LikedEBookModelQueryFilter
    on QueryBuilder<LikedEBookModel, LikedEBookModel, QFilterCondition> {
  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterFilterCondition>
      bookIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookId',
        value: value,
      ));
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterFilterCondition>
      bookIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookId',
        value: value,
      ));
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterFilterCondition>
      bookIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookId',
        value: value,
      ));
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterFilterCondition>
      bookIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterFilterCondition>
      likedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'likedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterFilterCondition>
      likedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'likedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterFilterCondition>
      likedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'likedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterFilterCondition>
      likedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'likedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LikedEBookModelQueryObject
    on QueryBuilder<LikedEBookModel, LikedEBookModel, QFilterCondition> {}

extension LikedEBookModelQueryLinks
    on QueryBuilder<LikedEBookModel, LikedEBookModel, QFilterCondition> {}

extension LikedEBookModelQuerySortBy
    on QueryBuilder<LikedEBookModel, LikedEBookModel, QSortBy> {
  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterSortBy> sortByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterSortBy>
      sortByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterSortBy> sortByLikedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likedAt', Sort.asc);
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterSortBy>
      sortByLikedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likedAt', Sort.desc);
    });
  }
}

extension LikedEBookModelQuerySortThenBy
    on QueryBuilder<LikedEBookModel, LikedEBookModel, QSortThenBy> {
  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterSortBy> thenByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterSortBy>
      thenByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterSortBy> thenByLikedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likedAt', Sort.asc);
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QAfterSortBy>
      thenByLikedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likedAt', Sort.desc);
    });
  }
}

extension LikedEBookModelQueryWhereDistinct
    on QueryBuilder<LikedEBookModel, LikedEBookModel, QDistinct> {
  QueryBuilder<LikedEBookModel, LikedEBookModel, QDistinct> distinctByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookId');
    });
  }

  QueryBuilder<LikedEBookModel, LikedEBookModel, QDistinct>
      distinctByLikedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'likedAt');
    });
  }
}

extension LikedEBookModelQueryProperty
    on QueryBuilder<LikedEBookModel, LikedEBookModel, QQueryProperty> {
  QueryBuilder<LikedEBookModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LikedEBookModel, int, QQueryOperations> bookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookId');
    });
  }

  QueryBuilder<LikedEBookModel, DateTime, QQueryOperations> likedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likedAt');
    });
  }
}
