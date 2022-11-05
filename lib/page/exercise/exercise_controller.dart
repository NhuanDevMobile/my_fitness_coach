import 'package:get/get.dart';
import 'package:my_fitness_coach/models/body_parts_model.dart';
import 'package:my_fitness_coach/repositories/exercise_repository.dart';

import '../../models/exercise_model.dart';

class ExerciseController extends GetxController {
  ExerciseRepository exerciseRepository = ExerciseRepository();
  List<BodyPartsModel> listBodyParts = [];
  List<ExerciseModel> listExercise = [];
  @override
  void onReady() {
    super.onReady();
    getBodyParts();
  }

  getBodyParts() async {
    await ExerciseRepository.getBodyPartsFirebase((data) {
      listBodyParts = data;
      update(['fetchListBodyPart']);
    }, (error) {});
  }

  getListByBodyParts(String nameBodyPart) async {
    await ExerciseRepository.getExercisebyBodyParts(nameBodyPart, (data) {
      listExercise = data;
      print(listExercise.length);
      update(['fetchExercise']);
    }, (error) {});
  }
}
