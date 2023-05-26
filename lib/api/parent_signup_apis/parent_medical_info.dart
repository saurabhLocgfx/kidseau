import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kidseau/Constants/string_const.dart';
import 'package:kidseau/shard_prefs/shared_prefs.dart';

class ParentMedicalInfo {
  Future<dynamic> get(
      {required String bloodGrp,
      required String weight,
      required String height,
      required String medicalStatus,
      required String exCare,
      required bool father,
      required bool mother,
      required bool kid,
      required bool birth,
      required bool twoMonth,
      required bool fourMonth,
      required bool elevenMonth,
      required bool twelveMonth,
      required bool eighteenMonth,
      required bool sixYears}) async {
    List<String> covidVac = [];
    List<String> otherVac = [];
    if (father) {
      covidVac.add('father');
    }
    if (mother) {
      covidVac.add('mother');
    }
    if (kid) {
      covidVac.add('kid');
    }

    if (birth) {
      otherVac.add('BCG/AVB@Birth');
    }
    if (twoMonth) {
      otherVac.add('VPI-HVB@2 Months');
    }
    if (fourMonth) {
      otherVac.add('VPI-AVB@4 Months');
    }
    if (elevenMonth) {
      otherVac.add('ROR@11 Months');
    }
    if (twelveMonth) {
      otherVac.add('VPI-HVB@12 Months');
    }
    if (eighteenMonth) {
      otherVac.add('ROR@18 Months');
    }
    if (sixYears) {
      otherVac.add('D-TCA@6 Years');
    }
    String? cookie = UserPrefs.getCookies();
    var headers = {'Cookie': 'PHPSESSID=$cookie'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('$kAPIConst/api_parent_login/pt_kd_medinfo.php'));
    request.fields.addAll({
      'bld_grp': bloodGrp,
      'weight': weight,
      'height': height,
      'medical_status': medicalStatus,
      'ex_care': exCare,
      'covid_vaccination': '$covidVac',
      'other_vacc': '$otherVac',
    });
    log(request.fields.toString());

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var v = jsonDecode(await response.stream.bytesToString());
    log(v.toString());
    if (response.statusCode == 200) {
      return v;
    } else {
      print(response.reasonPhrase);
      return v;
    }
  }
}
