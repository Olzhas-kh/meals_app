import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotidier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotidier() : super([]);

  void toggleMealFavoriteStatus (Meal meal){
    final mealIsFavorite = state.contains(meal);

    if(mealIsFavorite){
      state = state.where((m) => m.id != meal.id).toList();
    }else{

    state = [...state, meal];
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotidier, List<Meal>>((ref)  {
  return FavoriteMealsNotidier();
});