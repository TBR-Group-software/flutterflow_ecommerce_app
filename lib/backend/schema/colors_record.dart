import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColorsRecord extends FirestoreRecord {
  ColorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  void _initializeFields() {
    _color = getSchemaColor(snapshotData['color']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('colors');

  static Stream<ColorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ColorsRecord.fromSnapshot(s));

  static Future<ColorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ColorsRecord.fromSnapshot(s));

  static ColorsRecord fromSnapshot(DocumentSnapshot snapshot) => ColorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ColorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ColorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ColorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ColorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createColorsRecordData({
  Color? color,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'color': color,
    }.withoutNulls,
  );

  return firestoreData;
}

class ColorsRecordDocumentEquality implements Equality<ColorsRecord> {
  const ColorsRecordDocumentEquality();

  @override
  bool equals(ColorsRecord? e1, ColorsRecord? e2) {
    return e1?.color == e2?.color;
  }

  @override
  int hash(ColorsRecord? e) => const ListEquality().hash([e?.color]);

  @override
  bool isValidKey(Object? o) => o is ColorsRecord;
}
