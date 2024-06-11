import 'package:coffee_lover/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppError', () {
    const title = 'Error Title';
    const message = 'Error Message';
    const statuCode = 404;

    test('supports value comparisons', () {
      expect(
        const AppError(
          title: title,
          message: message,
          statuCode: statuCode,
        ),
        const AppError(
          title: title,
          message: message,
          statuCode: statuCode,
        ),
      );
    });

    test('AppError.empty() creates an instance with default values', () {
      final emptyError = AppError.empty();
      expect(emptyError.title, '');
      expect(emptyError.message, '');
      expect(emptyError.statuCode, 0);
    });

    test('copyWith creates a copy with modified values', () {
      const originalError = AppError(
        title: title,
        message: message,
        statuCode: statuCode,
      );

      final copiedError = originalError.copyWith(
        title: 'New Title',
        message: 'New Message',
        statuCode: 500,
      );

      expect(copiedError.title, 'New Title');
      expect(copiedError.message, 'New Message');
      expect(copiedError.statuCode, 500);
      expect(copiedError.props, ['New Title', 'New Message', 500]);
    });

    test('copyWith creates a copy with some modified and some original values',
        () {
      const originalError = AppError(
        title: title,
        message: message,
        statuCode: statuCode,
      );

      final copiedError = originalError.copyWith(
        title: 'New Title',
      );

      expect(copiedError.title, 'New Title');
      expect(copiedError.message, message);
      expect(copiedError.statuCode, statuCode);
      expect(copiedError.props, ['New Title', message, statuCode]);
    });
  });
}
