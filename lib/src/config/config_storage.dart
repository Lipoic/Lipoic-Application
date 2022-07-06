import 'config.dart';

ConfigStorage appConfig = const ConfigStorage();

class ConfigStorage {
  const ConfigStorage();

  bool get init => ConfigHelper.get('init') ?? false;
  set init(bool value) => ConfigHelper.set('init', value);

  String? get token => ConfigHelper.get('token');
  set token(String? value) => ConfigHelper.set('token', value);
}
