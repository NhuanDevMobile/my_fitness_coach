import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_fitness_coach/components/exercise/item_exercise_component.dart';
import 'package:my_fitness_coach/components/widgets/appbar_widget.dart';
import 'package:my_fitness_coach/models/exercise_model.dart';
import 'package:my_fitness_coach/page/exercise/exercise_detail_page.dart';
import 'package:my_fitness_coach/utils/behavior.dart';
import 'package:my_fitness_coach/utils/navigation_transition.dart';

import 'exercise_controller.dart';

class ExerciseListPage extends StatelessWidget {
  String nameBodyPart;
  String nameBodyPartVN;
  ExerciseListPage(
      {Key? key, required this.nameBodyPart, required this.nameBodyPartVN})
      : super(key: key);
  final ExerciseController exerciseController = Get.put(ExerciseController());
  @override
  Widget build(BuildContext context) {
    exerciseController.getListByBodyParts(nameBodyPart);
    return Scaffold(
        appBar: AppBarWidget(
          title: nameBodyPartVN.toString(),
        ),
        body: Container(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: GetBuilder<ExerciseController>(
              id: "fetchExercise",
              builder: (_) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: exerciseController.listExercise.length,
                  itemBuilder: (context, index) {
                    ExerciseModel item = exerciseController.listExercise[index];
                    return ItemExerciseComponent(
                        onTap: () {
                          Go.to(ExerciseDetailPage(item: item));
                        },
                        item: item);
                  }),
            ),
          ),
        ));
  }
}
