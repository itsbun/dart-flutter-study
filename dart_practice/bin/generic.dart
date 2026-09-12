// PRACTICE EXERCISE 3: Generic

abstract interface class IIdentifiable {
  String get id;
}

class User implements IIdentifiable {
  @override
  final String id;
  final String username;

  User(this.id, this.username);
}

class Product implements IIdentifiable {
  @override
  final String id;
  final String name;

  Product(this.id, this.name);
}

class LocalStorage<T extends IIdentifiable> {
  final Map<String, T> _storage = {};

  void set(String key, T value) {
    _storage[key] = value;
  }

  T? get(String key) => _storage[key];

  List<T> getAll() => _storage.values.toList();
}

class ApiResponse<T> {
  final bool success;

  final String message;

  final T? data;

  final int? errorCode;

  const ApiResponse.success(this.data, {this.message = 'Success'})
    : success = true,
      errorCode = null;

  const ApiResponse.error(this.message, {this.errorCode})
    : success = false,
      data = null;
}

void main() {
  final userStorage = LocalStorage<User>();

  userStorage.set('u1', User('1', 'Tran Ka Bun'));

  final fetchedUser = userStorage.get('u1');

  print('Found User: ${fetchedUser?.username}');

  final productStorage = LocalStorage<Product>();

  productStorage.set('p1', Product('101', 'Mechanical Keyboard'));

  ApiResponse<User> response = ApiResponse.success(fetchedUser);

  if (response.success) {
    print('API Response Data: ${response.data?.username}');
  }
}
