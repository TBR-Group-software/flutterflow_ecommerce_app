import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/product_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'category_view_widget.dart' show CategoryViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class CategoryViewModel extends FlutterFlowModel<CategoryViewWidget> {
  ///  Local state fields for this component.

  String allType = '3IsjNApvCaUKWQyC0fl0';

  String sortBy = 'Price: lowest to high';

  ///  State fields for stateful widgets in this component.

  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>?
      gridViewPagingController1;
  Query? gridViewPagingQuery1;
  List<StreamSubscription?> gridViewStreamSubscriptions1 = [];

  // State field(s) for GridView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>?
      gridViewPagingController2;
  Query? gridViewPagingQuery2;
  List<StreamSubscription?> gridViewStreamSubscriptions2 = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    gridViewStreamSubscriptions1.forEach((s) => s?.cancel());
    gridViewPagingController1?.dispose();

    gridViewStreamSubscriptions2.forEach((s) => s?.cancel());
    gridViewPagingController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, ProductsRecord> setGridViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController1 ??= _createGridViewController1(query, parent);
    if (gridViewPagingQuery1 != query) {
      gridViewPagingQuery1 = query;
      gridViewPagingController1?.refresh();
    }
    return gridViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord>
      _createGridViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          queryBuilder: (_) => gridViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProductsRecord> setGridViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    gridViewPagingController2 ??= _createGridViewController2(query, parent);
    if (gridViewPagingQuery2 != query) {
      gridViewPagingQuery2 = query;
      gridViewPagingController2?.refresh();
    }
    return gridViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord>
      _createGridViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          queryBuilder: (_) => gridViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: gridViewStreamSubscriptions2,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
