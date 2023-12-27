import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "found_helpful_count" field.
  int? _foundHelpfulCount;
  int get foundHelpfulCount => _foundHelpfulCount ?? 0;
  bool hasFoundHelpfulCount() => _foundHelpfulCount != null;

  // "is_helpfull" field.
  bool? _isHelpfull;
  bool get isHelpfull => _isHelpfull ?? false;
  bool hasIsHelpfull() => _isHelpfull != null;

  void _initializeFields() {
    _userName = snapshotData['user_name'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _text = snapshotData['text'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _foundHelpfulCount = castToType<int>(snapshotData['found_helpful_count']);
    _isHelpfull = snapshotData['is_helpfull'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  String? userName,
  double? rating,
  String? text,
  DateTime? date,
  int? foundHelpfulCount,
  bool? isHelpfull,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_name': userName,
      'rating': rating,
      'text': text,
      'date': date,
      'found_helpful_count': foundHelpfulCount,
      'is_helpfull': isHelpfull,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.userName == e2?.userName &&
        e1?.rating == e2?.rating &&
        e1?.text == e2?.text &&
        e1?.date == e2?.date &&
        e1?.foundHelpfulCount == e2?.foundHelpfulCount &&
        e1?.isHelpfull == e2?.isHelpfull;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality().hash([
        e?.userName,
        e?.rating,
        e?.text,
        e?.date,
        e?.foundHelpfulCount,
        e?.isHelpfull
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
