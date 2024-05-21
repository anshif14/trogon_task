

// To parse this JSON data, do
//
//     final homeMenuModel = homeMenuModelFromJson(jsonString);

import 'dart:ui';

import 'package:meta/meta.dart';
import 'dart:convert';

HomeMenuModel homeMenuModelFromJson(String str) => HomeMenuModel.fromJson(json.decode(str));

String homeMenuModelToJson(HomeMenuModel data) => json.encode(data.toJson());

class HomeMenuModel {
  final String icon;
  final List<Color> bgcolors;
  final String title;
  final Color titleBg;

  HomeMenuModel({
    required this.icon,
    required this.bgcolors,
    required this.title,
    required this.titleBg,
  });

  HomeMenuModel copyWith({
    String? icon,
    List<Color>? bgcolors,
    String? title,
    Color? titleBg,
  }) =>
      HomeMenuModel(
        icon: icon ?? this.icon,
        bgcolors: bgcolors ?? this.bgcolors,
        title: title ?? this.title,
        titleBg: titleBg ?? this.titleBg,
      );

  factory HomeMenuModel.fromJson(Map<String, dynamic> json) => HomeMenuModel(
    icon: json["icon"],
    bgcolors:json['bgcolors'],
    title: json["title"],
    titleBg: json["titleBg"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
    "bgcolors": List<dynamic>.from(bgcolors.map((x) => x)),
    "title": title,
    "titleBg": titleBg,
  };
}
