import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'meal_entity.g.dart';

typedef MealID = String;

@immutable
@JsonSerializable()
final class MealEntity {
  const MealEntity({required this.id, this.name = '', this.description = '', this.imageUrl = '', this.price = 0});

  /// Connect the generated [_$MealEntityFromJson] function to the `fromJson`
  /// factory.
  factory MealEntity.fromJson(Map<String, dynamic> json) => _$MealEntityFromJson(json);

  /// Connect the generated [_$MealEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MealEntityToJson(this);

  ///
  @JsonKey(name: 'id')
  final MealID id;

  ///
  @JsonKey(name: 'name')
  final String name;

  ///
  @JsonKey(name: 'description')
  final String description;

  ///
  @JsonKey(name: 'price')
  final int price;

  ///
  @JsonKey(name: 'imageUrl')
  final String imageUrl;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MealEntity &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode ^ price.hashCode ^ imageUrl.hashCode;
}
