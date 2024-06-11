class CoffeeModel {
  const CoffeeModel({
    required this.file,
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      file: json['file'] as String? ?? '',
    );
  }

  final String file;

  Map<String, dynamic> toJson() {
    return {
      'file': file,
    };
  }
}
