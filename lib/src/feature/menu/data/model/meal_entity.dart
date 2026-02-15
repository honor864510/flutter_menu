import 'package:meta/meta.dart';

@immutable
final class MealEntity {
  const MealEntity({required this.id, this.name = '', this.description = '', this.imageUrl = '', this.price = 0});

  final String id;
  final String name;
  final String description;
  final int price;
  final String imageUrl;
}
