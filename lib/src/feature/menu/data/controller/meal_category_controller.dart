import 'package:control/control.dart';
import 'package:flutter_menu/src/feature/menu/data/controller/meal_category_controller_state.dart';
import 'package:flutter_menu/src/feature/menu/data/repository/menu_repository.dart';

class MealCategoryController extends StateController<MealCategoryControllerState> with SequentialControllerHandler {
  MealCategoryController({required this.menuRepository})
    : super(initialState: MealCategoryControllerState.initial(data: MealCategoryControllerStateEntity.initial()));

  final IMenuRepository menuRepository;

  ///
  void fetchCategories() => handle(
    name: 'MealCategoryController.fetchCategories()',
    () async {
      setState(MealCategoryControllerState.processing(message: 'Fetching categories...', data: state.data));

      final categories = await menuRepository.fetchCategories();

      setState(
        MealCategoryControllerState.processing(
          message: 'Fetching categories succeed...',
          data: state.data.copyWith(categories: categories),
        ),
      );
    },
    error: (error, stackTrace) async => setState(MealCategoryControllerState.failed(data: state.data)),
    done: () async => setState(MealCategoryControllerState.idle(data: state.data)),
  );
}
