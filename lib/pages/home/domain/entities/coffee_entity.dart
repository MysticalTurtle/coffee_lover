import 'package:equatable/equatable.dart';

class CoffeeEntity extends Equatable {
  const CoffeeEntity({
    required this.imageURL,
    required this.isFavorite,
  });

  factory CoffeeEntity.fromJson(Map<String, dynamic> json) {
    return CoffeeEntity(
      imageURL: json['imageURL'] as String? ?? '',
      isFavorite: json['isFavorite'] as bool? ?? true,
    );
  }

  const CoffeeEntity.empty() : this(imageURL: '', isFavorite: false);

  Map<String, dynamic> toJson() {
    return {
      'imageURL': imageURL,
      'isFavorite': isFavorite,
    };
  }

  CoffeeEntity copyWith({
    String? imageURL,
    bool? isLoading,
    bool? isError,
    bool? isFavorite,
  }) {
    return CoffeeEntity(
      imageURL: imageURL ?? this.imageURL,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  final String imageURL;
  final bool isFavorite;

  @override
  List<Object> get props => [imageURL, isFavorite];
}
