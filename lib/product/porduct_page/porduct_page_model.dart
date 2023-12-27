import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/product_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/product/product_bottom_bar/product_bottom_bar_widget.dart';
import '/product/review/review_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'porduct_page_widget.dart' show PorductPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PorductPageModel extends FlutterFlowModel<PorductPageWidget> {
  ///  Local state fields for this page.

  List<ColorsRecord> selectedColor = [];
  void addToSelectedColor(ColorsRecord item) => selectedColor.add(item);
  void removeFromSelectedColor(ColorsRecord item) => selectedColor.remove(item);
  void removeAtIndexFromSelectedColor(int index) =>
      selectedColor.removeAt(index);
  void insertAtIndexInSelectedColor(int index, ColorsRecord item) =>
      selectedColor.insert(index, item);
  void updateSelectedColorAtIndex(int index, Function(ColorsRecord) updateFn) =>
      selectedColor[index] = updateFn(selectedColor[index]);

  List<SizesRecord> selectedSizes = [];
  void addToSelectedSizes(SizesRecord item) => selectedSizes.add(item);
  void removeFromSelectedSizes(SizesRecord item) => selectedSizes.remove(item);
  void removeAtIndexFromSelectedSizes(int index) =>
      selectedSizes.removeAt(index);
  void insertAtIndexInSelectedSizes(int index, SizesRecord item) =>
      selectedSizes.insert(index, item);
  void updateSelectedSizesAtIndex(int index, Function(SizesRecord) updateFn) =>
      selectedSizes[index] = updateFn(selectedSizes[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for review component.
  late ReviewModel reviewModel;
  // Model for ProductBottomBar component.
  late ProductBottomBarModel productBottomBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    reviewModel = createModel(context, () => ReviewModel());
    productBottomBarModel = createModel(context, () => ProductBottomBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    reviewModel.dispose();
    productBottomBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
