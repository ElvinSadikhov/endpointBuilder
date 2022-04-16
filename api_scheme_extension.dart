import "api_scheme.dart";

extension ValueGetter on ApiScheme {
  String get stringValue {
    switch (this) {
      case ApiScheme.HTTP:
        return "http";
      case ApiScheme.HTTPS:
        return "https";
      default:
        return "https";
    }
  }
}
