import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// ===============================================================
/// PRODUCT MODEL
/// ===============================================================
class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      image: json['image'],
      category: json['category'],
    );
  }
}

/// ===============================================================
/// ROOT APPLICATION
/// ===============================================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

/// ===============================================================
/// HOME PAGE WITH DRAWER
/// ===============================================================
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    ProductListPage(),
    AboutPage(),
    SettingsPage(),
  ];

  final List<String> pageTitles = ['Products', 'About', 'Settings'];

  void selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
    Navigator.pop(context); // Close drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageTitles[selectedIndex])),

      // Drawer Navigation
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('CTS Shopping App'),
              accountEmail: Text('contact@cts.shop.com'),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  'C',
                  style: TextStyle(fontSize: 30, color: Colors.green),
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Products'),
              selected: selectedIndex == 0,
              onTap: () => selectPage(0),
            ),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              selected: selectedIndex == 1,
              onTap: () => selectPage(1),
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              selected: selectedIndex == 2,
              onTap: () => selectPage(2),
            ),
          ],
        ),
      ),

      // Show selected page
      body: pages[selectedIndex],
    );
  }
}
/// ===============================================================
/// PRODUCT LIST PAGE (REST API + ListView)
/// ===============================================================
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

  /// Fetch data from REST API
  Future<void> loadProducts() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);

        setState(() {
          products = jsonList
              .map((json) => Product.fromJson(json))
              .toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage =
          'Server error: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Network error: $e';
        isLoading = false;
      });
    }
  }

  /// Open details page
  void openProductDetails(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailsPage(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Loading
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // Error
    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage!),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: loadProducts,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    // Pull-to-refresh + ListView
    return RefreshIndicator(
      onRefresh: loadProducts,
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Image.network(
                product.image,
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
              title: Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                '\$${product.price.toStringAsFixed(2)}',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => openProductDetails(product),
            ),
          );
        },
      ),
    );
  }
}

/// ===============================================================
/// PRODUCT DETAILS PAGE
/// ===============================================================
class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.stretch,
          children: [
            Image.network(
              product.image,
              height: 250,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),

            Text(
              product.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              product.category,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              product.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              icon: const Icon(Icons.shopping_cart),
              label: const Text('Add to Cart'),
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      '${product.title} added to cart',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// ===============================================================
/// ABOUT PAGE
/// ===============================================================
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Real-Time Flutter Example\n\n'
              '• Drawer Navigation\n'
              '• REST API Integration\n'
              '• JSON Parsing\n'
              '• ListView\n'
              '• Navigation\n'
              '• Pull to Refresh\n'
              '• Error Handling',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

/// ===============================================================
/// SETTINGS PAGE
/// ===============================================================
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.palette),
          title: Text('Theme'),
          subtitle: Text('Light Mode'),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notifications'),
          subtitle: Text('Enabled'),
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text('Language'),
          subtitle: Text('English'),
        ),
      ],
    );
  }
}



void main() {
  runApp(const MyApp());
}
