import 'product_dto.dart';

final List<String> nameHotCh = [
  "Almond Chocolate",
  "Calsic Hot Chocalate",
  "Chocolate Cookies",
  "Chocolate Sprinkles",
  "Cinnamon Chocolate",
  "Cub Chocalte",
  "Hot Chocalate",
  "Marshmallow Chocolate",
  "Mint Chocolate",
  "Salted Caramel",
  "Sweet Hot Chocalate",
  "Warm Milk Chocolate",
  "Warm Spice Chocolate",
  "Warm Winter Chocolate"
];
final List<String> imagesUrlHotCh = [
  "assets/images/hot_chocolate/am.png",
  "assets/images/hot_chocolate/cal.png",
  "assets/images/hot_chocolate/col_co.png",
  "assets/images/hot_chocolate/ch_sprinkles.png",
  "assets/images/hot_chocolate/inn_choc.png",
  "assets/images/hot_chocolate/cub.png",
  "assets/images/hot_chocolate/h_chocal.png",
  "assets/images/hot_chocolate/mc.png",
  "assets/images/hot_chocolate/mint.png",
  "assets/images/hot_chocolate/caram.png",
  "assets/images/hot_chocolate/sweet.png",
  "assets/images/hot_chocolate/warm_milk.png",
  "assets/images/hot_chocolate/warm_spice.png",
  "assets/images/hot_chocolate/warm_winter.png",
];

final List<int> widthHotCh = [
  ...List.generate(imagesUrlHotCh.length, (index) => 40)
];
final List<int> heightHotCh = [
  ...List.generate(imagesUrlHotCh.length, (index) => 50)
];
final List<int> priceHotCh = [3, 5, 4, 4, 8, 3, 10, 3, 5, 4, 4, 8, 3, 10];

final List<ProductDTO> productHotCh = [
  ...List.generate(
    imagesUrlHotCh.length,
    (index) => ProductDTO(
        name: nameHotCh[index],
        imagesUrl: imagesUrlHotCh[index],
        price: priceHotCh[index],
        width: widthHotCh[index],
        height: heightHotCh[index]),
  )
];
