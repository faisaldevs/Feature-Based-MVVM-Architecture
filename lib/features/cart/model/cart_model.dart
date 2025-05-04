// Cart Item Model
class CartItem {
  final String productName;
  final double currentPrice;
  final double oldPrice;
  final String imageUrl;
  final int quantity;

  CartItem({
    required this.productName,
    required this.currentPrice,
    required this.oldPrice,
    required this.imageUrl,
    required this.quantity,
  });

  // Factory constructor to create a CartItem from JSON
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productName: json['product_name'],
      currentPrice: json['current_price'].toDouble(),
      oldPrice: json['old_price'].toDouble(),
      imageUrl: json['image_url'],
      quantity: json['quantity'],
    );
  }

  // Method to convert CartItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'product_name': productName,
      'current_price': currentPrice,
      'old_price': oldPrice,
      'image_url': imageUrl,
      'quantity': quantity,
    };
  }
}

// Cart Model
class Cart {
  final List<CartItem> cartItems;

  Cart({required this.cartItems});

  // Factory constructor to create a Cart from JSON
  factory Cart.fromJson(Map<String, dynamic> json) {
    var list = json['cart_items'] as List;
    List<CartItem> cartItems = list.map((i) => CartItem.fromJson(i)).toList();
    return Cart(cartItems: cartItems);
  }

  // Method to convert Cart to JSON
  Map<String, dynamic> toJson() {
    return {
      'cart_items': cartItems.map((e) => e.toJson()).toList(),
    };
  }
}

// Example JSON data
const cartJson = '''
{
  "cart_items": [
    {
      "product_name": "Vivo Y29 6GB/128GB with free Ripo new B100 Neckband...",
      "current_price": 74000,
      "old_price": 80000,
      "image_url": "https://backend.bdbeponi.com/public/product/1742366588565-b921e993-e850-44ff-a981-64578f0143d5.jpg",
      "quantity": 1
    },
    {
      "product_name": "Samsung Galaxy S21 128GB with free Galaxy Buds...",
      "current_price": 85000,
      "old_price": 90000,
      "image_url": "https://backend.bdbeponi.com/public/product/1742034636695-3a990dad-16fa-4a3c-8f44-f522c9c8a6bc.png",
      "quantity": 2
    },
    {
      "product_name": "Apple iPhone 13 128GB with free AirPods...",
      "current_price": 95000,
      "old_price": 100000,
      "image_url": "https://backend.bdbeponi.com/public/product/1742034636703-701fb71b-29ed-4643-a5bb-f6de94b15017.png",
      "quantity": 1
    },
    {
      "product_name": "OnePlus 9 Pro 256GB with free OnePlus Buds...",
      "current_price": 99999,
      "old_price": 105000,
      "image_url": "https://backend.bdbeponi.com/public/product/1742034636717-a040dad1-7257-4d05-bedf-0a5b52939c3a.png",
      "quantity": 3
    },
    {
      "product_name": "Xiaomi Mi 11 128GB with free Mi Smart Band 6...",
      "current_price": 65000,
      "old_price": 70000,
      "image_url": "https://backend.bdbeponi.com/public/product/1742366588565-b921e993-e850-44ff-a981-64578f0143d5.jpg",
      "quantity": 1
    },
    {
      "product_name": "Google Pixel 6 128GB with free Pixel Buds A-Series...",
      "current_price": 74000,
      "old_price": 78000,
      "image_url": "https://backend.bdbeponi.com/public/product/1742034636695-3a990dad-16fa-4a3c-8f44-f522c9c8a6bc.png",
      "quantity": 2
    }
  ]
}
''';

// void main() {
//   // Decode the JSON string into Cart object
//   final cartData = Cart.fromJson(cartJson);

//   runApp(MyApp(cart: cartData));
// }

// class MyApp extends StatelessWidget {
//   final Cart cart;

//   MyApp({required this.cart});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Cart Items')),
//         body: ListView.builder(
//           itemCount: cart.cartItems.length,
//           itemBuilder: (context, index) {
//             final item = cart.cartItems[index];
//             return ListTile(
//               contentPadding: EdgeInsets.all(10),
//               leading: Image.network(item.imageUrl),
//               title: Text(item.productName),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Current Price: ৳ ${item.currentPrice}'),
//                   Text('Old Price: ৳ ${item.oldPrice}'),
//                   Text('Quantity: ${item.quantity}'),
//                 ],
//               ),
//               trailing: IconButton(
//                 icon: Icon(Icons.remove_circle_outline),
//                 onPressed: () {
//                   // Handle item removal or other actions
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
