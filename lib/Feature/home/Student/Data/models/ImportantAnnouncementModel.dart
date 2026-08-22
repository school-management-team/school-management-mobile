class ImportantAnnouncementModel {
  final int? id;
  final int? supervisorId;
  final String? title;
  final String? description;
  final String? type;
  final bool? isImportant;
  final String? date;
  final String? endDate;
  final String? imagePath;
  final String? attachmentPath;
  final String? createdAt;
  final String? updatedAt;
  final int? daysCount;
  final bool? isMultiDay;

  ImportantAnnouncementModel({
    this.id,
    this.supervisorId,
    this.title,
    this.description,
    this.type,
    this.isImportant,
    this.date,
    this.endDate,
    this.imagePath,
    this.attachmentPath,
    this.createdAt,
    this.updatedAt,
    this.daysCount,
    this.isMultiDay,
  });

  factory ImportantAnnouncementModel.fromJson(Map<String, dynamic> json) {
    return ImportantAnnouncementModel(
      id: json['id'],
      supervisorId: json['supervisor_id'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
      isImportant: json['is_important'],
      date: json['date'],
      endDate: json['end_date'],
      imagePath: json['image_path'],
      attachmentPath: json['attachment_path'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      daysCount: json['days_count'],
      isMultiDay: json['is_multi_day'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'supervisor_id': supervisorId,
      'title': title,
      'description': description,
      'type': type,
      'is_important': isImportant,
      'date': date,
      'end_date': endDate,
      'image_path': imagePath,
      'attachment_path': attachmentPath,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'days_count': daysCount,
      'is_multi_day': isMultiDay,
    };
  }
}