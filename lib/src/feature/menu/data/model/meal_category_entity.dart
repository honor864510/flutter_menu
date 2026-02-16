import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'meal_category_entity.g.dart';

typedef MealCategoryID = String;

@immutable
@JsonSerializable()
final class MealCategoryEntity {
  const MealCategoryEntity({required this.id, this.name = '', this.parentCategoryId});

  /// Connect the generated [_$MealCategoryEntityFromJson] function to the `fromJson`
  /// factory.
  factory MealCategoryEntity.fromJson(Map<String, dynamic> json) => _$MealCategoryEntityFromJson(json);

  /// Connect the generated [_$MealCategoryEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MealCategoryEntityToJson(this);

  ///
  @JsonKey(name: 'id')
  final MealCategoryID id;

  ///
  @JsonKey(name: 'name')
  final String name;

  ///
  @JsonKey(name: 'parentCategoryId')
  final String? parentCategoryId;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MealCategoryEntity &&
        other.id == id &&
        other.name == name &&
        other.parentCategoryId == parentCategoryId;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ parentCategoryId.hashCode;
}
