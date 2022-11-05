import 'package:my_fitness_coach/models/body_parts_model.dart';
import 'package:my_fitness_coach/models/exercise_model.dart';
import 'package:my_fitness_coach/repositories/exercise_repository.dart';
import 'package:translator/translator.dart';

class CrawlsData {
  static crawlsBodyParts() async {
    await ExerciseRepository().getListOfBodyParts(
        success: (data) {
          List<String> listBodyParts = [];
          listBodyParts = data;
          BodyPartsModel bodyPartsModel = BodyPartsModel();
          for (int i = 0; i < listBodyParts.length; i++) {
            final translator = GoogleTranslator();
            translator
                .translate(listBodyParts[i], from: 'en', to: 'vi')
                .then((s) {
              bodyPartsModel.bodyPartNameEN = listBodyParts[i].toString();
              bodyPartsModel.bodyPartNameVN = s.toString();
              ExerciseRepository.addBodyParts(
                  bodyPartsModel, (callBack) {}, (catchError) {});
            });
          }
        },
        error: (error) {});
  }

  static crawlsExercise() async {
    await ExerciseRepository().getListByBodyPartsAll(
        success: (data) {
          List<ExerciseModel> listExercise = [];
          listExercise = data;
          ExerciseModel exerciseModel = ExerciseModel();
          for (int i = 0; i < listExercise.length; i++) {
            exerciseModel.name = listExercise[i].name.toString();
            exerciseModel.equipment = listExercise[i].equipment.toString();
            exerciseModel.target = listExercise[i].target.toString();
            exerciseModel.gifUrl = listExercise[i].gifUrl.toString();
            exerciseModel.bodyPart = listExercise[i].bodyPart.toString();
          }
        },
        error: (error) {});
  }
}
