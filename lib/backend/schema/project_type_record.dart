import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectTypeRecord extends FirestoreRecord {
  ProjectTypeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "App" field.
  String? _app;
  String get app => _app ?? '';
  bool hasApp() => _app != null;

  // "Website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "Classes" field.
  String? _classes;
  String get classes => _classes ?? '';
  bool hasClasses() => _classes != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _app = snapshotData['App'] as String?;
    _website = snapshotData['Website'] as String?;
    _classes = snapshotData['Classes'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('project_type')
          : FirebaseFirestore.instance.collectionGroup('project_type');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('project_type').doc();

  static Stream<ProjectTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectTypeRecord.fromSnapshot(s));

  static Future<ProjectTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectTypeRecord.fromSnapshot(s));

  static ProjectTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectTypeRecordData({
  String? app,
  String? website,
  String? classes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'App': app,
      'Website': website,
      'Classes': classes,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectTypeRecordDocumentEquality implements Equality<ProjectTypeRecord> {
  const ProjectTypeRecordDocumentEquality();

  @override
  bool equals(ProjectTypeRecord? e1, ProjectTypeRecord? e2) {
    return e1?.app == e2?.app &&
        e1?.website == e2?.website &&
        e1?.classes == e2?.classes;
  }

  @override
  int hash(ProjectTypeRecord? e) =>
      const ListEquality().hash([e?.app, e?.website, e?.classes]);

  @override
  bool isValidKey(Object? o) => o is ProjectTypeRecord;
}
