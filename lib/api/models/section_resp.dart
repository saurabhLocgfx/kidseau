class SectionResponse {
  SectionResponse({
    required this.status,
    required this.sections,
  });
  late final int status;
  late final List<AllSections> sections;

  SectionResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sections = List.from(json['All SECTION THIS SCHOOL '])
        .map((e) => AllSections.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['All SECTION THIS SCHOOL '] =
        sections.map((e) => e.toJson()).toList();
    return _data;
  }
}

class AllSections {
  AllSections({
    required this.secId,
    required this.secName,
  });
  late final String secId;
  late final String secName;

  AllSections.fromJson(Map<String, dynamic> json) {
    secId = json['sec_id'];
    secName = json['sec_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sec_id'] = secId;
    _data['sec_name'] = secName;
    return _data;
  }
}
