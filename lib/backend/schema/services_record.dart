import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicesRecord extends FirestoreRecord {
  ServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "price_range" field.
  String? _priceRange;
  String get priceRange => _priceRange ?? '';
  bool hasPriceRange() => _priceRange != null;

  // "HomeID" field.
  int? _homeID;
  int get homeID => _homeID ?? 0;
  bool hasHomeID() => _homeID != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _photo = snapshotData['photo'] as String?;
    _priceRange = snapshotData['price_range'] as String?;
    _homeID = castToType<int>(snapshotData['HomeID']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('services');

  static Stream<ServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicesRecord.fromSnapshot(s));

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicesRecord.fromSnapshot(s));

  static ServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicesRecordData({
  String? name,
  String? description,
  String? photo,
  String? priceRange,
  int? homeID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'photo': photo,
      'price_range': priceRange,
      'HomeID': homeID,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicesRecordDocumentEquality implements Equality<ServicesRecord> {
  const ServicesRecordDocumentEquality();

  @override
  bool equals(ServicesRecord? e1, ServicesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.photo == e2?.photo &&
        e1?.priceRange == e2?.priceRange &&
        e1?.homeID == e2?.homeID;
  }

  @override
  int hash(ServicesRecord? e) => const ListEquality()
      .hash([e?.name, e?.description, e?.photo, e?.priceRange, e?.homeID]);

  @override
  bool isValidKey(Object? o) => o is ServicesRecord;
}
