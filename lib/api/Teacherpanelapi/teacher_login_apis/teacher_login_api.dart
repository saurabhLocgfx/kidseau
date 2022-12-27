import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';

class TeacherLogin {
  Future<dynamic> get({required String email}) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('$kAPIConst/kids/api_teacher_login/teacher_login.php'));
    request.fields.addAll({'t_email_phone': email});
    print(request.fields);
    http.StreamedResponse response = await request.send();
    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return resp;
    } else {
      print(response.reasonPhrase);

      return resp;
    }
  }
}
