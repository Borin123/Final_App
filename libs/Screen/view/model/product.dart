class Product {
  final String name;
  final String image;
  final double price;
  final String category;
  final String? description;
  final double? oldPrice;
  final bool isFavorite;

  const Product({
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    this.description,
    this.oldPrice,
    this.isFavorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      category: json['category'] ?? '',
      description: json['description'],
      oldPrice: json['oldPrice'] != null ? (json['oldPrice']).toDouble() : null,
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}

// ======================================================
// 🔥 PRODUCT LIST — ALL YOUR ASSETS INCLUDED
// ======================================================

final List<Product> products = [
  // Shoes
  const Product(
    name: "Running Shoe",
    image: "asset/images/shoe.jpg",
    price: 59.99,
    category: "Men",
    description: "Lightweight running shoes designed for comfort and performance.",
  ),
  const Product(
    name: "Sport Shoe",
    image: "asset/images/shoe2.jpg",
    price: 69.99,
    category: "Men",
    description: "High-performance sport shoes with excellent grip and durability.",
  ),
  const Product(
    name: "Casual Shoes",
    image: "asset/images/shoes2.jpg",
    price: 49.99,
    category: "Men",
    description: "Stylish casual shoes perfect for everyday wear and comfort.",
  ),

  // Shirts
  const Product(
    name: "Casual Shirt White",
    image: "asset/images/shirt1.jpg",
    price: 19.99,
    category: "Men",
    description: "Classic white casual shirt made from soft cotton fabric.",
  ),
  const Product(
    name: "Classic Shirt",
    image: "asset/images/shirt2.jpg",
    price: 24.99,
    category: "Men",
    description: "Elegant classic shirt suitable for office or formal occasions.",
  ),
  const Product(
    name: "Men T-shirt",
    image: "asset/images/shirt3.jpg",
    price: 14.99,
    category: "Men",
    description: "Comfortable cotton T-shirt for everyday casual wear.",
  ),

  // Pants
  const Product(
    name: "Black Pants",
    image: "asset/images/pant1.jpg",
    price: 29.99,
    category: "Men",
    description: "Slim-fit black pants made from premium fabric for style and comfort.",
  ),
  const Product(
    name: "Casual Pants",
    image: "asset/images/pant2.jpg",
    price: 34.99,
    category: "Men",
    description: "Relaxed casual pants perfect for a laid-back look.",
  ),
  const Product(
    name: "Slim Fit Pants",
    image: "asset/images/pant3.jpg",
    price: 32.99,
    category: "Men",
    description: "Slim-fit design for a modern and sharp appearance.",
  ),

  // Jackets
  const Product(
    name: "Winter Jacket",
    image: "asset/images/jacket1.jpg",
    price: 59.99,
    category: "Men",
    description: "Warm winter jacket with padded insulation for cold weather.",
  ),
  const Product(
    name: "Hoodie Jacket",
    image: "asset/images/jacket2.jpg",
    price: 49.99,
    category: "Men",
    description: "Casual hoodie jacket with front pockets and soft fleece lining.",
  ),
  const Product(
    name: "Denim Jacket",
    image: "asset/images/jacket3.jpg",
    price: 54.99,
    category: "Men",
    description: "Classic denim jacket with button closure and rugged design.",
  ),

  // Accessories
  const Product(
    name: "Watch A1",
    image: "asset/images/a1.jpg",
    price: 39.99,
    category: "Accessories",
    description: "Elegant wristwatch with leather strap and minimalist design.",
  ),
  const Product(
    name: "Watch A2",
    image: "asset/images/a2.jpg",
    price: 44.99,
    category: "Accessories",
    description: "Stylish watch featuring modern design and precise timekeeping.",
  ),
  const Product(
    name: "Sunglasses A3",
    image: "asset/images/a3.jpg",
    price: 14.99,
    category: "Accessories",
    description: "UV-protected sunglasses for a cool and safe outdoor look.",
  ),
  const Product(
    name: "Cap A4",
    image: "asset/images/a4.jpg",
    price: 12.99,
    category: "Accessories",
    description: "Classic baseball cap with adjustable strap and breathable fabric.",
  ),
];
