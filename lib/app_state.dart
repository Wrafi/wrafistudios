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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _portfolio = prefs
              .getStringList('ff_portfolio')
              ?.map((path) => path.ref)
              .toList() ??
          _portfolio;
    });
    _safeInit(() {
      _portfolio1 = prefs.getString('ff_portfolio1')?.ref ?? _portfolio1;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _portfolio = [];
  List<DocumentReference> get portfolio => _portfolio;
  set portfolio(List<DocumentReference> _value) {
    _portfolio = _value;
    prefs.setStringList('ff_portfolio', _value.map((x) => x.path).toList());
  }

  void addToPortfolio(DocumentReference _value) {
    _portfolio.add(_value);
    prefs.setStringList('ff_portfolio', _portfolio.map((x) => x.path).toList());
  }

  void removeFromPortfolio(DocumentReference _value) {
    _portfolio.remove(_value);
    prefs.setStringList('ff_portfolio', _portfolio.map((x) => x.path).toList());
  }

  void removeAtIndexFromPortfolio(int _index) {
    _portfolio.removeAt(_index);
    prefs.setStringList('ff_portfolio', _portfolio.map((x) => x.path).toList());
  }

  void updatePortfolioAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _portfolio[_index] = updateFn(_portfolio[_index]);
    prefs.setStringList('ff_portfolio', _portfolio.map((x) => x.path).toList());
  }

  void insertAtIndexInPortfolio(int _index, DocumentReference _value) {
    _portfolio.insert(_index, _value);
    prefs.setStringList('ff_portfolio', _portfolio.map((x) => x.path).toList());
  }

  DocumentReference? _portfolio1;
  DocumentReference? get portfolio1 => _portfolio1;
  set portfolio1(DocumentReference? _value) {
    _portfolio1 = _value;
    _value != null
        ? prefs.setString('ff_portfolio1', _value.path)
        : prefs.remove('ff_portfolio1');
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
