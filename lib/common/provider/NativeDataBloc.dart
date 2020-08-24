import 'dart:async';

class NativeDataBloc {
  StreamController<String> _streamController;
  Stream<String> _stream;
  String _token;

  NativeDataBloc() {
    _token = "";
    _streamController = StreamController.broadcast();
    _stream = _streamController.stream;
  }

  Stream<String> get stream => _stream;
  String get token => _token;

  setToken(token) {
    _streamController.sink.add(token);
  }

  dispose() {
    _streamController.close();
  }
}
