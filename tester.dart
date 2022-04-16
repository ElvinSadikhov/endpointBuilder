import 'api_scheme.dart';
import "endpoint_builder.dart";

void main() {
  EndpointBuilder builder = EndpointBuilder();

  print(builder.build());

  builder
      .setDomain(domain: "www.google.com")
      .setScheme(scheme: ApiScheme.HTTPS)
      .add("search")
      .add("query")
      .save()
      .add("test");
  print(builder.build());

  builder.add("smth");
  print(builder.build());

  builder.resetAll();
  print(builder.build());
}

// OUTPUT:
// https://example.com/api/v1
// https://www.google.com/api/v1/search/query/test
// https://www.google.com/api/v1/search/query/smth
// https://example.com/api/v1