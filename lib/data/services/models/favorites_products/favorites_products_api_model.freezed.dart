// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_products_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
FavoritesProductsApiModel _$FavoritesProductsApiModelFromJson(
    Map<String, dynamic> json) {
  return _FavoritesProducts.fromJson(json);
}

/// @nodoc
mixin _$FavoritesProductsApiModel {
  int get id;
  String get name;
  String get imageUrl;
  int get basePrice;

  /// Create a copy of FavoritesProductsApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoritesProductsApiModelCopyWith<FavoritesProductsApiModel> get copyWith =>
      _$FavoritesProductsApiModelCopyWithImpl<FavoritesProductsApiModel>(
          this as FavoritesProductsApiModel, _$identity);

  /// Serializes this FavoritesProductsApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoritesProductsApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, basePrice);

  @override
  String toString() {
    return 'FavoritesProductsApiModel(id: $id, name: $name, imageUrl: $imageUrl, basePrice: $basePrice)';
  }
}

/// @nodoc
abstract mixin class $FavoritesProductsApiModelCopyWith<$Res> {
  factory $FavoritesProductsApiModelCopyWith(FavoritesProductsApiModel value,
          $Res Function(FavoritesProductsApiModel) _then) =
      _$FavoritesProductsApiModelCopyWithImpl;
  @useResult
  $Res call({int id, String name, String imageUrl, int basePrice});
}

/// @nodoc
class _$FavoritesProductsApiModelCopyWithImpl<$Res>
    implements $FavoritesProductsApiModelCopyWith<$Res> {
  _$FavoritesProductsApiModelCopyWithImpl(this._self, this._then);

  final FavoritesProductsApiModel _self;
  final $Res Function(FavoritesProductsApiModel) _then;

  /// Create a copy of FavoritesProductsApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? basePrice = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: null == basePrice
          ? _self.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [FavoritesProductsApiModel].
extension FavoritesProductsApiModelPatterns on FavoritesProductsApiModel {
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
    TResult Function(_FavoritesProducts value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FavoritesProducts() when $default != null:
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
    TResult Function(_FavoritesProducts value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoritesProducts():
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
    TResult? Function(_FavoritesProducts value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoritesProducts() when $default != null:
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
    TResult Function(int id, String name, String imageUrl, int basePrice)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FavoritesProducts() when $default != null:
        return $default(_that.id, _that.name, _that.imageUrl, _that.basePrice);
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
    TResult Function(int id, String name, String imageUrl, int basePrice)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoritesProducts():
        return $default(_that.id, _that.name, _that.imageUrl, _that.basePrice);
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
    TResult? Function(int id, String name, String imageUrl, int basePrice)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FavoritesProducts() when $default != null:
        return $default(_that.id, _that.name, _that.imageUrl, _that.basePrice);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FavoritesProducts implements FavoritesProductsApiModel {
  const _FavoritesProducts(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.basePrice});
  factory _FavoritesProducts.fromJson(Map<String, dynamic> json) =>
      _$FavoritesProductsFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final int basePrice;

  /// Create a copy of FavoritesProductsApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FavoritesProductsCopyWith<_FavoritesProducts> get copyWith =>
      __$FavoritesProductsCopyWithImpl<_FavoritesProducts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FavoritesProductsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoritesProducts &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, basePrice);

  @override
  String toString() {
    return 'FavoritesProductsApiModel(id: $id, name: $name, imageUrl: $imageUrl, basePrice: $basePrice)';
  }
}

/// @nodoc
abstract mixin class _$FavoritesProductsCopyWith<$Res>
    implements $FavoritesProductsApiModelCopyWith<$Res> {
  factory _$FavoritesProductsCopyWith(
          _FavoritesProducts value, $Res Function(_FavoritesProducts) _then) =
      __$FavoritesProductsCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, String imageUrl, int basePrice});
}

/// @nodoc
class __$FavoritesProductsCopyWithImpl<$Res>
    implements _$FavoritesProductsCopyWith<$Res> {
  __$FavoritesProductsCopyWithImpl(this._self, this._then);

  final _FavoritesProducts _self;
  final $Res Function(_FavoritesProducts) _then;

  /// Create a copy of FavoritesProductsApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? basePrice = null,
  }) {
    return _then(_FavoritesProducts(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: null == basePrice
          ? _self.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
