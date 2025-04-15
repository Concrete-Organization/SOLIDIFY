class ProductEntity {
  final String id;
  final String name;
  final double price;
  final String description;
  final String measurement;
  final String imageUri;
  final int rate;
  final int discount;
  final String brandName;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.measurement,
    required this.imageUri,
    required this.rate,
    required this.discount,
    required this.brandName,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'measurement': measurement,
        'imageUri': imageUri,
        'rate': rate,
        'discount': discount,
        'brandName': brandName,
      };

  factory ProductEntity.fromJson(Map<String, dynamic> json) => ProductEntity(
        id: json['id'],
        name: json['name'],
        price: json['price'] as double,
        description: json['description'],
        measurement: json['measurement'],
        imageUri: json['imageUri'],
        rate: json['rate'] as int,
        discount: json['discount'] as int,
        brandName: json['brandName'],
      );
}
