import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

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

//加购回调
class AddCartEvent {
  final int shipType;

  AddCartEvent(this.shipType);
}

//刷新购物车
class GetShopCartList {
  GetShopCartList();
}


//刷新分类列表
class RefreshCategoryList {
  RefreshCategoryList();
}
//刷新订单列表
class RefreshOrderList {
  RefreshOrderList();
}

//获取购物车
class GetShopCartNum{
  final int num;
  GetShopCartNum(this.num);
}

//支付结果
class GetPayResult{
  final int num;
  GetPayResult(this.num);
}

// 用户不存在
class UserNoHave{
  UserNoHave();
}

// 无网络
class NoNet{
  final bool notNet;
  NoNet(this.notNet);
}