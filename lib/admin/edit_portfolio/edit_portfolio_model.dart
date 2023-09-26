import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPortfolioModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for client widget.
  TextEditingController? clientController;
  String? Function(BuildContext, String?)? clientControllerValidator;
  // State field(s) for tools widget.
  TextEditingController? toolsController;
  String? Function(BuildContext, String?)? toolsControllerValidator;
  // State field(s) for link widget.
  TextEditingController? linkController1;
  String? Function(BuildContext, String?)? linkController1Validator;
  // State field(s) for link widget.
  TextEditingController? linkController2;
  String? Function(BuildContext, String?)? linkController2Validator;
  // State field(s) for projectDetails widget.
  TextEditingController? projectDetailsController;
  String? Function(BuildContext, String?)? projectDetailsControllerValidator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nameController?.dispose();
    clientController?.dispose();
    toolsController?.dispose();
    linkController1?.dispose();
    linkController2?.dispose();
    projectDetailsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
