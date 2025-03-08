import 'package:candy_buy/models/product_dto.dart';

final List<String> imagesUrl = [
  "assets/images/view/ice_candy.svg",
  "assets/images/view/sweet_candy.svg",
  "assets/images/view/black_choclate.svg",
  "assets/images/view/candies.svg",
  "assets/images/view/shakes.svg",
  "assets/images/view/cake.svg",
  "assets/images/view/cotton_candy.svg",
];
final List<double> width = [
  47.6,
  45.6,
  33.46,
  31.38,
  39.49,
  52,
  34.327,
];
final List<double> height = [
  47.6,
  48,
  48,
  52,
  44,
  37.03,
  48,
];

final List<CandyDTO> candy = [
  ...List.generate(
    imagesUrl.length,
    (index) => CandyDTO(
        imagesUrl: imagesUrl[index],
        width: width[index],
        height: height[index]),
  )
];
