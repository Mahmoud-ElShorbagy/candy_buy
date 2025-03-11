import 'package:candy_buy/models/product_dto.dart';

final List<String> nameCandy = [
  "A variety Of Sweets",
  "Ball Candy Chocalate",
  "Collection Of Candies",
  "Colorful Cotton Candy",
  "Cotton Candy Sweet",
  "Crunchy Hocolate",
  "Delicious Cherry",
  "Delicious Lollipop",
  "Dried Fruits With Honey",
  "Fresh Fruit Dessert",
  "Green Toffee Dessert",
  "Heart Lollipops Sweets",
  "Jelly Candy Sweets  ",
  "Strawberry Lollipops",
  "Pink Cotton Candy",
  "Sugared Lollipops",
  "Sweet Floral Lollipops",
  "Toffee Candy",
  "Red Toffee Dessert",
];
final List<String> imagesUrlCandy = [
  "assets/images/candy/a_variety.png",
  "assets/images/candy/ball_candy.png",
  "assets/images/candy/collection_candy.png",
  "assets/images/candy/colorful_cotton.png",
  "assets/images/candy/cotton_acandy.png",
  "assets/images/candy/crunchy_cho.png",
  "assets/images/candy/del_lollipop.png",
  "assets/images/candy/delicious_popsicles.png",
  "assets/images/candy/dried_fruits.png",
  "assets/images/candy/fresh_fruit.png",
  "assets/images/candy/green_toffee.png",
  "assets/images/candy/heart_lollipops.png",
  "assets/images/candy/jelly_candy.png",
  "assets/images/candy/milk_str.png",
  "assets/images/candy/pink_cotton.png",
  "assets/images/candy/s_lolli.png",
  "assets/images/candy/swe_fl.png",
  "assets/images/candy/toffee_candy.png",
  "assets/images/candy/toffee.png",
];
final List<int> widthCandy = [
  ...List.generate(imagesUrlCandy.length, (index) => 40)
];
final List<int> heightCandy = [
  ...List.generate(imagesUrlCandy.length, (index) => 50)
];
final List<int> priceCandy = [
  15,
  5,
  4,
  4,
  8,
  3,
  10,
  3,
  5,
  4,
  4,
  8,
  3,
  10,
  4,
  3,
  5,
  4,
  4,
];
final List<int> quantityCandy = [
  ...List.generate(imagesUrlCandy.length, (index) => 1)
];
final List<ProductDTO> productCandy = [
  ...List.generate(
    imagesUrlCandy.length,
    (index) {
      return ProductDTO(
          name: nameCandy[index],
          imagesUrl: imagesUrlCandy[index],
          price: priceCandy[index],
          width: widthCandy[index],
          height: heightCandy[index]);
    },
  )
];
