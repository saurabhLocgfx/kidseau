class ParentKidFeesModel {
  int? status;
  int? remainingFees;
  String? totalFees;
  List<PreviousPayment>? previousPayment;

  ParentKidFeesModel(
      {this.status, this.remainingFees, this.totalFees, this.previousPayment});

  ParentKidFeesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    remainingFees = json['remainingFees'];
    totalFees = json['totalFees'];
    if (json['previousPayment'] != null) {
      previousPayment = <PreviousPayment>[];
      json['previousPayment'].forEach((v) {
        previousPayment!.add(new PreviousPayment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['remainingFees'] = this.remainingFees;
    data['totalFees'] = this.totalFees;
    if (this.previousPayment != null) {
      data['previousPayment'] =
          this.previousPayment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PreviousPayment {
  String? schoolImage;
  String? schoolName;
  String? date;
  String? paidFees;

  PreviousPayment(
      {this.schoolImage, this.schoolName, this.date, this.paidFees});

  PreviousPayment.fromJson(Map<String, dynamic> json) {
    schoolImage = json['schoolImage'];
    schoolName = json['schoolName'];
    date = json['date'];
    paidFees = json['paid_fees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolImage'] = this.schoolImage;
    data['schoolName'] = this.schoolName;
    data['date'] = this.date;
    data['paid_fees'] = this.paidFees;
    return data;
  }
}
