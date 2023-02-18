// ignore_for_file: public_member_api_docs, sort_constructors_first
enum Routes {
  home(
    path: '/',
    name: 'home',
  ),
  product(
    path: '/product',
    name: 'product',
  ),
  cart(
    path: '/cart',
    name: 'cart',
  ),
  login(
    path: '/login',
    name: 'login',
  ),
  registration(
    path: '/registration',
    name: 'registration',
  ),
  accountVerification(
    path: '/verify-account',
    name: 'verify-account',
  ),
  ;

  final String path, name;
  const Routes({
    required this.name,
    required this.path,
  });

  /// removes the first '/' in [path]
  ///
  /// `return path.replaceFirst('/', '');`
  String get subpath {
    return path.replaceFirst('/', '');
  }

  /// returns new route name with a given [parentName]
  ///
  /// `return '$parentName-$name'`
  String subname(String parentName) {
    return '$parentName-$name';
  }
}
