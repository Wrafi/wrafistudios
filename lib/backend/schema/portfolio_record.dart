import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PortfolioRecord extends FirestoreRecord {
  PortfolioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "project_details" field.
  String? _projectDetails;
  String get projectDetails => _projectDetails ?? '';
  bool hasProjectDetails() => _projectDetails != null;

  // "year_created" field.
  int? _yearCreated;
  int get yearCreated => _yearCreated ?? 0;
  bool hasYearCreated() => _yearCreated != null;

  // "client_name" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  bool hasClientName() => _clientName != null;

  // "tools_used" field.
  String? _toolsUsed;
  String get toolsUsed => _toolsUsed ?? '';
  bool hasToolsUsed() => _toolsUsed != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "app" field.
  bool? _app;
  bool get app => _app ?? false;
  bool hasApp() => _app != null;

  // "website" field.
  bool? _website;
  bool get website => _website ?? false;
  bool hasWebsite() => _website != null;

  // "classes" field.
  bool? _classes;
  bool get classes => _classes ?? false;
  bool hasClasses() => _classes != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _projectDetails = snapshotData['project_details'] as String?;
    _yearCreated = castToType<int>(snapshotData['year_created']);
    _clientName = snapshotData['client_name'] as String?;
    _toolsUsed = snapshotData['tools_used'] as String?;
    _link = snapshotData['link'] as String?;
    _photo = snapshotData['photo'] as String?;
    _app = snapshotData['app'] as bool?;
    _website = snapshotData['website'] as bool?;
    _classes = snapshotData['classes'] as bool?;
    _type = snapshotData['type'] as String?;
    _logo = snapshotData['logo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('portfolio');

  static Stream<PortfolioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PortfolioRecord.fromSnapshot(s));

  static Future<PortfolioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PortfolioRecord.fromSnapshot(s));

  static PortfolioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PortfolioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PortfolioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PortfolioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PortfolioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PortfolioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPortfolioRecordData({
  String? name,
  String? projectDetails,
  int? yearCreated,
  String? clientName,
  String? toolsUsed,
  String? link,
  String? photo,
  bool? app,
  bool? website,
  bool? classes,
  String? type,
  String? logo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'project_details': projectDetails,
      'year_created': yearCreated,
      'client_name': clientName,
      'tools_used': toolsUsed,
      'link': link,
      'photo': photo,
      'app': app,
      'website': website,
      'classes': classes,
      'type': type,
      'logo': logo,
    }.withoutNulls,
  );

  return firestoreData;
}

class PortfolioRecordDocumentEquality implements Equality<PortfolioRecord> {
  const PortfolioRecordDocumentEquality();

  @override
  bool equals(PortfolioRecord? e1, PortfolioRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.projectDetails == e2?.projectDetails &&
        e1?.yearCreated == e2?.yearCreated &&
        e1?.clientName == e2?.clientName &&
        e1?.toolsUsed == e2?.toolsUsed &&
        e1?.link == e2?.link &&
        e1?.photo == e2?.photo &&
        e1?.app == e2?.app &&
        e1?.website == e2?.website &&
        e1?.classes == e2?.classes &&
        e1?.type == e2?.type &&
        e1?.logo == e2?.logo;
  }

  @override
  int hash(PortfolioRecord? e) => const ListEquality().hash([
        e?.name,
        e?.projectDetails,
        e?.yearCreated,
        e?.clientName,
        e?.toolsUsed,
        e?.link,
        e?.photo,
        e?.app,
        e?.website,
        e?.classes,
        e?.type,
        e?.logo
      ]);

  @override
  bool isValidKey(Object? o) => o is PortfolioRecord;
}
