import 'product_dto.dart';

final List<String> nameIceCream = [
  "Red Ice Cream",
  "Best Ice Cream",
  "Calssic Ice Cream",
  "Cherry Ice Cream",
  "Chocolate",
  "Cold Ice Cream",
  "grape Ice Cream",
  "Ice cream Sundae",
  "Joy Ice Cream",
  "Lemon Ice Cream",
  "Snow Pleasures",
  "Strawberry",
  "Sweet Ice Cream",
  "Vanilla Ice Cream",
];
final List<String> imagesUrlIceCream = [
  "assets/images/view/shakesrages.svg",
  "assets/images/ice_cream/best_ice.png",
  "assets/images/ice_cream/calssic_ice.png",
  "assets/images/ice_cream/cherry_cream.png",
  "assets/images/ice_cream/chocalate_ice.jpg",
  "assets/images/ice_cream/cold_ice.png",
  "assets/images/ice_cream/grape_ice.png",
  "assets/images/ice_cream/Ice_sundae.jpg",
  "assets/images/ice_cream/Joy_ice.jpg",
  "assets/images/ice_cream/lemon.png",
  "assets/images/ice_cream/snow_pleasures.png",
  "assets/images/ice_cream/strawberry.png",
  "assets/images/ice_cream/sweet_ice.jpg",
  "assets/images/ice_cream/vanilla_ice.jpg",
];
final List<int> widthIceCream = [
  ...List.generate(imagesUrlIceCream.length, (index) => 70)
];
final List<int> heightIceCream = [
  ...List.generate(imagesUrlIceCream.length, (index) => 70)
];
final List<int> priceIceCream = [7, 5, 8, 3, 10, 3, 5, 4, 8, 3, 10, 4, 3, 5];
final List<ProductDTO> productIceCream = [
  ...List.generate(
    imagesUrlIceCream.length,
    (index) {
      return ProductDTO(
        name: nameIceCream[index],
        imagesUrl: imagesUrlIceCream[index],
        price: priceIceCream[index],
        width: widthIceCream[index],
        height: heightIceCream[index],
      );
    },
  ),
];
