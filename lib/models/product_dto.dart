class ProductDTO {
  final String id;
  final String name;
  final String imagesUrl;
  final int price;
  final int width;

  final int height;
  ProductDTO({
    this.id = "1",
    required this.name,
    required this.imagesUrl,
    required this.price,
    required this.width,
    required this.height,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imagesUrl': imagesUrl,
      'price': price,
      'width': width,
      'height': height,
    };
  }

  factory ProductDTO.fromMap(Map<String, dynamic> map, String documentId) {
    return ProductDTO(
      id: documentId,
      name: map['name'] as String,
      imagesUrl: map['imagesUrl'] as String,
      price: map['price'] as int,
      width: map['width'] as int,
      height: map['height'] as int,
    );
  }

  @override
  bool operator ==(covariant ProductDTO other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.imagesUrl == imagesUrl &&
        other.price == price &&
        other.width == width &&
        other.height == height;
  }

  @override
  String toString() {
    return 'ProductDTO(id: $id, name: $name, imagesUrl: $imagesUrl, price: $price, width: $width, height: $height)';
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imagesUrl.hashCode ^
        price.hashCode ^
        width.hashCode ^
        height.hashCode;
  }
}

class CandyDTO {
  final String imagesUrl;
  final double width;
  final double height;
  CandyDTO(
      {required this.imagesUrl, required this.width, required this.height});
}

class CategoreytDTO {
  final String title;
  final String content;
  final String time;
  final String icons;
  final double marginLeft;
  final String images;
  final int width;
  final int height;

  CategoreytDTO({
    required this.title,
    required this.content,
    required this.time,
    required this.icons,
    required this.marginLeft,
    required this.images,
    required this.width,
    required this.height,
  });
}
