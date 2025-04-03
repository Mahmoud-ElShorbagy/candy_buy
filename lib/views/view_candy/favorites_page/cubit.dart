import 'package:candy_buy/models/category_variables.dart';
import 'package:candy_buy/views/view_candy/favorites_page/view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/product_dto.dart';

part 'state.dart';

class FavoritesItemCubit extends Cubit<FavoritesItemState> {
  FavoritesItemCubit() : super(FavoritesItemInitial());
  static FavoritesItemCubit get(context) => BlocProvider.of(context);
  List<bool> isPressedList = List.generate(category.length, (index) => false);
  void addFavorit(CategoreytDTO categoreyDTO) {
    if (!categoryFavorit.contains(categoreyDTO)) {
      categoryFavorit.add(categoreyDTO);
      emit(FavoritesItemSuccess("Product Added To Favorites"));
    } else {
      categoryFavorit.remove(categoreyDTO);
      emit(FavoritesItemSuccess("Product Removed From Favorites"));
    }
  }
}
