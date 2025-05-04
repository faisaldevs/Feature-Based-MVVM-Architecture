import 'package:go_router/go_router.dart';

class NavigationService {
  late GoRouter _router;

  // Method to set router
  void setRouter(GoRouter router) {
    _router = router;
  }

  // Direct router access
  GoRouter get router => _router;

  // ----------------------
  // 🔀 Basic Navigation
  // ----------------------

  void push(String path) => _router.push(path);
  void go(String path) => _router.go(path);
  void pop<T extends Object?>([T? result]) => _router.pop(result);
  void refresh() => _router.refresh();

// ------------------------------------
// 📍 Go Routing with Extra
// ------------------------------------

  void gowithExtra(
    String path, {
    Object? extra,
  }) =>
      _router.go(path, extra: extra);

  // ----------------------
  // 🧭 Named Routing
  // ----------------------

  void pushNamed(
    String name, {
    Map<String, String> params = const {},
    Map<String, String> queryParams = const {},
  }) {
    final location = _router.namedLocation(
      name,
      pathParameters: params,
      queryParameters: queryParams,
    );
    push(location);
  }

  void goNamed(
    String name, {
    Map<String, String> params = const {},
    Map<String, String> queryParams = const {},
  }) {
    final location = _router.namedLocation(
      name,
      pathParameters: params,
      queryParameters: queryParams,
    );
    go(location);
  }

  // ----------------------
  // 🧾 With Extra (State)
  // ----------------------

  void pushNamedWithExtra(
    String name, {
    Map<String, String> params = const {},
    Map<String, String> queryParams = const {},
    Object? extra,
  }) {
    _router.pushNamed(
      name,
      pathParameters: params,
      queryParameters: queryParams,
      extra: extra,
    );
  }

  void goNamedWithExtra(
    String name, {
    Map<String, String> params = const {},
    Map<String, String> queryParams = const {},
    Object? extra,
  }) {
    _router.goNamed(
      name,
      pathParameters: params,
      queryParameters: queryParams,
      extra: extra,
    );
  }

  // ----------------------
  // 🔁 Replace
  // ----------------------

  void replace(String path) => _router.replace(path);

  void replaceNamed(
    String name, {
    Map<String, String> params = const {},
    Map<String, String> queryParams = const {},
    Object? extra,
  }) {
    _router.replaceNamed(
      name,
      pathParameters: params,
      queryParameters: queryParams,
      extra: extra,
    );
  }

  // ----------------------
  // 📜 Navigation History
  // ----------------------

  bool canPop() => _router.canPop();

  void popUntilHome() {
    while (_router.canPop()) {
      _router.pop();
    }
  }
}
