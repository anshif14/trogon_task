
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trogon_task/core/providers/providers.dart';

import 'package:http/http.dart' as http;
import 'package:trogon_task/models/levelByCourseModel.dart';
import 'package:trogon_task/models/userModel.dart';

final CourseRepositoryProvider = Provider((ref) => CourseRepository(
    levelByCourseProvider: ref.watch(levelsByCourseProvider),
    myCourseProvider: ref.watch(myCourseProvider)));

class CourseRepository{

final _myCourseProvider;
final _levelByCourseProvider;

CourseRepository({
  required String myCourseProvider,
  required String levelByCourseProvider,
}):
_myCourseProvider = myCourseProvider,
_levelByCourseProvider = levelByCourseProvider
;


  getData()async{
    // print(_myCoursePr/ovider);
    Uri url = Uri.parse(_myCourseProvider);
    http.Response data = await http.get(url);

    UserDataModel userDataModel =UserDataModel.fromJson(jsonDecode(data.body));


    return userDataModel;
    print(userDataModel.data.userdata.courseName);


  }

  getLevelByCourse()async{

    Uri url = Uri.parse(_levelByCourseProvider);
    http.Response data = await http.get(url);

    LevelByCourseModel userDataModel =LevelByCourseModel.fromJson(jsonDecode(data.body));


    return userDataModel;
    return;
  }

}