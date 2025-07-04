// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_book_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEBookModelCollection on Isar {
  IsarCollection<EBookModel> get eBookModels => this.collection();
}

const EBookModelSchema = CollectionSchema(
  name: r'EBookModel',
  id: 2795059909153144054,
  properties: {
    r'authors': PropertySchema(
      id: 0,
      name: r'authors',
      type: IsarType.objectList,
      target: r'AuthorModel',
    ),
    r'bookId': PropertySchema(
      id: 1,
      name: r'bookId',
      type: IsarType.long,
    ),
    r'bookshelves': PropertySchema(
      id: 2,
      name: r'bookshelves',
      type: IsarType.stringList,
    ),
    r'copyright': PropertySchema(
      id: 3,
      name: r'copyright',
      type: IsarType.bool,
    ),
    r'downloadCount': PropertySchema(
      id: 4,
      name: r'downloadCount',
      type: IsarType.long,
    ),
    r'downloadCountFormat': PropertySchema(
      id: 5,
      name: r'downloadCountFormat',
      type: IsarType.string,
    ),
    r'imageLink': PropertySchema(
      id: 6,
      name: r'imageLink',
      type: IsarType.string,
    ),
    r'languages': PropertySchema(
      id: 7,
      name: r'languages',
      type: IsarType.stringList,
    ),
    r'subjects': PropertySchema(
      id: 8,
      name: r'subjects',
      type: IsarType.stringList,
    ),
    r'summaries': PropertySchema(
      id: 9,
      name: r'summaries',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 10,
      name: r'title',
      type: IsarType.string,
    ),
    r'translators': PropertySchema(
      id: 11,
      name: r'translators',
      type: IsarType.objectList,
      target: r'AuthorModel',
    )
  },
  estimateSize: _eBookModelEstimateSize,
  serialize: _eBookModelSerialize,
  deserialize: _eBookModelDeserialize,
  deserializeProp: _eBookModelDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'bookId': IndexSchema(
      id: 3567540928881766442,
      name: r'bookId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'bookId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'AuthorModel': AuthorModelSchema},
  getId: _eBookModelGetId,
  getLinks: _eBookModelGetLinks,
  attach: _eBookModelAttach,
  version: '3.1.0+1',
);

