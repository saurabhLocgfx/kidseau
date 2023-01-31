class KidVoucherDetailModel {
  int? status;
  String? voucherId;
  String? currentCode;
  String? validTill;
  String? issuedBy;
  String? issuedData;
  String? issuedFor;
  String? kidId;

  KidVoucherDetailModel(
      {this.status,
      this.voucherId,
      this.currentCode,
      this.validTill,
      this.issuedBy,
      this.issuedData,
      this.issuedFor,
      this.kidId});

  KidVoucherDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    voucherId = json['voucherId'];
    currentCode = json['currentCode'];
    validTill = json['validTill'];
    issuedBy = json['issuedBy'];
    issuedData = json['issuedData'];
    issuedFor = json['issuedFor'];
    kidId = json['kid_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['voucherId'] = this.voucherId;
    data['currentCode'] = this.currentCode;
    data['validTill'] = this.validTill;
    data['issuedBy'] = this.issuedBy;
    data['issuedData'] = this.issuedData;
    data['issuedFor'] = this.issuedFor;
    data['kid_id'] = this.kidId;
    return data;
  }
}
