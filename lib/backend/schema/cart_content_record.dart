import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartContentRecord extends FirestoreRecord {
  CartContentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cart_id" field.
  String? _cartId;
  String get cartId => _cartId ?? '';
  bool hasCartId() => _cartId != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "ammount" field.
  int? _ammount;
  int get ammount => _ammount ?? 0;
  bool hasAmmount() => _ammount != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  void _initializeFields() {
    _cartId = snapshotData['cart_id'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _image = snapshotData['image'] as String?;
    _ammount = castToType<int>(snapshotData['ammount']);
    _text = snapshotData['text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cart_content');

  static Stream<CartContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartContentRecord.fromSnapshot(s));

  static Future<CartContentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartContentRecord.fromSnapshot(s));

  static CartContentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CartContentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartContentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartContentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartContentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartContentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartContentRecordData({
  String? cartId,
  double? price,
  String? image,
  int? ammount,
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cart_id': cartId,
      'price': price,
      'image': image,
      'ammount': ammount,
      'text': text,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartContentRecordDocumentEquality implements Equality<CartContentRecord> {
  const CartContentRecordDocumentEquality();

  @override
  bool equals(CartContentRecord? e1, CartContentRecord? e2) {
    return e1?.cartId == e2?.cartId &&
        e1?.price == e2?.price &&
        e1?.image == e2?.image &&
        e1?.ammount == e2?.ammount &&
        e1?.text == e2?.text;
  }

  @override
  int hash(CartContentRecord? e) => const ListEquality()
      .hash([e?.cartId, e?.price, e?.image, e?.ammount, e?.text]);

  @override
  bool isValidKey(Object? o) => o is CartContentRecord;
}
