import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

// --- MODEL ---

class Item {
  final int id;
  final String name;
  final Color color;

  Item(this.id, this.name, this.color);

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
  @override
  int get hashCode => id;
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;
  int get totalPrice => _items.length * 42;

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}

// --- APP UI ---

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // Removed initialRoute and routes map
      // Using 'home' to define the landing page
      home: MyCatalog(),
    );
  }
}

// --- CATALOG SCREEN ---

class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // UPDATED: Using Navigator.push with MaterialPageRoute
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyCart()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          final item = Item(index, 'Product $index',
              Colors.primaries[index % Colors.primaries.length]);
          return ListTile(
            leading: Container(width: 40, height: 40, color: item.color),
            title: Text(item.name),
            trailing: _AddButton(item: item),
          );
        },
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;
  const _AddButton({required this.item});

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
          (cart) => cart.items.contains(item),
    );

    return TextButton(
      onPressed: isInCart
          ? null
          : () => context.read<CartModel>().add(item),
      child: isInCart
          ? const Icon(Icons.check, color: Colors.green)
          : const Text('ADD'),
    );
  }
}

// --- CART SCREEN ---

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        // Navigator.push automatically adds a back button here
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Consumer<CartModel>(
                builder: (context, cart, child) => ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: const Icon(Icons.shopping_bag),
                    title: Text(cart.items[index].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_forever_sharp),
                      onPressed: () => cart.remove(cart.items[index]),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(height: 4, color: Colors.black),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.blueGrey[50],
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartModel>(
              builder: (context, cart, child) =>
                  Text('\$${cart.totalPrice}',
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow[700]),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Checkout not implemented!'))
                );
              },
              child: const Text('BUY', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}