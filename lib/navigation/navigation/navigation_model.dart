import '/catalogue/catalogue/catalogue_widget.dart';
import '/catalogue/catalogue_app_bar/catalogue_app_bar_widget.dart';
import '/favorite/favorite/favorite_widget.dart';
import '/favorite/favorite_app_bar/favorite_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/home/home_widget.dart';
import '/home/home_app_bar/home_app_bar_widget.dart';
import '/navigation/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import '/profile/profile/profile_widget.dart';
import 'navigation_widget.dart' show NavigationWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavigationModel extends FlutterFlowModel<NavigationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Home component.
  late HomeModel homeModel;
  // Model for Catalogue component.
  late CatalogueModel catalogueModel;
  // Model for Favorite component.
  late FavoriteModel favoriteModel;
  // Model for Profile component.
  late ProfileModel profileModel;
  // Model for BottomNavigationBar component.
  late BottomNavigationBarModel bottomNavigationBarModel;
  // Model for HomeAppBar component.
  late HomeAppBarModel homeAppBarModel;
  // Model for CatalogueAppBar component.
  late CatalogueAppBarModel catalogueAppBarModel;
  // Model for FavoriteAppBar component.
  late FavoriteAppBarModel favoriteAppBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    homeModel = createModel(context, () => HomeModel());
    catalogueModel = createModel(context, () => CatalogueModel());
    favoriteModel = createModel(context, () => FavoriteModel());
    profileModel = createModel(context, () => ProfileModel());
    bottomNavigationBarModel =
        createModel(context, () => BottomNavigationBarModel());
    homeAppBarModel = createModel(context, () => HomeAppBarModel());
    catalogueAppBarModel = createModel(context, () => CatalogueAppBarModel());
    favoriteAppBarModel = createModel(context, () => FavoriteAppBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    homeModel.dispose();
    catalogueModel.dispose();
    favoriteModel.dispose();
    profileModel.dispose();
    bottomNavigationBarModel.dispose();
    homeAppBarModel.dispose();
    catalogueAppBarModel.dispose();
    favoriteAppBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
