import 'package:flutter_test/flutter_test.dart';
import 'package:lipoic/src/config/config.dart';

void main() {
  setUpAll(() {
    return ConfigHelper.init();
  });

  test('set value', () {
    const key = 'key';
    const value = 'value';

    ConfigHelper.set(key, value);

    expect(ConfigHelper.get(key), value);
  });
}
