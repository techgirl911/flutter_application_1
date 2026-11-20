// Step 1: named parameters, required, and a default value
double price({
  required double unit,
  required int quantity,
  double discount = 0,
}) {
  return unit * quantity * (1 - discount);
}

// Step 2: a nullable return type
String? findTown(String code) {
  if (code == 'CE') return 'Yaoundé';
  if (code == 'LT') return 'Douala';
  return null; // unknown code
}

// Step 4: a class with a const constructor, a getter and a method
class Product {
  final String name;
  final int price;

  const Product(this.name, this.price);

  bool get isFree => price == 0;

  String describe() => '$name: $price XAF';
}

// Step 4: an async function that waits one second
Future<String> fetchMessage() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'Data received after 1 second';
}

Future<void> main() async {
  // Step 1: three calls, the second one uses the default discount
  print(price(unit: 500, quantity: 3, discount: 0.1)); // 1350.0
  print(price(unit: 500, quantity: 3)); // 1500.0 (discount = 0)
  print(price(quantity: 2, unit: 1200, discount: 0.25)); // 1800.0

  // Step 2: safe printing with ??
  print(findTown('CE') ?? 'unknown'); // Yaoundé
  print(findTown('XX') ?? 'unknown'); // unknown

  // Step 3: where, map, fold
  final prices = [250, 800, 1200, 500, 650];

  final above500 = prices.where((p) => p > 500).toList();
  print(above500); // [800, 1200, 650]

  final increased = prices.map((p) => (p * 1.1).round()).toList();
  print(increased); // [275, 880, 1320, 550, 715]

  final total = prices.fold<int>(0, (sum, p) => sum + p);
  print(total); // 3400

  // Step 4: the class and the async function
  const rice = Product('Rice', 750);
  print(rice.describe()); // Rice: 750 XAF
  print(rice.isFree); // false

  print('Waiting...');
  final message = await fetchMessage();
  print(message); // Data received after 1 second
}
