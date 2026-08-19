class ClassGroupModel {
  final String? groupName;
  final int? membersCount;

  ClassGroupModel({
    this.groupName,
    this.membersCount,
  });

  factory ClassGroupModel.fromJson(Map<String, dynamic> json) {
    return ClassGroupModel(
      groupName: json['group_name'],
      membersCount: json['members_count'],
    );
  }
}