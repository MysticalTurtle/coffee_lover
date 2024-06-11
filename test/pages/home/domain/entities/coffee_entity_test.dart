import 'package:coffee_lover/pages/home/domain/entities/coffee_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CoffeeEntity', () {
    const imageURL = 'https://coffee.alexflipnote.dev/random_coffee.png';
    const isFavorite = true;

    test('supports value comparisons', () {
      expect(
        const CoffeeEntity(imageURL: imageURL, isFavorite: isFavorite),
        const CoffeeEntity(imageURL: imageURL, isFavorite: isFavorite),
      );
    });

    test('fromJson returns correct CoffeeEntity instance', () {
      final json = {
        'imageURL': imageURL,
        'isFavorite': isFavorite,
      };
      final result = CoffeeEntity.fromJson(json);

      expect(result.imageURL, imageURL);
      expect(result.isFavorite, isFavorite);
    });

    test('fromJson returns CoffeeEntity with default values when JSON is empty',
        () {
      final json = <String, dynamic>{};
      final result = CoffeeEntity.fromJson(json);

      expect(result.imageURL, '');
      expect(result.isFavorite, true);
    });

    test('toJson returns correct JSON map', () {
      const coffeeEntity = CoffeeEntity(
        imageURL: imageURL,
        isFavorite: isFavorite,
      );
      final json = coffeeEntity.toJson();

      expect(json, {
        'imageURL': imageURL,
        'isFavorite': isFavorite,
      });
    });

    test('copyWith creates a copy with modified values', () {
      const original = CoffeeEntity(imageURL: imageURL, isFavorite: isFavorite);
      final copy =
          original.copyWith(imageURL: 'new_image_url', isFavorite: false);

      expect(copy.imageURL, 'new_image_url');
      expect(copy.isFavorite, false);
    });

    test('copyWith creates a copy with some modified and some original values',
        () {
      const original = CoffeeEntity(imageURL: imageURL, isFavorite: isFavorite);
      final copy = original.copyWith(isFavorite: false);

      expect(copy.imageURL, imageURL);
      expect(copy.isFavorite, false);
    });

    test('empty constructor returns correct default values', () {
      const emptyEntity = CoffeeEntity.empty();

      expect(emptyEntity.imageURL, '');
      expect(emptyEntity.isFavorite, false);
    });
  });
}
