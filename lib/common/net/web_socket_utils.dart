

import 'dart:convert';

import 'package:rok/common/model/socket_base_model.dart';
import 'package:rok/common/net/address.dart';
import 'package:rok/common/style/style.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketUtils {

  static  WebSocketChannel channel = IOWebSocketChannel.connect(getWebSocketAddress(2));




  static void listen(ch,Function call){
    channel.stream.listen((message) {
      var model = SocketBaseModel.fromJson(jsonDecode(message));
      switch(ch){
        case "market.ethusdt.kline.1day":

          call(model);
          break;
        case "market.ethusdt.kline.1day":
          break;
        default:
          break;
      }

    });
}

}