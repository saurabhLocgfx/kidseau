class GoogleSignInModal {
  int? status;
  String? msg;
  String? oTP;
  String? key;

  GoogleSignInModal({this.status, this.msg, this.oTP, this.key});

  GoogleSignInModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    oTP = json['OTP'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['OTP'] = this.oTP;
    data['key'] = this.key;
    return data;
  }
}