import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:my_fitness_coach/components/exercise/item_body_part.dart';
import 'package:my_fitness_coach/models/body_parts_model.dart';
import 'package:my_fitness_coach/page/exercise/exercise_controller.dart';
import 'package:my_fitness_coach/page/exercise/exercise_list_page.dart';
import 'package:my_fitness_coach/utils/behavior.dart';
import 'package:my_fitness_coach/utils/navigation_transition.dart';

class ExercisePage extends StatelessWidget {
  ExercisePage({Key? key}) : super(key: key);
  final ExerciseController exerciseController = Get.put(ExerciseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<ExerciseController>(
      id: "fetchListBodyPart",
      builder: (_) => ScrollConfiguration(
        behavior: MyBehavior(),
        child: GridView.custom(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            pattern: [
              WovenGridTile(1),
              WovenGridTile(
                6 / 8,
                crossAxisRatio: 0.9,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate((context, index) {
            BodyPartsModel item = exerciseController.listBodyParts[index];
            return ItemBodyParts(
                item: item,
                onTap: () {
                  Go.to(ExerciseListPage(
                    nameBodyPart: item.bodyPartNameEN.toString(),
                    nameBodyPartVN: item.bodyPartNameVN.toString(),
                  ));
                });
          }, childCount: exerciseController.listBodyParts.length),
        ),
      ),
    ));
  }
}
