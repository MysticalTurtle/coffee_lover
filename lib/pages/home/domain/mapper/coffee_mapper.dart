import 'package:coffee_lover/pages/home/data/model/coffee_model.dart';
import 'package:coffee_lover/pages/home/domain/entities/coffee_entity.dart';

class CoffeeMapper {
  CoffeeEntity fromModel(CoffeeModel model) {
    return CoffeeEntity(
      imageURL: model.file,
      isFavorite: false,
    );
  }

  CoffeeModel fromEntity(CoffeeEntity entity) {
    return CoffeeModel(
      file: entity.imageURL,
    );
  }
}
