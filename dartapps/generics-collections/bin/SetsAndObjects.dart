class Product {
  final int? id;
  final String? name;
  final double? price;

  const Product({this.id = 0, this.name = "Product-0", this.price = 0});

  @override
  String toString() {
     return 'Product{id: $id, name: $name, price: $price}';
  }
  @override
  bool operator ==(Object other) {
    //full property comparsion
     return other is Product && other.id == id && other.name == name && other.price == price;
  }

  @override
  int get hashCode => id.hashCode;

}
void main(){
  Set<Product> products = {
    Product(id: 1, name: "Product-1", price: 10.0),
    Product(id: 2, name: "Product-2", price: 20.0),
    Product(id: 3, name: "Product-3", price: 30.0),
    Product(id: 1, name: "Product-1", price: 10.0),
    Product(id: 2, name: "Product-2", price: 20.0),

  };
  print(products.toString());
}