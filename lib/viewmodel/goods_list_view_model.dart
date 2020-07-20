
import 'package:rok/common/base/base_view_model.dart';

class GoodsListViewModel extends BaseViewModel {
//  List<CategoryProductInfoModel> goodList = [];
//
//  Future getGoodsList(id, int page, controller) async {
//
//    if (goodList.isEmpty) {
//      state = BaseState.LOADING;
//      notifyListeners();
//    }
//    DataResult res = await YpGatewayDao.getGoodList(id, page);
//    if (res.success) {
//      CategoryProductListModel listModel = res.data;
//
//      if (listModel != null && listModel.list.length > 0) {
//        if (page == 1) {
//          goodList = [];
//          controller.finishRefresh(success: true);
//        }
//        if (goodList.length < 1000){
//          controller.finishLoad(
//              success: true, noMore: !listModel.pageInfo.hasNext);
//          goodList.addAll(listModel.list);
//        }else{
//          controller.finishLoad(
//              success: true, noMore: true);
//        }
//        if (goodList.isEmpty) {
//          state = BaseState.EMPTY;
//        } else {
//          state = BaseState.CONTENT;
//        }
//        notifyListeners();
//      } else {
//        if (page == 1) {
//          state = BaseState.EMPTY;
//          notifyListeners();
//        }
//      }
//    } else {
//      if (page == 1) {
//        state = BaseState.FAIL;
//        notifyListeners();
//      }
//
//    }
//  }
}
