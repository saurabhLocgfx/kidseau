import 'dart:developer';

import 'check_msg.dart';

class MessageRepo {
  final CheckMessage _message = CheckMessage();
  bool _retVal = false;
  Future<bool> newMsg() async {
    final resp = await CheckMessage().get();
    if (resp == false) {
      _retVal = false;
    } else {
      log("new msg $resp");
      if (resp['msg'] == true) {
        _retVal = true;
      } else {
        _retVal = false;
      }
    }
    return _retVal;
  }
}
