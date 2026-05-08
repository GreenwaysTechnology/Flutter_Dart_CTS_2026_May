class Product {
  final int? id;
  final String? name;
  final double? price;

  const Product({this.id = 0, this.name = "Product-0", this.price = 0});
}

void main() {
  const List<int> numList = [1, 2, 3, 4, 5, 6];
  //print list
  for (int value in numList) {
    print(value);
  }
  numList.forEach((element) => print(element));
  numList.forEach((element) {
    print(element);
  });

  //product List
  const List<Product> productList = [
    Product(id: 1, name: "Product-1", price: 10.0),
    Product(id: 2, name: "Product-2", price: 20.0),
    Product(id: 3, name: "Product-3", price: 30.0),
    Product(id: 4, name: "Product-4", price: 40.0),
    Product(id: 5, name: "Product-5", price: 50.0),
  ];
  productList.forEach((product) {
    print("Id ${product.id}");
    print("Name ${product.name}");
    print("Price ${product.price}");
  });
}
