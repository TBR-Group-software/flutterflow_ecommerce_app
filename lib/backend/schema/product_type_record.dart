import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductTypeRecord extends FirestoreRecord {
  ProductTypeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product_type');

  static Stream<ProductTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductTypeRecord.fromSnapshot(s));

  static Future<ProductTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductTypeRecord.fromSnapshot(s));

  static ProductTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductTypeRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductTypeRecordDocumentEquality implements Equality<ProductTypeRecord> {
  const ProductTypeRecordDocumentEquality();

  @override
  bool equals(ProductTypeRecord? e1, ProductTypeRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(ProductTypeRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is ProductTypeRecord;
}
