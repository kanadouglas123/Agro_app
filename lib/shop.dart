import 'package:flutter/material.dart';

void main() {
  runApp(Shop());
}

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agricultural Shopping',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Agricultural\n Products',style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),  const SizedBox(width: 10,),
         GestureDetector
         (
          onTap: () {
            
          },
          child: const Icon(Icons.search, size: 30,)),
        const SizedBox(width: 25,)
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
          
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(products[index].image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: products[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            onPressed: () {
              ;
              // Navigate to cart screen
            },
            child: Icon(Icons.shopping_cart),
          ),
          Positioned(
            right: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              child: Center(
                child: Text(
                  '1', // Replace with the actual number of items in the cart
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(product.description),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement adding the product to cart
          addToCart(product);
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Center(
        child: Text('Your cart is empty'),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String description;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });
}
List<Product> products = [
  Product(
    name: 'Organic Apples',
    price: 2.99,
    description: 'Fresh organic apples from local farms.',
    image: 'assets/apple.png',
  ),
  Product(
    name: 'Tomatoes',
    price: 1.49,
    description: 'Ripe tomatoes grown without pesticides.',
    image: 'assets/tomatoe.png',
  ),
  Product(
    name: 'Carrots',
    price: 0.99,
    description: 'Sweet and crunchy carrots harvested this season.',
    image: 'assets/carrot.png',
  ),
  Product(
    name: 'Potatoes',
    price: 1.29,
    description: 'Organically grown potatoes perfect for your recipes.',
    image: 'assets/potatoes.png',
  ),
  Product(
    name: 'Bloom Buddy',
    price: 2.99,
    description: 'Fresh organic apples from local farms.',
    image: 'assets/shop1.png',
  ),
  Product(
    name: 'Plant Protector',
    price: 2.99,
    description: 'Fresh organic apples from local farms.',
    image: 'assets/shop2.png',
  ),
  Product(
    name: 'Plant Body Guard',
    price: 1.49,
    description: 'Ripe tomatoes grown without pesticides.',
    image: 'assets/shop3.png',
  ),
  Product(
    name: 'M-Impact',
    price: 0.99,
    description: 'Sweet and crunchy carrots harvested this season.',
    image: 'assets/shop4.png',
  ),
  Product(
    name: 'Flumetralin 25% SC',
    price: 1.29,
    description: 'Organically grown potatoes perfect for your recipes.',
    image: 'assets/shop5.png',
  ),
];

List<Product> cart = []; // List to store the items in the cart

void addToCart(Product product) {
  cart.add(product); // Add the product to the cart list
}


