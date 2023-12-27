import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BrandsRecord extends FirestoreRecord {
  BrandsRecord._(
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
      FirebaseFirestore.instance.collection('brands');

  static Stream<BrandsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BrandsRecord.fromSnapshot(s));

  static Future<BrandsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BrandsRecord.fromSnapshot(s));

  static BrandsRecord fromSnapshot(DocumentSnapshot snapshot) => BrandsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BrandsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BrandsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BrandsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BrandsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBrandsRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class BrandsRecordDocumentEquality implements Equality<BrandsRecord> {
  const BrandsRecordDocumentEquality();

  @override
  bool equals(BrandsRecord? e1, BrandsRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(BrandsRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is BrandsRecord;
}
