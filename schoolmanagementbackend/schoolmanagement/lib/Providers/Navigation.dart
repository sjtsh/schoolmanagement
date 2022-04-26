import 'dart:io';
import 'package:flutter/foundation.dart';

import '../Models/User.dart';

class Navigation with ChangeNotifier, DiagnosticableTreeMixin {
  int _index = 1;


  User? _meUser;
  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }

  User? get meUser => _meUser;

  set meUser(User? value) {
    _meUser = value;
    notifyListeners();
  }
  setUser(User? value){
  _meUser = value;
  }
}
