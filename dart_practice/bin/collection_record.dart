// PRACTICE EXERCISE 1: Raw Data Processing with Collections & Records

typedef ProductList = List<Map<String, dynamic>>;

(List<String>, double) processProducts1(ProductList products) {
  final List<String> inStockProducts = products
      .where((product) => product['inStock'] == true)
      .map((product) => product['name'] as String)
      .toList();

  final double totalAmount = products.fold(0.0, (sum, product) {
    if (product['inStock'] == true) {
      return sum + (product['price'] as double);
    }

    return sum;
  });

  return (inStockProducts, totalAmount);
}

(List<String>, double) processProducts(ProductList products) {
  List<String> productNames = [];
  double totalAmount = 0;

  for (var product in products) {
    if (product['inStock'] == true) {
      productNames.add(product['name'] as String);

      totalAmount += product['price'] as double;
    }
  }

  return (productNames, totalAmount);
}

void main() {
  final ProductList rawProducts = [
    {
      'name': 'Laptop Gaming',
      'price': 1500.0,
      'category': 'Tech',
      'inStock': true,
    },
    {
      'name': 'Wireless mouse',
      'price': 25.5,
      'category': 'Tech',
      'inStock': false,
    },
    {
      'name': 'Wireless keyboard',
      'price': 85.0,
      'category': 'Tech',
      'inStock': true,
    },
    {
      'name': 'Bluetooth headphones',
      'price': 50.0,
      'category': 'Audio',
      'inStock': null,
    },
    {'name': '4K Monitor', 'price': 300.0, 'category': 'Tech', 'inStock': true},
  ];

  var result = processProducts(rawProducts);

  print('Product list in stock: ${result.$1}');
  print('Total amount: ${result.$2}');
}
