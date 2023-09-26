import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestsRecord extends FirestoreRecord {
  RequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "project_name" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  bool hasProjectName() => _projectName != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "budget" field.
  int? _budget;
  int get budget => _budget ?? 0;
  bool hasBudget() => _budget != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "adminMessage" field.
  String? _adminMessage;
  String get adminMessage => _adminMessage ?? '';
  bool hasAdminMessage() => _adminMessage != null;

  void _initializeFields() {
    _projectName = snapshotData['project_name'] as String?;
    _details = snapshotData['details'] as String?;
    _budget = castToType<int>(snapshotData['budget']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _email = snapshotData['email'] as String?;
    _status = snapshotData['status'] as String?;
    _adminMessage = snapshotData['adminMessage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Requests');

  static Stream<RequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestsRecord.fromSnapshot(s));

  static Future<RequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestsRecord.fromSnapshot(s));

  static RequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestsRecordData({
  String? projectName,
  String? details,
  int? budget,
  DocumentReference? userRef,
  String? email,
  String? status,
  String? adminMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'project_name': projectName,
      'details': details,
      'budget': budget,
      'userRef': userRef,
      'email': email,
      'status': status,
      'adminMessage': adminMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestsRecordDocumentEquality implements Equality<RequestsRecord> {
  const RequestsRecordDocumentEquality();

  @override
  bool equals(RequestsRecord? e1, RequestsRecord? e2) {
    return e1?.projectName == e2?.projectName &&
        e1?.details == e2?.details &&
        e1?.budget == e2?.budget &&
        e1?.userRef == e2?.userRef &&
        e1?.email == e2?.email &&
        e1?.status == e2?.status &&
        e1?.adminMessage == e2?.adminMessage;
  }

  @override
  int hash(RequestsRecord? e) => const ListEquality().hash([
        e?.projectName,
        e?.details,
        e?.budget,
        e?.userRef,
        e?.email,
        e?.status,
        e?.adminMessage
      ]);

  @override
  bool isValidKey(Object? o) => o is RequestsRecord;
}
