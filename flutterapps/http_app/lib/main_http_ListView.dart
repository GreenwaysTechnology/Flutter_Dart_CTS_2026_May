//in order to map json result into dart object, we need model class
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product {
  final int id;
  final String title;
  final double price;

  Product({required this.id, required this.title, required this.price});

  //factory constructor
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> products = [];
  bool isLoading = true;

  //widget life cycle api
  //called once when the state Object is created
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadProducts();
  }

  //loading data from the api
  Future<void> loadProducts() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      //bind the data in the ui, if you want to bind ui
      setState(() {
        products = data.map((item) => Product.fromJson(item)).toList();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = true;
      });
    }
  }
  void showProductDialog(Product product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(product.title),
          content: Text('Price: \$${product.price}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List From Api')),
      //render ui conditionally if isloading is true, show spinner else List
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 5,
              ),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: CircleAvatar(child: Text(product.id.toString())),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  onTap: () {
                    //show that data in  dialog
                    showProductDialog(product);
                  },
                );
              },
            ),
    );
  }
}

void main() {
  runApp(MyApp());
}
