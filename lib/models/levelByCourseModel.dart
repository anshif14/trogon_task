// To parse this JSON data, do
//
//     final levelByCourseModel = levelByCourseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LevelByCourseModel levelByCourseModelFromJson(String str) => LevelByCourseModel.fromJson(json.decode(str));

String levelByCourseModelToJson(LevelByCourseModel data) => json.encode(data.toJson());

class LevelByCourseModel {
  final int status;
  final String message;
  final List<Datum> data;

  LevelByCourseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  LevelByCourseModel copyWith({
    int? status,
    String? message,
    List<Datum>? data,
  }) =>
      LevelByCourseModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory LevelByCourseModel.fromJson(Map<String, dynamic> json) => LevelByCourseModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final String id;
  final String title;
  final List<Lesson> lessons;
  final String completion;

  Datum({
    required this.id,
    required this.title,
    required this.lessons,
    required this.completion,
  });

  Datum copyWith({
    String? id,
    String? title,
    List<Lesson>? lessons,
    String? completion,
  }) =>
      Datum(
        id: id ?? this.id,
        title: title ?? this.title,
        lessons: lessons ?? this.lessons,
        completion: completion ?? this.completion,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    lessons: List<Lesson>.from(json["lessons"].map((x) => Lesson.fromJson(x))),
    completion: json["completion"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "lessons": List<dynamic>.from(lessons.map((x) => x.toJson())),
    "completion": completion,
  };
}

class Lesson {
  final String id;
  final String title;
  final dynamic duration;
  final String courseId;
  final BatchId batchId;
  final String sectionId;
  final dynamic chapterId;
  final String levelId;
  final dynamic videoId;
  final dynamic courseType;
  final dynamic videoType;
  final dynamic videoUrl;
  final String dateAdded;
  final String lastModified;
  final LessonType lessonType;
  final dynamic attachment;
  final String attachmentType;
  final String summary;
  final String activity;
  final String order;
  final dynamic videoTypeForMobileApplication;
  final dynamic videoUrlForMobileApplication;
  final dynamic durationForMobileApplication;
  final dynamic from;
  final dynamic to;
  final ScheduleDate scheduleDate;
  final Free free;

  Lesson({
    required this.id,
    required this.title,
    required this.duration,
    required this.courseId,
    required this.batchId,
    required this.sectionId,
    required this.chapterId,
    required this.levelId,
    required this.videoId,
    required this.courseType,
    required this.videoType,
    required this.videoUrl,
    required this.dateAdded,
    required this.lastModified,
    required this.lessonType,
    required this.attachment,
    required this.attachmentType,
    required this.summary,
    required this.activity,
    required this.order,
    required this.videoTypeForMobileApplication,
    required this.videoUrlForMobileApplication,
    required this.durationForMobileApplication,
    required this.from,
    required this.to,
    required this.scheduleDate,
    required this.free,
  });

  Lesson copyWith({
    String? id,
    String? title,
    dynamic duration,
    String? courseId,
    BatchId? batchId,
    String? sectionId,
    dynamic chapterId,
    String? levelId,
    dynamic videoId,
    dynamic courseType,
    dynamic videoType,
    dynamic videoUrl,
    String? dateAdded,
    String? lastModified,
    LessonType? lessonType,
    dynamic attachment,
    String? attachmentType,
    String? summary,
    String? activity,
    String? order,
    dynamic videoTypeForMobileApplication,
    dynamic videoUrlForMobileApplication,
    dynamic durationForMobileApplication,
    dynamic from,
    dynamic to,
    ScheduleDate? scheduleDate,
    Free? free,
  }) =>
      Lesson(
        id: id ?? this.id,
        title: title ?? this.title,
        duration: duration ?? this.duration,
        courseId: courseId ?? this.courseId,
        batchId: batchId ?? this.batchId,
        sectionId: sectionId ?? this.sectionId,
        chapterId: chapterId ?? this.chapterId,
        levelId: levelId ?? this.levelId,
        videoId: videoId ?? this.videoId,
        courseType: courseType ?? this.courseType,
        videoType: videoType ?? this.videoType,
        videoUrl: videoUrl ?? this.videoUrl,
        dateAdded: dateAdded ?? this.dateAdded,
        lastModified: lastModified ?? this.lastModified,
        lessonType: lessonType ?? this.lessonType,
        attachment: attachment ?? this.attachment,
        attachmentType: attachmentType ?? this.attachmentType,
        summary: summary ?? this.summary,
        activity: activity ?? this.activity,
        order: order ?? this.order,
        videoTypeForMobileApplication: videoTypeForMobileApplication ?? this.videoTypeForMobileApplication,
        videoUrlForMobileApplication: videoUrlForMobileApplication ?? this.videoUrlForMobileApplication,
        durationForMobileApplication: durationForMobileApplication ?? this.durationForMobileApplication,
        from: from ?? this.from,
        to: to ?? this.to,
        scheduleDate: scheduleDate ?? this.scheduleDate,
        free: free ?? this.free,
      );

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    id: json["id"],
    title: json["title"],
    duration: json["duration"],
    courseId: json["course_id"],
    batchId: batchIdValues.map[json["batch_id"]]!,
    sectionId: json["section_id"],
    chapterId: json["chapter_id"],
    levelId: json["level_id"],
    videoId: json["video_id"],
    courseType: json["course_type"],
    videoType: json["video_type"],
    videoUrl: json["video_url"],
    dateAdded: json["date_added"],
    lastModified: json["last_modified"],
    lessonType: lessonTypeValues.map[json["lesson_type"]]!,
    attachment: json["attachment"],
    attachmentType: json["attachment_type"],
    summary: json["summary"],
    activity: json["activity"],
    order: json["order"],
    videoTypeForMobileApplication: json["video_type_for_mobile_application"],
    videoUrlForMobileApplication: json["video_url_for_mobile_application"],
    durationForMobileApplication: json["duration_for_mobile_application"],
    from: json["from"],
    to: json["to"],
    scheduleDate: scheduleDateValues.map[json["schedule_date"]]!,
    free: freeValues.map[json["free"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "duration": duration,
    "course_id": courseId,
    "batch_id": batchIdValues.reverse[batchId],
    "section_id": sectionId,
    "chapter_id": chapterId,
    "level_id": levelId,
    "video_id": videoId,
    "course_type": courseType,
    "video_type": videoType,
    "video_url": videoUrl,
    "date_added": dateAdded,
    "last_modified": lastModified,
    "lesson_type": lessonTypeValues.reverse[lessonType],
    "attachment": attachment,
    "attachment_type": attachmentType,
    "summary": summary,
    "activity": activity,
    "order": order,
    "video_type_for_mobile_application": videoTypeForMobileApplication,
    "video_url_for_mobile_application": videoUrlForMobileApplication,
    "duration_for_mobile_application": durationForMobileApplication,
    "from": from,
    "to": to,
    "schedule_date": scheduleDateValues.reverse[scheduleDate],
    "free": freeValues.reverse[free],
  };
}

enum BatchId {
  NULL
}

final batchIdValues = EnumValues({
  "null": BatchId.NULL
});

enum Free {
  OFF,
  ON
}

final freeValues = EnumValues({
  "off": Free.OFF,
  "on": Free.ON
});

enum LessonType {
  VIDEO
}

final lessonTypeValues = EnumValues({
  "video": LessonType.VIDEO
});

enum ScheduleDate {
  THE_00000000000000
}

final scheduleDateValues = EnumValues({
  "0000-00-00 00:00:00": ScheduleDate.THE_00000000000000
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
