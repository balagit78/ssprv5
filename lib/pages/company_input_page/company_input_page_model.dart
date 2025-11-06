import '/flutter_flow/flutter_flow_util.dart';
import 'company_input_page_widget.dart' show CompanyInputPageWidget;
import 'package:flutter/material.dart';

class CompanyInputPageModel extends FlutterFlowModel<CompanyInputPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CompanyNameTextField widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameTextController;
  String? Function(BuildContext, String?)? companyNameTextControllerValidator;
  
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();
  }
}

