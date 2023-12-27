import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String _value) {
    _phoneNumber = _value;
  }

  int _pageNumber = 1;
  int get pageNumber => _pageNumber;
  set pageNumber(int _value) {
    _pageNumber = _value;
  }

  bool _cartOpened = false;
  bool get cartOpened => _cartOpened;
  set cartOpened(bool _value) {
    _cartOpened = _value;
  }

  int _filterPriceLower = 0;
  int get filterPriceLower => _filterPriceLower;
  set filterPriceLower(int _value) {
    _filterPriceLower = _value;
  }

  int _filterPriceHigher = 8000;
  int get filterPriceHigher => _filterPriceHigher;
  set filterPriceHigher(int _value) {
    _filterPriceHigher = _value;
  }

  String _firterProductTypeId = '3IsjNApvCaUKWQyC0fl0';
  String get firterProductTypeId => _firterProductTypeId;
  set firterProductTypeId(String _value) {
    _firterProductTypeId = _value;
  }

  List<String> _filterSizes = ['XS', 'M'];
  List<String> get filterSizes => _filterSizes;
  set filterSizes(List<String> _value) {
    _filterSizes = _value;
  }

  void addToFilterSizes(String _value) {
    _filterSizes.add(_value);
  }

  void removeFromFilterSizes(String _value) {
    _filterSizes.remove(_value);
  }

  void removeAtIndexFromFilterSizes(int _index) {
    _filterSizes.removeAt(_index);
  }

  void updateFilterSizesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _filterSizes[_index] = updateFn(_filterSizes[_index]);
  }

  void insertAtIndexInFilterSizes(int _index, String _value) {
    _filterSizes.insert(_index, _value);
  }

  String _filterSortBy = '';
  String get filterSortBy => _filterSortBy;
  set filterSortBy(String _value) {
    _filterSortBy = _value;
  }

  List<String> _filterBrands = [];
  List<String> get filterBrands => _filterBrands;
  set filterBrands(List<String> _value) {
    _filterBrands = _value;
  }

  void addToFilterBrands(String _value) {
    _filterBrands.add(_value);
  }

  void removeFromFilterBrands(String _value) {
    _filterBrands.remove(_value);
  }

  void removeAtIndexFromFilterBrands(int _index) {
    _filterBrands.removeAt(_index);
  }

  void updateFilterBrandsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _filterBrands[_index] = updateFn(_filterBrands[_index]);
  }

  void insertAtIndexInFilterBrands(int _index, String _value) {
    _filterBrands.insert(_index, _value);
  }

  List<Color> _filterColors = [];
  List<Color> get filterColors => _filterColors;
  set filterColors(List<Color> _value) {
    _filterColors = _value;
  }

  void addToFilterColors(Color _value) {
    _filterColors.add(_value);
  }

  void removeFromFilterColors(Color _value) {
    _filterColors.remove(_value);
  }

  void removeAtIndexFromFilterColors(int _index) {
    _filterColors.removeAt(_index);
  }

  void updateFilterColorsAtIndex(
    int _index,
    Color Function(Color) updateFn,
  ) {
    _filterColors[_index] = updateFn(_filterColors[_index]);
  }

  void insertAtIndexInFilterColors(int _index, Color _value) {
    _filterColors.insert(_index, _value);
  }

  List<DocumentReference> _filterColorIds = [];
  List<DocumentReference> get filterColorIds => _filterColorIds;
  set filterColorIds(List<DocumentReference> _value) {
    _filterColorIds = _value;
  }

  void addToFilterColorIds(DocumentReference _value) {
    _filterColorIds.add(_value);
  }

  void removeFromFilterColorIds(DocumentReference _value) {
    _filterColorIds.remove(_value);
  }

  void removeAtIndexFromFilterColorIds(int _index) {
    _filterColorIds.removeAt(_index);
  }

  void updateFilterColorIdsAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _filterColorIds[_index] = updateFn(_filterColorIds[_index]);
  }

  void insertAtIndexInFilterColorIds(int _index, DocumentReference _value) {
    _filterColorIds.insert(_index, _value);
  }

  List<DocumentReference> _filterBrandIds = [];
  List<DocumentReference> get filterBrandIds => _filterBrandIds;
  set filterBrandIds(List<DocumentReference> _value) {
    _filterBrandIds = _value;
  }

  void addToFilterBrandIds(DocumentReference _value) {
    _filterBrandIds.add(_value);
  }

  void removeFromFilterBrandIds(DocumentReference _value) {
    _filterBrandIds.remove(_value);
  }

  void removeAtIndexFromFilterBrandIds(int _index) {
    _filterBrandIds.removeAt(_index);
  }

  void updateFilterBrandIdsAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _filterBrandIds[_index] = updateFn(_filterBrandIds[_index]);
  }

  void insertAtIndexInFilterBrandIds(int _index, DocumentReference _value) {
    _filterBrandIds.insert(_index, _value);
  }

  List<DocumentReference> _filterSizesIds = [];
  List<DocumentReference> get filterSizesIds => _filterSizesIds;
  set filterSizesIds(List<DocumentReference> _value) {
    _filterSizesIds = _value;
  }

  void addToFilterSizesIds(DocumentReference _value) {
    _filterSizesIds.add(_value);
  }

  void removeFromFilterSizesIds(DocumentReference _value) {
    _filterSizesIds.remove(_value);
  }

  void removeAtIndexFromFilterSizesIds(int _index) {
    _filterSizesIds.removeAt(_index);
  }

  void updateFilterSizesIdsAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _filterSizesIds[_index] = updateFn(_filterSizesIds[_index]);
  }

  void insertAtIndexInFilterSizesIds(int _index, DocumentReference _value) {
    _filterSizesIds.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
