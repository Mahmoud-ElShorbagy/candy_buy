import 'package:candy_buy/views/view_candy/favorites_page/view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/product_dto.dart';

part 'state.dart';

class FavoritesItemCubit extends Cubit<FavoritesItemState> {
  FavoritesItemCubit() : super(FavoritesItemInitial());
  static FavoritesItemCubit get(context) => BlocProvider.of(context);

  void addFavorit(CategoreytDTO categoreyDTO) {
    if (!categoreyFavorit.contains(categoreyDTO)) {
      categoreyFavorit.add(categoreyDTO);
      emit(FavoritesItemSuccess("Product Successfully Added To Favorites"));
    } else {
      categoreyFavorit.remove(categoreyDTO);
      emit(FavoritesItemSuccess("Product Removed From Favorites"));
    }
  }
}
