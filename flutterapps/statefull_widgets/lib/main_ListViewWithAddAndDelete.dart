import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductListPageState();
  }
}

class _ProductListPageState extends State<ProductListPage> {
  //data
  final List<String> products = [
    'Laptop',
    'Mobile',
    'Keyboard',
    'Mouse',
    'Monitor',
    'Laptop',
    'Mobile',
    'Keyboard',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ProductList With State")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(products[index]),
            trailing: IconButton(
              onPressed: () =>
              {
                //delete the product
                setState(() {
                  products.removeAt(index);
                })
            },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
        {
          //inline biz logic
          setState(() {
            products.add('New Product ${products.length + 1}');
          })
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListPage(),
    );
  }
}

void main() {
  runApp(MyApp());
}
