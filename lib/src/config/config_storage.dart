import 'package:lipoic/src/config/config.dart';

ConfigStorage appConfig = const ConfigStorage();

class ConfigStorage {
  const ConfigStorage();

  bool get init => ConfigHelper.get('init') as bool;
  set init(bool value) => ConfigHelper.set('init', value);
}
