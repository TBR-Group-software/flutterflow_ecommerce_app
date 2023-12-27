import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/catalogue/categories_bottom_sheet/categories_bottom_sheet_widget.dart';
import '/components/product_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/see_all/see_all_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SeeAll component.
  late SeeAllModel seeAllModel;
  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>? gridViewPagingController;
  Query? gridViewPagingQuery;
  List<StreamSubscription?> gridViewStreamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    seeAllModel = createModel(context, () => SeeAllModel());
  }

  void dispose() {
    seeAllModel.dispose();
    gridViewStreamSubscriptions.forEach((s) => s?.cancel());
    gridViewPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, ProductsRecord> setGridViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController ??= _createGridViewController(query, parent);
    if (gridViewPagingQuery != query) {
      gridViewPagingQuery = query;
      gridViewPagingController?.refresh();
    }
    return gridViewPagingController!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord> _createGridViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          queryBuilder: (_) => gridViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions,
          controller: controller,
          pageSize: 4,
          isStream: true,
        ),
      );
  }
}
