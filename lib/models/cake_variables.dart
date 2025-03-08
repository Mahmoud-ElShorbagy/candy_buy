import 'package:candy_buy/models/product_dto.dart';

List<String> nameCake = [
  "Cherry And ChoColate",
  "Cherry Cream Cake",
  "ClassiC Cream Cake",
  "Classic Cream Cake Best",
  "Cream And Strawberry",
  "Creamy Cake Vanilla",
  "Dark ChoColate Cream",
  "Hazelnut Cream Cake",
  "Mint Cream Cake",
  "Orange Cream Cake",
  "Strawberry Cream Cake",
  "Vanilla Cream Cake",
  "Vanilla Cream Cake",
  "Cub Cream Cake"
];

List<String> imagesUrlCake = [
  "assets/images/cake/ce_c.png",
  "assets/images/cake/cher_cake.png",
  "assets/images/cake/cl_cake.png",
  "assets/images/cake/clas_cream.png",
  "assets/images/cake/cream_tra.png",
  "assets/images/cake/creamy_cake.png",
  "assets/images/cake/dark_chocolate.png",
  "assets/images/cake/Hazelnut.png",
  "assets/images/cake/mint_cream.png",
  "assets/images/cake/orange.png",
  "assets/images/cake/Str.png",
  "assets/images/cake/Vanilla_crea.png",
  "assets/images/cake/vanilla.png",
  "assets/images/view/creamCake.svg",
];
List<int> widthCake = [for (int i = 0; i < imagesUrlCake.length; i++) 50];
List<int> heightCake = [for (int i = 0; i < imagesUrlCake.length; i++) 50];

List<int> quantityCake = [...List.generate(imagesUrlCake.length, (index) => 1)];

List<int> priceCake = [8, 4, 7, 5, 7, 3, 8, 6, 5, 6, 7, 6, 4, 6];
List<ProductDTO> productCake = [
  ...List.generate(
    imagesUrlCake.length,
    (index) => ProductDTO(
        name: nameCake[index],
        imagesUrl: imagesUrlCake[index],
        price: priceCake[index],
        width: widthCake[index],
        height: heightCake[index]),
  )
];
