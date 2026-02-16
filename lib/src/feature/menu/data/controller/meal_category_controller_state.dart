import 'package:collection/collection.dart';
import 'package:flutter_menu/src/feature/menu/data/model/meal_category_entity.dart';
import 'package:meta/meta.dart';

/// Entity placeholder
@immutable
final class MealCategoryControllerStateEntity {
  const MealCategoryControllerStateEntity({required this.categories});

  factory MealCategoryControllerStateEntity.initial() => const MealCategoryControllerStateEntity(categories: []);

  final List<MealCategoryEntity> categories;

  MealCategoryControllerStateEntity copyWith({List<MealCategoryEntity>? categories}) =>
      MealCategoryControllerStateEntity(categories: categories ?? this.categories);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MealCategoryControllerStateEntity &&
        const DeepCollectionEquality().equals(categories, other.categories);
  }

  @override
  int get hashCode => const DeepCollectionEquality().hash(categories);
}

/// {@template meal_category_controller_state}
/// MealCategoryControllerState.
/// {@endtemplate}
sealed class MealCategoryControllerState extends _$MealCategoryControllerStateBase {
  /// {@macro meal_category_controller_state}
  const MealCategoryControllerState({required super.data, required super.message});

  /// Idle
  /// {@macro meal_category_controller_state}
  const factory MealCategoryControllerState.idle({required MealCategoryControllerStateEntity data, String message}) =
      MealCategoryControllerState$Idle;

  /// Processing
  /// {@macro meal_category_controller_state}
  const factory MealCategoryControllerState.processing({
    required MealCategoryControllerStateEntity data,
    String message,
  }) = MealCategoryControllerState$Processing;

  /// Failed
  /// {@macro meal_category_controller_state}
  const factory MealCategoryControllerState.failed({required MealCategoryControllerStateEntity data, String message}) =
      MealCategoryControllerState$Failed;

  /// Initial
  /// {@macro meal_category_controller_state}
  factory MealCategoryControllerState.initial({required MealCategoryControllerStateEntity data, String? message}) =>
      MealCategoryControllerState$Idle(data: data, message: message ?? 'Initial');
}

/// Idle
final class MealCategoryControllerState$Idle extends MealCategoryControllerState {
  const MealCategoryControllerState$Idle({required super.data, super.message = 'Idle'});

  @override
  String get type => 'idle';
}

/// Processing
final class MealCategoryControllerState$Processing extends MealCategoryControllerState {
  const MealCategoryControllerState$Processing({required super.data, super.message = 'Processing'});

  @override
  String get type => 'processing';
}

/// Failed
final class MealCategoryControllerState$Failed extends MealCategoryControllerState {
  const MealCategoryControllerState$Failed({required super.data, super.message = 'Failed'});

  @override
  String get type => 'failed';
}

/// Pattern matching for [MealCategoryControllerState].
typedef MealCategoryControllerStateMatch<R, S extends MealCategoryControllerState> = R Function(S element);

@immutable
abstract base class _$MealCategoryControllerStateBase {
  const _$MealCategoryControllerStateBase({required this.data, required this.message});

  /// Type alias for [MealCategoryControllerState].
  abstract final String type;

  /// Data entity payload.
  @nonVirtual
  final MealCategoryControllerStateEntity data;

  /// Message or description.
  @nonVirtual
  final String message;

  /// Check if is Idle.
  bool get isIdle => this is MealCategoryControllerState$Idle;

  /// Check if is Processing.
  bool get isProcessing => this is MealCategoryControllerState$Processing;

  /// Check if is Failed.
  bool get isFailed => this is MealCategoryControllerState$Failed;

  /// Pattern matching for [MealCategoryControllerState].
  R map<R>({
    required MealCategoryControllerStateMatch<R, MealCategoryControllerState$Idle> idle,
    required MealCategoryControllerStateMatch<R, MealCategoryControllerState$Processing> processing,
    required MealCategoryControllerStateMatch<R, MealCategoryControllerState$Failed> failed,
  }) => switch (this) {
    MealCategoryControllerState$Idle s => idle(s),
    MealCategoryControllerState$Processing s => processing(s),
    MealCategoryControllerState$Failed s => failed(s),
    _ => throw AssertionError(),
  };

  /// Pattern matching for [MealCategoryControllerState].
  R maybeMap<R>({
    required R Function() orElse,
    MealCategoryControllerStateMatch<R, MealCategoryControllerState$Idle>? idle,
    MealCategoryControllerStateMatch<R, MealCategoryControllerState$Processing>? processing,
    MealCategoryControllerStateMatch<R, MealCategoryControllerState$Failed>? failed,
  }) => map<R>(
    idle: idle ?? (_) => orElse(),
    processing: processing ?? (_) => orElse(),
    failed: failed ?? (_) => orElse(),
  );

  /// Pattern matching for [MealCategoryControllerState].
  R? mapOrNull<R>({
    MealCategoryControllerStateMatch<R, MealCategoryControllerState$Idle>? idle,
    MealCategoryControllerStateMatch<R, MealCategoryControllerState$Processing>? processing,
    MealCategoryControllerStateMatch<R, MealCategoryControllerState$Failed>? failed,
  }) => map<R?>(idle: idle ?? (_) => null, processing: processing ?? (_) => null, failed: failed ?? (_) => null);

  @override
  int get hashCode => Object.hash(type, data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _$MealCategoryControllerStateBase && type == other.type && identical(data, other.data));

  @override
  String toString() => 'MealCategoryControllerState.$type{message: $message}';
}
