import 'dart:convert';

import 'package:candy_buy/models/category_variables.dart';
import 'package:candy_buy/views/view_candy/favorites_page/view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/product_dto.dart';

part 'state.dart';

class FavoritesItemCubit extends Cubit<FavoritesItemState> {
  FavoritesItemCubit() : super(FavoritesItemInitial()) {
    loadFavoritesData();
  }
  static FavoritesItemCubit get(context) => BlocProvider.of(context);
  List<bool> isPressedList = List.generate(category.length, (index) => false);
  Future<void> loadFavoritesData() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final categoryJson = prefs.getStringList("save_category");
      if (categoryJson != null) {
        categoryFavorit = categoryJson
            .map((category) => CategorytDTO.fromJson(jsonDecode(category)))
            .toList();
      }

      final pressedList = prefs.getStringList("pressed_icons");
      if (pressedList != null) {
        isPressedList = pressedList.map((e) => e == 'true').toList();
      } else {
        isPressedList = List.generate(category.length, (index) {
          return categoryFavorit
              .any((item) => item.title == category[index].title);
        });
        emit(FavoritesItemUpdated(
          isShowSnackBar: isPressedList,
          favorites: categoryFavorit,
          message: "Product Added To Favorites",
        ));
      }
    } catch (e) {}
  }

  Future<void> saveCategory() async {
    final prefs = await SharedPreferences.getInstance();
    final categoryJson = categoryFavorit.map(
      (category) {
        return jsonEncode(category.toJson());
      },
    ).toList();
    await prefs.setStringList("save_category", categoryJson);
    final pressedList = isPressedList.map((e) => e.toString()).toList();
    await prefs.setStringList("pressed_icons", pressedList);
  }

  void addFavorit(CategorytDTO categoryDTO) async {
    if (!categoryFavorit.contains(categoryDTO)) {
      categoryFavorit.add(categoryDTO);

      emit(FavoritesItemSuccess("Product Added To Favorites"));
    } else {
      categoryFavorit.remove(categoryDTO);
      emit(FavoritesItemSuccess("Product Removed From Favorites"));
    }
    await saveCategory();
  }
}
