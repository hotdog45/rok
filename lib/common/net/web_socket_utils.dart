

import 'package:rok/common/net/address.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketUtils {

  static  WebSocketChannel channel = IOWebSocketChannel.connect(getWebSocketAddress(2));




}