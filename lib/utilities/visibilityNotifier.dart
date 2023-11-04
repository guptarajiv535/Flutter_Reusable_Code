import 'package:flutter/material.dart';

class VisibilityNotifier extends ChangeNotifier {
  bool _isVisible = false;

  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }
}
