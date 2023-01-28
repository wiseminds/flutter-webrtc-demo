import 'package:flutter/cupertino.dart';
import 'package:webrtc_demo/utils/utils.dart';

class RoomProvider extends ValueNotifier<String> {
  final String peerId;
  RoomProvider(super.value) : peerId = Utils.randomString(10);
}
