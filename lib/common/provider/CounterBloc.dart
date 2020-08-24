import 'dart:async';

import 'package:flutter/material.dart';

class CounterBloc {
  StreamController<int> _streamController;
  Stream<int> _stream;
  int _count;

  CounterBloc() {
    _count = 0;
    _streamController = StreamController.broadcast();
    _stream = _streamController.stream;
  }

  Stream<int> get stream => _stream;
  int get count => _count;

  setCounter(count) {
    _streamController.sink.add(count);
  }

  dispose() {
    _streamController.close();
  }
}

class KeyWordsBloc {
  StreamController<String> _streamController;
  Stream<String> _stream;
  String _keyWords;

  KeyWordsBloc() {
    _keyWords = "";
    _streamController = StreamController.broadcast();
    _stream = _streamController.stream;
  }

  Stream<String> get stream => _stream;
  String get keyWords => _keyWords;

  setKeyWords(keyWords) {
    _streamController.sink.add(keyWords);
  }

  dispose() {
    _streamController.close();
  }
}

class ProviderModel extends ChangeNotifier {
  int _count = 0;
  String _token = "";

  int get count => _count;
  String get token => _token;

  void setCount(count) {
    _count = count;
    notifyListeners();
  }

  void setToken(token) {
    _token = token;
    notifyListeners();
  }
}
