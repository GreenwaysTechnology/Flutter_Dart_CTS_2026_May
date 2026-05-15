import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// =======================================================
/// PRODUCT MODEL
/// =======================================================
class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      image: json['image'],
    );
  }
}


/// =======================================================
/// ROOT APPLICATION
/// =======================================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/// =======================================================
/// HOME PAGE WITH TAB BAR
/// =======================================================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Store'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.shopping_cart), text: 'Products'),
              Tab(icon: Icon(Icons.info), text: 'About'),
            ],
          ),
        ),
        body: const TabBarView(children: [ProductListPage(), AboutPage()]),
      ),
    );
  }
}

//Products Master Page
/// =======================================================
/// PRODUCT LIST PAGE
/// =======================================================
class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> products = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  /// Fetch products from API
  Future<void> loadProducts() async {
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);

        setState(() {
          products = jsonList.map((json) => Product.fromJson(json)).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load products';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
    }
  }

  /// Navigate to details page
  void openProductDetails(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Loading
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Error
    if (errorMessage != null) {
      return Center(child: Text(errorMessage!));
    }

    // Product list
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: Image.network(product.image, width: 50, height: 50),
            title: Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text('Price: \$${product.price}'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              openProductDetails(product);
            },
          ),
        );
      },
    );
  }
}

/// =======================================================
/// PRODUCT DETAILS PAGE
/// =======================================================
class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(product.image, height: 250),
            const SizedBox(height: 25),

            Text(
              product.title,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(product.description, style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.title} added to cart')),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// =======================================================
/// ABOUT PAGE
/// =======================================================
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Flutter Demo\nTabs + API + ListView + Navigation',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}
void main() {
  runApp(const MyApp());
}

