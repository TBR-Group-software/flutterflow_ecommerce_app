import '/backend/backend.dart';
import '/category/filter_app_bar/filter_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'filters_widget.dart' show FiltersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FiltersModel extends FlutterFlowModel<FiltersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for filterAppBar component.
  late FilterAppBarModel filterAppBarModel;
  // State field(s) for CategoriesDown widget.
  String? categoriesDownValue;
  FormFieldController<String>? categoriesDownValueController;
  // State field(s) for BrandsDown widget.
  List<String>? brandsDownValue;
  FormFieldController<String>? brandsDownValueController;
  // State field(s) for SortByDown widget.
  String? sortByDownValue;
  FormFieldController<String>? sortByDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    filterAppBarModel = createModel(context, () => FilterAppBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    filterAppBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
