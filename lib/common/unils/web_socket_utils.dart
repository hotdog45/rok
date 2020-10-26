

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketUtils {
  static  WebSocketChannel channel = IOWebSocketChannel.connect("ws://10.0.61.79:8003");
  // static  WebSocketChannel channel = IOWebSocketChannel.connect("ws://2888300uv3.qicp.vip/");




}