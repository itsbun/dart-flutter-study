// PRACTICE EXERCISE 2: E-Commerce Domain with OOP, Enums & Mixins

abstract interface class OrderStatusProperty {
  String get description;

  String get color;
}

enum OrderStatus implements OrderStatusProperty {
  pending('Pending processing', 'Yellow'),

  shipping('In transit', 'Blue'),

  delivered('Delivered', 'Green'),

  cancelled('Cancelled', 'Red');

  const OrderStatus(this.description, this.color);

  @override
  final String description;

  @override
  final String color;
}

abstract class Product(final String id, final String name, final double price) {
  double calculateShippingFee();
}

class PhysicalProduct(
  super.id,
  super.name,
  super.price,
  final double weightInKg,
) extends Product {
  @override
  double calculateShippingFee() {
    return weightInKg * 2.0;
  }
}

class DigitalProduct(
  super.id,
  super.name,
  super.price,
  final double fileSizeInMB,
) extends Product {
  @override
  double calculateShippingFee() {
    return 0;
  }
}

mixin LoggerMixin {
  void logAction(String action) {
    print('${DateTime.now()} LOG: ${action}');
  }
}

class Order(
  final String id,
  final List<Product> products,
  final OrderStatus orderStatus,
) with LoggerMixin {
  String getStatusMessage() => switch (orderStatus) {
    .pending =>
      'Order pending processing (Color: ${OrderStatus.pending.color})',
    .shipping => 'Order is in transit (Color: ${OrderStatus.shipping.color})',
    .delivered =>
      'The order has been successfully delivered. (Color: ${OrderStatus.delivered.color})',
    .cancelled =>
      'The order has been cancelled. (Color: ${OrderStatus.cancelled.color})',
  };
}

void main() {
  Product laptop = PhysicalProduct('P01', 'Laptop Gaming', 1500.0, 2.5);

  Product ebook = DigitalProduct('D01', 'Dart Guide Ebook', 20.0, 15.0);

  var order = Order('ORD-123', [laptop, ebook], OrderStatus.pending);

  order.logAction('New order created');

  print(order.getStatusMessage());
}
