import 'package:school/Feature/home/Student/Data/models/ImportantAnnouncementModel.dart';

class ImportantAnnouncementResponseModel {
  final bool? success;
  final List<ImportantAnnouncementModel>? data;

  ImportantAnnouncementResponseModel({
    this.success,
    this.data,
  });

  factory ImportantAnnouncementResponseModel.fromJson(Map<String, dynamic> json) {
    return ImportantAnnouncementResponseModel(
      success: json['success'],
      data: json['data'] != null
          ? (json['data'] as List)
              .map((item) => ImportantAnnouncementModel.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}