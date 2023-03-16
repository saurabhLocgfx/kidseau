class KidGroupsResponse {
  KidGroupsResponse({
    required this.status,
    required this.groupWithSection,
  });
  late final int status;
  late final List<GroupWithSection> groupWithSection;

  KidGroupsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    groupWithSection = List.from(json['groupWithSection'])
        .map((e) => GroupWithSection.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['groupWithSection'] = groupWithSection.map((e) => e.toJson()).toList();
    return data;
  }
}

class GroupWithSection {
  GroupWithSection({
    required this.grpName,
    required this.syllabusId,
  });
  late final String grpName;
  late final String syllabusId;

  GroupWithSection.fromJson(Map<String, dynamic> json) {
    grpName = json['grp_name'];
    syllabusId = json['syllabus_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['grp_name'] = grpName;
    data['syllabus_id'] = syllabusId;
    return data;
  }
}
