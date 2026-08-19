import 'package:flutter/material.dart';

class EventModel {
  final String day;
  final String month;
  final String title;
  final String subtitle;
  final Color background;

  EventModel({
    required this.day,
    required this.month,
    required this.subtitle,
    required this.title,
    required this.background,
  });
}

class ActivitiesModel {
  final String category;
  final String tag;
  final String time;
  final String title;
  final String description;
  final String? filename;
  final String? filesize;
  final Color tagColor;
  final bool showMore;
  final bool showMenu;
  final bool showImage;
  final String? imageUrl;

  ActivitiesModel({
    required this.category,
    required this.description,
    required this.tag,
    required this.time,
    required this.tagColor,
    required this.title,
    required this.showMore,
    required this.showImage,
    this.showMenu = false,
    this.filename,
    this.filesize,
    this.imageUrl,
  });
}
