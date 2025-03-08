import 'package:candy_buy/models/product_dto.dart';

final List<String> nameSuchis = [
  "Sushi Sweets",
  "Candy Corn",
  "Candy Suchi",
  "Dessert sushi",
  "Green Sushi",
  "Jelly Sushi",
  "Sea Sweets",
  "Strawberry Sushi",
  "Sweet Rice",
  "Sweet Sushi"
];
final List<String> imagesUrlSuchis = [
  "assets/images/view/sweetsuchi.svg",
  "assets/images/sushi/candy_c.jpg",
  "assets/images/sushi/candy_s.jpg",
  "assets/images/sushi/desset_s.jpg",
  "assets/images/sushi/green_s.png",
  "assets/images/sushi/jelly_s.jpg",
  "assets/images/sushi/sea_sw.png",
  "assets/images/sushi/Str_s.png",
  "assets/images/sushi/sweet_r.jpg",
  "assets/images/sushi/sweetness_s.png"
];
final List<int> widthSuchis = [
  ...List.generate(
    imagesUrlSuchis.length,
    (index) {
      return 50;
    },
  )
];
final List<int> heightSuchis = [
  ...List.generate(
    imagesUrlSuchis.length,
    (index) {
      return 50;
    },
  )
];
final List<int> priceSuchis = [6, 4, 7, 5, 3, 6, 5, 4, 6, 8];

List<ProductDTO> productSuchi = [
  ...List.generate(
    imagesUrlSuchis.length,
    (index) => ProductDTO(
        name: nameSuchis[index],
        imagesUrl: imagesUrlSuchis[index],
        price: priceSuchis[index],
        width: widthSuchis[index],
        height: heightSuchis[index]),
  )
];
