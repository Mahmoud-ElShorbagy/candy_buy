import 'package:candy_buy/models/product_dto.dart';

final List<String> nameChocolate = [
  "Almond ChocoLate",
  "Candy ChocoLate",
  "Caramel ChocoLate",
  "Cashew ChocoLate",
  "Coffee ChocoLate",
  "Creamy ChocoLate",
  "Dark ChocoLate",
  "Green ChocoLate",
  "Hazelnut ChocoLate",
  "Mango ChocoLate",
  "Pistachio ChocoLate",
  "Sweet ChocoLate",
  "Waver ChocoLate",
];
final List<String> imagesUrlChocolate = [
  "assets/images/chocolate_lab/almond.png",
  "assets/images/chocolate_lab/candy_chocolate.png",
  "assets/images/chocolate_lab/caramel.png",
  "assets/images/chocolate_lab/cashew.png",
  "assets/images/chocolate_lab/coffee.png",
  "assets/images/chocolate_lab/creamy_vanilla.png",
  "assets/images/chocolate_lab/dark.png",
  "assets/images/chocolate_lab/green.png",
  "assets/images/chocolate_lab/hazelnut.png",
  "assets/images/chocolate_lab/mango.png",
  "assets/images/chocolate_lab/sweet.jpg",
  "assets/images/chocolate_lab/pistachio.jpg",
  "assets/images/chocolate_lab/waver.png",
];
final List<int> widthChocolate = [
  ...List.generate(
    imagesUrlChocolate.length,
    (index) => 50,
  ),
];
final List<int> heightChocolate = [
  ...List.generate(
    imagesUrlChocolate.length,
    (index) => 50,
  ),
];
final List<int> priceChocolate = [3, 5, 4, 4, 8, 3, 10, 3, 5, 4, 4, 8, 3, 10];

final List<ProductDTO> productChocolate = [
  for (int i = 0; i < imagesUrlChocolate.length; i++)
    ProductDTO(
      name: nameChocolate[i],
      imagesUrl: imagesUrlChocolate[i],
      price: priceChocolate[i],
      width: widthChocolate[i],
      height: heightChocolate[i],
    )
];
