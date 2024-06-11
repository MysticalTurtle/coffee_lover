import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  const AppError({
    required this.title,
    required this.message,
    required this.statuCode,
  });
  factory AppError.empty() => const AppError(
        title: '',
        message: '',
        statuCode: 0,
      );

  final String title;
  final String message;
  final int statuCode;

  AppError copyWith({
    String? title,
    String? message,
    int? statuCode,
  }) =>
      AppError(
        title: title ?? this.title,
        message: message ?? this.message,
        statuCode: statuCode ?? this.statuCode,
      );

  @override
  List<Object?> get props => [
        title,
        message,
        statuCode,
      ];
}
