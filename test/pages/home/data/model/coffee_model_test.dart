import 'package:coffee_lover/pages/home/data/model/coffee_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CoffeeModel', () {
    const file = 'https://coffee.alexflipnote.dev/random_coffee.png';
    const coffeeModel = CoffeeModel(file: file);

    test('fromJson returns correct CoffeeModel instance', () {
      final json = {'file': file};
      final result = CoffeeModel.fromJson(json);

      expect(result.file, file);
    });

    test('fromJson returns CoffeeModel with empty file when JSON is empty', () {
      final json = <String, dynamic>{};
      final result = CoffeeModel.fromJson(json);

      expect(result.file, '');
    });

    test('toJson returns correct JSON map', () {
      final json = coffeeModel.toJson();

      expect(json, {'file': file});
    });
  });
}
