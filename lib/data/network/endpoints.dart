class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = 'https://flutter-gnc-user.firebaseio.com/';

  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 3000;

  // booking endpoints
  static const String getAccounts = baseUrl + '/users.json?print=pretty';
  // static const String getProducts = baseUrl + '/products/results.json?print=pretty';
}
