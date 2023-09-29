import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "discount_price" field.
  double? _discountPrice;
  double get discountPrice => _discountPrice ?? 0.0;
  bool hasDiscountPrice() => _discountPrice != null;

  // "discount" field.
  int? _discount;
  int get discount => _discount ?? 0;
  bool hasDiscount() => _discount != null;

  // "raiting" field.
  int? _raiting;
  int get raiting => _raiting ?? 0;
  bool hasRaiting() => _raiting != null;

  // "featured" field.
  bool? _featured;
  bool get featured => _featured ?? false;
  bool hasFeatured() => _featured != null;

  // "images_url" field.
  List<String>? _imagesUrl;
  List<String> get imagesUrl => _imagesUrl ?? const [];
  bool hasImagesUrl() => _imagesUrl != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "in_favorites" field.
  List<String>? _inFavorites;
  List<String> get inFavorites => _inFavorites ?? const [];
  bool hasInFavorites() => _inFavorites != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _discountPrice = castToType<double>(snapshotData['discount_price']);
    _discount = castToType<int>(snapshotData['discount']);
    _raiting = castToType<int>(snapshotData['raiting']);
    _featured = snapshotData['featured'] as bool?;
    _imagesUrl = getDataList(snapshotData['images_url']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _inFavorites = getDataList(snapshotData['in_favorites']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? title,
  double? price,
  double? discountPrice,
  int? discount,
  int? raiting,
  bool? featured,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'price': price,
      'discount_price': discountPrice,
      'discount': discount,
      'raiting': raiting,
      'featured': featured,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.price == e2?.price &&
        e1?.discountPrice == e2?.discountPrice &&
        e1?.discount == e2?.discount &&
        e1?.raiting == e2?.raiting &&
        e1?.featured == e2?.featured &&
        listEquality.equals(e1?.imagesUrl, e2?.imagesUrl) &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.inFavorites, e2?.inFavorites);
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.price,
        e?.discountPrice,
        e?.discount,
        e?.raiting,
        e?.featured,
        e?.imagesUrl,
        e?.createdAt,
        e?.inFavorites
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
