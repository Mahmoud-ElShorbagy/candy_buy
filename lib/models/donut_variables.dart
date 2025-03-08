import 'package:candy_buy/models/product_dto.dart';

final List<String> nameDonut = [
  "Classic Donut",
  "Chocolate Cream",
  "Classic Red",
  "Classic Purple",
  "Broken Heart",
  "Green Vanilla",
  "Space Blue",
  "Blueberry Donut",
  "Calssic Mix",
  "Caramel Donut",
  "Cherry Donut",
  "Coconut Donut",
  "Cookies Donut",
  "Jelly Donut",
  "Nutella Donut",
  "Pistachio Donut",
  "White Vanilla"
];
final List<String> imagesUrlDonut = [
  "assets/images/donuts/classicdonut.svg",
  "assets/images/donuts/choclateCream.svg",
  "assets/images/donuts/classicred.svg",
  "assets/images/donuts/classicpurple.svg",
  "assets/images/donuts/brokenheart.svg",
  "assets/images/donuts/greenvanilla.svg",
  "assets/images/donuts/space blue.svg",
  "assets/images/donuts/blueberry_d.png",
  "assets/images/donuts/calssic_mix.png",
  "assets/images/donuts/caramel_d.png",
  "assets/images/donuts/cherry_d.png",
  "assets/images/donuts/coconut_d.png",
  "assets/images/donuts/cookies_d.png",
  "assets/images/donuts/jelly_d.png",
  "assets/images/donuts/nutella_d.png",
  "assets/images/donuts/pistachio_d.png",
  "assets/images/donuts/white_d.png",
];
final List<int> widthDonut = [
  45,
  46,
  38,
  38,
  39,
  39,
  39,
  ...List.generate(
    10,
    (index) {
      return 40;
    },
  )
];
final List<int> heightDonut = [
  45,
  34,
  40,
  40,
  34,
  38,
  39,
  ...List.generate(
    10,
    (index) {
      return 40;
    },
  )
];

final List<int> priceDonut = [
  3,
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
  5
];
final List<ProductDTO> productDonut = [
  ...List.generate(
    imagesUrlDonut.length,
    (index) {
      return ProductDTO(
        name: nameDonut[index],
        imagesUrl: imagesUrlDonut[index],
        price: priceDonut[index],
        width: widthDonut[index],
        height: heightDonut[index],
      );
    },
  )
];
