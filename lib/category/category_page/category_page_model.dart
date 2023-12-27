import '/backend/backend.dart';
import '/category/app_bar/app_bar_widget.dart';
import '/category/category_view/category_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'category_page_widget.dart' show CategoryPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryPageModel extends FlutterFlowModel<CategoryPageWidget> {
  ///  Local state fields for this page.

  String title = 'N/A';

  CategoriesRecord? category;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBar component.
  late AppBarModel appBarModel;
  // Model for CategoryView component.
  late CategoryViewModel categoryViewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    categoryViewModel = createModel(context, () => CategoryViewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    categoryViewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