int _eBookModelEstimateSize(
  EBookModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.authors.length * 3;
  {
    final offsets = allOffsets[AuthorModel]!;
    for (var i = 0; i < object.authors.length; i++) {
      final value = object.authors[i];
      bytesCount += AuthorModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.bookshelves.length * 3;
  {
    for (var i = 0; i < object.bookshelves.length; i++) {
      final value = object.bookshelves[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.downloadCountFormat.length * 3;
  bytesCount += 3 + object.imageLink.length * 3;
  bytesCount += 3 + object.languages.length * 3;
  {
    for (var i = 0; i < object.languages.length; i++) {
      final value = object.languages[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.subjects.length * 3;
  {
    for (var i = 0; i < object.subjects.length; i++) {
      final value = object.subjects[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.summaries.length * 3;
  {
    for (var i = 0; i < object.summaries.length; i++) {
      final value = object.summaries[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.translators.length * 3;
  {
    final offsets = allOffsets[AuthorModel]!;
    for (var i = 0; i < object.translators.length; i++) {
      final value = object.translators[i];
      bytesCount += AuthorModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _eBookModelSerialize(
  EBookModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<AuthorModel>(
    offsets[0],
    allOffsets,
    AuthorModelSchema.serialize,
    object.authors,
  );
  writer.writeLong(offsets[1], object.bookId);
  writer.writeStringList(offsets[2], object.bookshelves);
  writer.writeBool(offsets[3], object.copyright);
  writer.writeLong(offsets[4], object.downloadCount);
  writer.writeString(offsets[5], object.downloadCountFormat);
  writer.writeString(offsets[6], object.imageLink);
  writer.writeStringList(offsets[7], object.languages);
  writer.writeStringList(offsets[8], object.subjects);
  writer.writeStringList(offsets[9], object.summaries);
  writer.writeString(offsets[10], object.title);
  writer.writeObjectList<AuthorModel>(
    offsets[11],
    allOffsets,
    AuthorModelSchema.serialize,
    object.translators,
  );
}

EBookModel _eBookModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EBookModel(
    authors: reader.readObjectList<AuthorModel>(
          offsets[0],
          AuthorModelSchema.deserialize,
          allOffsets,
          AuthorModel(),
        ) ??
        [],
    bookId: reader.readLong(offsets[1]),
    bookshelves: reader.readStringList(offsets[2]) ?? [],
    copyright: reader.readBool(offsets[3]),
    downloadCount: reader.readLong(offsets[4]),
    imageLink: reader.readString(offsets[6]),
    languages: reader.readStringList(offsets[7]) ?? [],
    subjects: reader.readStringList(offsets[8]) ?? [],
    summaries: reader.readStringList(offsets[9]) ?? [],
    title: reader.readString(offsets[10]),
    translators: reader.readObjectList<AuthorModel>(
          offsets[11],
          AuthorModelSchema.deserialize,
          allOffsets,
          AuthorModel(),
        ) ??
        [],
  );
  return object;
}

P _eBookModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<AuthorModel>(
            offset,
            AuthorModelSchema.deserialize,
            allOffsets,
            AuthorModel(),
          ) ??
          []) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readObjectList<AuthorModel>(
            offset,
            AuthorModelSchema.deserialize,
            allOffsets,
            AuthorModel(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _eBookModelGetId(EBookModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _eBookModelGetLinks(EBookModel object) {
  return [];
}

void _eBookModelAttach(IsarCollection<dynamic> col, Id id, EBookModel object) {}

extension EBookModelByIndex on IsarCollection<EBookModel> {
  Future<EBookModel?> getByBookId(int bookId) {
    return getByIndex(r'bookId', [bookId]);
  }

  EBookModel? getByBookIdSync(int bookId) {
    return getByIndexSync(r'bookId', [bookId]);
  }

  Future<bool> deleteByBookId(int bookId) {
    return deleteByIndex(r'bookId', [bookId]);
  }

  bool deleteByBookIdSync(int bookId) {
    return deleteByIndexSync(r'bookId', [bookId]);
  }

  Future<List<EBookModel?>> getAllByBookId(List<int> bookIdValues) {
    final values = bookIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'bookId', values);
  }

  List<EBookModel?> getAllByBookIdSync(List<int> bookIdValues) {
    final values = bookIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'bookId', values);
  }

  Future<int> deleteAllByBookId(List<int> bookIdValues) {
    final values = bookIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'bookId', values);
  }

  int deleteAllByBookIdSync(List<int> bookIdValues) {
    final values = bookIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'bookId', values);
  }

  Future<Id> putByBookId(EBookModel object) {
    return putByIndex(r'bookId', object);
  }

  Id putByBookIdSync(EBookModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'bookId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByBookId(List<EBookModel> objects) {
    return putAllByIndex(r'bookId', objects);
  }

  List<Id> putAllByBookIdSync(List<EBookModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'bookId', objects, saveLinks: saveLinks);
  }
}

extension EBookModelQueryWhereSort
    on QueryBuilder<EBookModel, EBookModel, QWhere> {
  QueryBuilder<EBookModel, EBookModel, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterWhere> anyBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'bookId'),
      );
    });
  }
}

extension EBookModelQueryWhere
    on QueryBuilder<EBookModel, EBookModel, QWhereClause> {
  QueryBuilder<EBookModel, EBookModel, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterWhereClause> bookIdEqualTo(
      int bookId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bookId',
        value: [bookId],
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterWhereClause> bookIdNotEqualTo(
      int bookId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookId',
              lower: [],
              upper: [bookId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookId',
              lower: [bookId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookId',
              lower: [bookId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookId',
              lower: [],
              upper: [bookId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterWhereClause> bookIdGreaterThan(
    int bookId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bookId',
        lower: [bookId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterWhereClause> bookIdLessThan(
    int bookId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bookId',
        lower: [],
        upper: [bookId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterWhereClause> bookIdBetween(
    int lowerBookId,
    int upperBookId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bookId',
        lower: [lowerBookId],
        includeLower: includeLower,
        upper: [upperBookId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EBookModelQueryFilter
    on QueryBuilder<EBookModel, EBookModel, QFilterCondition> {
  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      authorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> authorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      authorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      authorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      authorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      authorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> bookIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookId',
        value: value,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> bookIdGreaterThan(
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

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> bookIdLessThan(
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

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> bookIdBetween(
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

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookshelves',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookshelves',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookshelves',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookshelves',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookshelves',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookshelves',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookshelves',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookshelves',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookshelves',
        value: '',
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookshelves',
        value: '',
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookshelves',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookshelves',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookshelves',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookshelves',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookshelves',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      bookshelvesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookshelves',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> copyrightEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'copyright',
        value: value,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      downloadCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      downloadCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      downloadCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      downloadCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      downloadCountFormatEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadCountFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      downloadCountFormatGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadCountFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      downloadCountFormatLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadCountFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      downloadCountFormatBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadCountFormat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      downloadCountFormatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'downloadCountFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      downloadCountFormatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'downloadCountFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      downloadCountFormatContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'downloadCountFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      downloadCountFormatMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'downloadCountFormat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      downloadCountFormatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadCountFormat',
        value: '',
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      downloadCountFormatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'downloadCountFormat',
        value: '',
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> imageLinkEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      imageLinkGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> imageLinkLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> imageLinkBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageLink',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      imageLinkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> imageLinkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> imageLinkContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> imageLinkMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageLink',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      imageLinkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageLink',
        value: '',
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      imageLinkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageLink',
        value: '',
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'languages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'languages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'languages',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languages',
        value: '',
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'languages',
        value: '',
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      languagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subjects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subjects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subjects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subjects',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subjects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subjects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subjects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subjects',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subjects',
        value: '',
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subjects',
        value: '',
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      subjectsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subjects',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summaries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'summaries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'summaries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'summaries',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'summaries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'summaries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'summaries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'summaries',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summaries',
        value: '',
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'summaries',
        value: '',
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'summaries',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'summaries',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'summaries',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'summaries',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'summaries',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      summariesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'summaries',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      translatorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'translators',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      translatorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'translators',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      translatorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'translators',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      translatorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'translators',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      translatorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'translators',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      translatorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'translators',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension EBookModelQueryObject
    on QueryBuilder<EBookModel, EBookModel, QFilterCondition> {
  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition> authorsElement(
      FilterQuery<AuthorModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'authors');
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterFilterCondition>
      translatorsElement(FilterQuery<AuthorModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'translators');
    });
  }
}

extension EBookModelQueryLinks
    on QueryBuilder<EBookModel, EBookModel, QFilterCondition> {}

extension EBookModelQuerySortBy
    on QueryBuilder<EBookModel, EBookModel, QSortBy> {
  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> sortByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> sortByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> sortByCopyright() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copyright', Sort.asc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> sortByCopyrightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copyright', Sort.desc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> sortByDownloadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCount', Sort.asc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> sortByDownloadCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCount', Sort.desc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy>
      sortByDownloadCountFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCountFormat', Sort.asc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy>
      sortByDownloadCountFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCountFormat', Sort.desc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> sortByImageLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageLink', Sort.asc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> sortByImageLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageLink', Sort.desc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension EBookModelQuerySortThenBy
    on QueryBuilder<EBookModel, EBookModel, QSortThenBy> {
  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> thenByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> thenByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> thenByCopyright() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copyright', Sort.asc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> thenByCopyrightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copyright', Sort.desc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> thenByDownloadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCount', Sort.asc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> thenByDownloadCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCount', Sort.desc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy>
      thenByDownloadCountFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCountFormat', Sort.asc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy>
      thenByDownloadCountFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCountFormat', Sort.desc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> thenByImageLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageLink', Sort.asc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> thenByImageLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageLink', Sort.desc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension EBookModelQueryWhereDistinct
    on QueryBuilder<EBookModel, EBookModel, QDistinct> {
  QueryBuilder<EBookModel, EBookModel, QDistinct> distinctByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookId');
    });
  }

  QueryBuilder<EBookModel, EBookModel, QDistinct> distinctByBookshelves() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookshelves');
    });
  }

  QueryBuilder<EBookModel, EBookModel, QDistinct> distinctByCopyright() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'copyright');
    });
  }

  QueryBuilder<EBookModel, EBookModel, QDistinct> distinctByDownloadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadCount');
    });
  }

  QueryBuilder<EBookModel, EBookModel, QDistinct> distinctByDownloadCountFormat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadCountFormat',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QDistinct> distinctByImageLink(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageLink', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EBookModel, EBookModel, QDistinct> distinctByLanguages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'languages');
    });
  }

  QueryBuilder<EBookModel, EBookModel, QDistinct> distinctBySubjects() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subjects');
    });
  }

  QueryBuilder<EBookModel, EBookModel, QDistinct> distinctBySummaries() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'summaries');
    });
  }

  QueryBuilder<EBookModel, EBookModel, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension EBookModelQueryProperty
    on QueryBuilder<EBookModel, EBookModel, QQueryProperty> {
  QueryBuilder<EBookModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<EBookModel, List<AuthorModel>, QQueryOperations>
      authorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authors');
    });
  }

  QueryBuilder<EBookModel, int, QQueryOperations> bookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookId');
    });
  }

  QueryBuilder<EBookModel, List<String>, QQueryOperations>
      bookshelvesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookshelves');
    });
  }

  QueryBuilder<EBookModel, bool, QQueryOperations> copyrightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'copyright');
    });
  }

  QueryBuilder<EBookModel, int, QQueryOperations> downloadCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadCount');
    });
  }

  QueryBuilder<EBookModel, String, QQueryOperations>
      downloadCountFormatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadCountFormat');
    });
  }

  QueryBuilder<EBookModel, String, QQueryOperations> imageLinkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageLink');
    });
  }

  QueryBuilder<EBookModel, List<String>, QQueryOperations> languagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'languages');
    });
  }

  QueryBuilder<EBookModel, List<String>, QQueryOperations> subjectsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subjects');
    });
  }

  QueryBuilder<EBookModel, List<String>, QQueryOperations> summariesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'summaries');
    });
  }

  QueryBuilder<EBookModel, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<EBookModel, List<AuthorModel>, QQueryOperations>
      translatorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translators');
    });
  }
}
