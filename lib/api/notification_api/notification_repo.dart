import 'package:kidseau/api/notification_api/notification_check_api.dart';

class NotificationRepo {
  final NotificationCheckApi _checkApi = NotificationCheckApi();
  bool _retVal = false;
  Future<bool> newNot() async {
    final resp = await _checkApi.get();
    if (resp == false) {
      _retVal = false;
    } else {
      //log("new msg $resp");
      if (resp['status'] == 1) {
        if (resp['msg'] == 1) {
          _retVal = true;
        } else {
          _retVal = false;
        }
      } else {
        _retVal = false;
      }
    }
    return _retVal;
  }
}
