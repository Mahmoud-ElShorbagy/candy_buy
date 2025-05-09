import 'package:candy_buy/models/product_dto.dart';

final List<String> title = [
  "Sweet Suchis",
  "Donuts Shop",
  "Creamy Cakes",
  "The Candy Fair",
  "Chocolate Lab",
  "Shaking Rages",
  "Hot Chocolate"
];
final List<String> content = [
  "Sweet suchis,",
  "Classis, broken hear",
  "more tasty donuts",
  "Cupcakes, cherries,",
  "and decorative cakes",
  "Sweets, candies, nuts",
  "chocolates, and shakes",
];
final List<String> time = [
  "25-35 mins",
  "10-30 mins",
  "15-25 mins",
  "35-45 mins",
  "25-35 mins",
  "10-30 mins",
  "15-25 mins"
];
final List<String> images = [
  "assets/images/view/sweetsuchi.svg",
  "assets/images/view/Donut.svg",
  "assets/images/view/creamCake.svg",
  "assets/images/view/Candylolipop.svg",
  "assets/images/view/choclatelap.svg",
  "assets/images/view/shakesrages.svg",
  "assets/images/view/hotchoclate.svg"
];
final List<String> icons = [
  ...List.generate(
    7,
    (index) => "assets/images/view/heart-outline.svg",
  )
];
final List<int> width = [83, 89, 74, 91, 67, 61, 91];
final List<int> height = [105, 105, 116, 116, 112, 118, 120];

final List<CategorytDTO> category = [
  ...List.generate(
    images.length,
    (index) => CategorytDTO(
        title: title[index],
        content: content[index],
        time: time[index],
        icons: icons[index],
        images: images[index],
        width: width[index],
        height: height[index]),
  )
];
