import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatalogueRecord extends FirestoreRecord {
  CatalogueRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('catalogue');

  static Stream<CatalogueRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CatalogueRecord.fromSnapshot(s));

  static Future<CatalogueRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CatalogueRecord.fromSnapshot(s));

  static CatalogueRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CatalogueRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CatalogueRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CatalogueRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CatalogueRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CatalogueRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCatalogueRecordData({
  String? title,
  String? imageUrl,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'image_url': imageUrl,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CatalogueRecordDocumentEquality implements Equality<CatalogueRecord> {
  const CatalogueRecordDocumentEquality();

  @override
  bool equals(CatalogueRecord? e1, CatalogueRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(CatalogueRecord? e) =>
      const ListEquality().hash([e?.title, e?.imageUrl, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is CatalogueRecord;
}
