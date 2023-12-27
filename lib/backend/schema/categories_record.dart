import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "catalogue_id" field.
  String? _catalogueId;
  String get catalogueId => _catalogueId ?? '';
  bool hasCatalogueId() => _catalogueId != null;

  // "product_types" field.
  List<String>? _productTypes;
  List<String> get productTypes => _productTypes ?? const [];
  bool hasProductTypes() => _productTypes != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _catalogueId = snapshotData['catalogue_id'] as String?;
    _productTypes = getDataList(snapshotData['product_types']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? title,
  DateTime? createdAt,
  String? catalogueId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'created_at': createdAt,
      'catalogue_id': catalogueId,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.createdAt == e2?.createdAt &&
        e1?.catalogueId == e2?.catalogueId &&
        listEquality.equals(e1?.productTypes, e2?.productTypes);
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality()
      .hash([e?.title, e?.createdAt, e?.catalogueId, e?.productTypes]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
