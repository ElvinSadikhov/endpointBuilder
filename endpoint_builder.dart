import 'api_consts.dart';
import 'api_scheme.dart';
import 'api_scheme_extension.dart';

class EndpointBuilder {
  String _apiScheme = "";
  String _domain = "";
  String _endpointBase = "";
  List<String> _args = [];
  List<String> _savedArgs = [];

  EndpointBuilder() {
    _setDefaultBase();
  }

  void _setDefaultBase() {
    _apiScheme = ApiScheme.HTTPS.stringValue;
    _domain = Consts.domain;
    _updateEndpointBase();
  }

  EndpointBuilder setScheme({ApiScheme? scheme}) {
    _apiScheme = ValueGetter(scheme!).stringValue;
    _updateEndpointBase();
    return this;
  }

  EndpointBuilder setDomain({String? domain}) {
    _domain = domain ?? Consts.domain;
    _updateEndpointBase();
    return this;
  }

  void _updateEndpointBase() {
    _endpointBase =
        "$_apiScheme://$_domain/${Consts.indentifier}/${Consts.version}";
  }

  EndpointBuilder add(String value) {
    _args.add(value);
    return this;
  }

  String build() {
    String toReturn = _getFullLink();
    reset();
    return toReturn;
  }

  // here is the problem
  String _getFullLink() {
    return _args.isEmpty
        ? _endpointBase
        : _endpointBase + "/" + _args.join("/");
  }

  EndpointBuilder reset() {
    _args
      ..clear()
      ..addAll(_savedArgs);

    return this;
  }

  EndpointBuilder resetAll() {
    _setDefaultBase();
    _args.clear();
    _savedArgs.clear();
    return this;
  }

  EndpointBuilder save() {
    _savedArgs
      ..clear()
      ..addAll(_args);
    return this;
  }
}
