import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:my_fitness_coach/models/body_parts_model.dart';
import 'package:my_fitness_coach/models/exercise_model.dart';
import 'package:my_fitness_coach/repositories/services/dio_client.dart';
import 'package:my_fitness_coach/repositories/services/url_const.dart';
import 'package:my_fitness_coach/repositories/user_repository.dart';
import 'package:uuid/uuid.dart';

import '../utils/app_string.dart';

class ExerciseRepository {
  late DioClient _client;
  static final exerciseRef =
      FirebaseFirestore.instance.collection('${databaseRoot}exercise');
  static final bodyPartsRef =
      FirebaseFirestore.instance.collection('${databaseRoot}bodyParts');
  ExerciseRepository({DioClient? client}) {
    _client = client ??
        DioClient(dio: Dio(BaseOptions(baseUrl: UrlConstants.urlServer)));
  }

  Future getListOfBodyParts({
    required Function success,
    required Function error,
  }) async {
    await _client.getAsync(UrlConstants.apiBodyparts, callBack: (data) {
      var dataConver = List<String>.from(data.data);
      success(dataConver);
    }, errorCallBack: (msg) {
      error(msg);
    });
  }

  Future getListByBodyParts({
    required String nameBodyPart,
    required Function success,
    required Function error,
  }) async {
    await _client.getAsync(UrlConstants.apiListByBodypart + "/$nameBodyPart",
        callBack: (data) {
      if (data != null) {
        List<ExerciseModel> listData = [];
        try {
          listData = (data.data as List)
              .map((i) => ExerciseModel.fromJson(i))
              .toList();
        } on FormatException {
          error(AppString.errorFormatJson);
        }
        success(listData);
      } else {
        error(AppString.errorNullData);
      }
    }, errorCallBack: (msg) {
      error(msg);
    });
  }

  Future getListByBodyPartsAll({
    required Function success,
    required Function error,
  }) async {
    await _client.getAsync("https://exercisedb.p.rapidapi.com/exercises",
        callBack: (data) {
      if (data != null) {
        List<ExerciseModel> listData = [];
        try {
          listData = (data.data as List)
              .map((i) => ExerciseModel.fromJson(i))
              .toList();
        } on FormatException {
          error(AppString.errorFormatJson);
        }
        success(listData);
      } else {
        error(AppString.errorNullData);
      }
    }, errorCallBack: (msg) {
      error(msg);
    });
  }

  static addBodyParts(BodyPartsModel bodyPartsModel, Function callBack,
      Function catchError) async {
    bodyPartsModel.id = Uuid().v1();
    CollectionReference bodyPartsRef =
        FirebaseFirestore.instance.collection('${databaseRoot}bodyParts');
    await bodyPartsRef
        .doc(bodyPartsModel.id)
        .set(bodyPartsModel.toJson())
        .then((value) => callBack(value))
        .catchError(catchError);
  }

  static addExercise(ExerciseModel exerciseModel, Function callBack,
      Function catchError) async {
    exerciseModel.id = Uuid().v1();
    CollectionReference exerciseRef =
        FirebaseFirestore.instance.collection('${databaseRoot}exercise');
    await exerciseRef
        .doc(exerciseModel.id)
        .set(exerciseModel.toJson())
        .then((value) => callBack(value))
        .catchError(catchError);
  }

  static Future getBodyPartsFirebase(Function success, Function error) async {
    bodyPartsRef.snapshots().listen(
      (event) async {
        List<dynamic> list = event.docs;
        List<BodyPartsModel> listBodyParts = [];
        for (var data in list) {
          BodyPartsModel model = BodyPartsModel.fromJson(data);
          listBodyParts.add(model);
        }
        success(listBodyParts);
      },
    ).onError((msg) => error(msg));
  }

  static Future getExercisebyBodyParts(
      String bodyPartName, Function success, Function error) async {
    exerciseRef.where('bodyPart', isEqualTo: bodyPartName).snapshots().listen(
      (event) async {
        List<dynamic> list = event.docs;
        List<ExerciseModel> exercise = [];
        for (var data in list) {
          ExerciseModel model = ExerciseModel.fromJson(data);
          exercise.add(model);
        }
        success(exercise);
      },
    ).onError((msg) => error(msg));
  }
}
