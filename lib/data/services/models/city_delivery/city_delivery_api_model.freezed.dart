// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_delivery_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CityDeliveryApiModel {
  int get id;
  String get city;
  int get deliveryCost;
  int get deliveryDays;

  /// Create a copy of CityDeliveryApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CityDeliveryApiModelCopyWith<CityDeliveryApiModel> get copyWith =>
      _$CityDeliveryApiModelCopyWithImpl<CityDeliveryApiModel>(
          this as CityDeliveryApiModel, _$identity);

  /// Serializes this CityDeliveryApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CityDeliveryApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.deliveryCost, deliveryCost) ||
                other.deliveryCost == deliveryCost) &&
            (identical(other.deliveryDays, deliveryDays) ||
                other.deliveryDays == deliveryDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, city, deliveryCost, deliveryDays);

  @override
  String toString() {
    return 'CityDeliveryApiModel(id: $id, city: $city, deliveryCost: $deliveryCost, deliveryDays: $deliveryDays)';
  }
}

/// @nodoc
abstract mixin class $CityDeliveryApiModelCopyWith<$Res> {
  factory $CityDeliveryApiModelCopyWith(CityDeliveryApiModel value,
          $Res Function(CityDeliveryApiModel) _then) =
      _$CityDeliveryApiModelCopyWithImpl;
  @useResult
  $Res call({int id, String city, int deliveryCost, int deliveryDays});
}

/// @nodoc
class _$CityDeliveryApiModelCopyWithImpl<$Res>
    implements $CityDeliveryApiModelCopyWith<$Res> {
  _$CityDeliveryApiModelCopyWithImpl(this._self, this._then);

  final CityDeliveryApiModel _self;
  final $Res Function(CityDeliveryApiModel) _then;

  /// Create a copy of CityDeliveryApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? city = null,
    Object? deliveryCost = null,
    Object? deliveryDays = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryCost: null == deliveryCost
          ? _self.deliveryCost
          : deliveryCost // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryDays: null == deliveryDays
          ? _self.deliveryDays
          : deliveryDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [CityDeliveryApiModel].
extension CityDeliveryApiModelPatterns on CityDeliveryApiModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CityDeliveryApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CityDeliveryApiModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CityDeliveryApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CityDeliveryApiModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CityDeliveryApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CityDeliveryApiModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String city, int deliveryCost, int deliveryDays)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CityDeliveryApiModel() when $default != null:
        return $default(
            _that.id, _that.city, _that.deliveryCost, _that.deliveryDays);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String city, int deliveryCost, int deliveryDays)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CityDeliveryApiModel():
        return $default(
            _that.id, _that.city, _that.deliveryCost, _that.deliveryDays);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String city, int deliveryCost, int deliveryDays)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CityDeliveryApiModel() when $default != null:
        return $default(
            _that.id, _that.city, _that.deliveryCost, _that.deliveryDays);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CityDeliveryApiModel implements CityDeliveryApiModel {
  const _CityDeliveryApiModel(
      {required this.id,
      required this.city,
      required this.deliveryCost,
      required this.deliveryDays});
  factory _CityDeliveryApiModel.fromJson(Map<String, dynamic> json) =>
      _$CityDeliveryApiModelFromJson(json);

  @override
  final int id;
  @override
  final String city;
  @override
  final int deliveryCost;
  @override
  final int deliveryDays;

  /// Create a copy of CityDeliveryApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CityDeliveryApiModelCopyWith<_CityDeliveryApiModel> get copyWith =>
      __$CityDeliveryApiModelCopyWithImpl<_CityDeliveryApiModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CityDeliveryApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CityDeliveryApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.deliveryCost, deliveryCost) ||
                other.deliveryCost == deliveryCost) &&
            (identical(other.deliveryDays, deliveryDays) ||
                other.deliveryDays == deliveryDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, city, deliveryCost, deliveryDays);

  @override
  String toString() {
    return 'CityDeliveryApiModel(id: $id, city: $city, deliveryCost: $deliveryCost, deliveryDays: $deliveryDays)';
  }
}

/// @nodoc
abstract mixin class _$CityDeliveryApiModelCopyWith<$Res>
    implements $CityDeliveryApiModelCopyWith<$Res> {
  factory _$CityDeliveryApiModelCopyWith(_CityDeliveryApiModel value,
          $Res Function(_CityDeliveryApiModel) _then) =
      __$CityDeliveryApiModelCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String city, int deliveryCost, int deliveryDays});
}

/// @nodoc
class __$CityDeliveryApiModelCopyWithImpl<$Res>
    implements _$CityDeliveryApiModelCopyWith<$Res> {
  __$CityDeliveryApiModelCopyWithImpl(this._self, this._then);

  final _CityDeliveryApiModel _self;
  final $Res Function(_CityDeliveryApiModel) _then;

  /// Create a copy of CityDeliveryApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? city = null,
    Object? deliveryCost = null,
    Object? deliveryDays = null,
  }) {
    return _then(_CityDeliveryApiModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryCost: null == deliveryCost
          ? _self.deliveryCost
          : deliveryCost // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryDays: null == deliveryDays
          ? _self.deliveryDays
          : deliveryDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
