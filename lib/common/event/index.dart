import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class HttpErrorEvent {
  final int code;

  final String message;

  HttpErrorEvent(this.code, this.message);
}

// 选择后滑动
class ScrollToItemEvent {
  final int indexSel;

  ScrollToItemEvent(this.indexSel);
}

// 切换tab
class SelTabEvent {
  final int indexSel;

  SelTabEvent(this.indexSel);
}

// 无网络
class NoNet {
  final bool notNet;
  NoNet(this.notNet);
}
