import 'dart:convert';

import 'package:coffee_lover/core/error/app_error.dart';
import 'package:coffee_lover/pages/home/data/model/coffee_model.dart';
import 'package:http/http.dart' as http;

abstract class CoffeeRepository {
  Future<(CoffeeModel?, AppError?)> getCoffee();
}

class ICoffeeRepository extends CoffeeRepository {
  ICoffeeRepository();

  @override
  Future<(CoffeeModel?, AppError?)> getCoffee() async {
    try {
      final response = await http
          .get(Uri.parse('https://coffee.alexflipnote.dev/random.json'));
      if (response.statusCode == 200) {
        return (
          CoffeeModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>,
          ),
          null,
        );
      } else {
        return (
          null,
          AppError(
            title: 'Error',
            message: 'Failed to load coffee',
            statuCode: response.statusCode,
          )
        );
      }
    } catch (e) {
      return (
        null,
        const AppError(
          title: 'Error',
          message: 'Failed to load coffee',
          statuCode: 500,
        )
      );
    }
  }
}
