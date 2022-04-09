import 'dart:io';
import 'package:flutter/foundation.dart';

import '../Models/User.dart';

class Navigation with ChangeNotifier, DiagnosticableTreeMixin {
  int _index = 1;

  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }
}
