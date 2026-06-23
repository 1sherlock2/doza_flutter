// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductsApiModel {
  int get id;
  String get name;
  String? get description;
  int get categoryId;
  String get imageUrl;
  List<int?> get volumeMl;
  int get basePrice;

  /// Create a copy of ProductsApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductsApiModelCopyWith<ProductsApiModel> get copyWith =>
      _$ProductsApiModelCopyWithImpl<ProductsApiModel>(
          this as ProductsApiModel, _$identity);

  /// Serializes this ProductsApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductsApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other.volumeMl, volumeMl) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      categoryId,
      imageUrl,
      const DeepCollectionEquality().hash(volumeMl),
      basePrice);

  @override
  String toString() {
    return 'ProductsApiModel(id: $id, name: $name, description: $description, categoryId: $categoryId, imageUrl: $imageUrl, volumeMl: $volumeMl, basePrice: $basePrice)';
  }
}

/// @nodoc
abstract mixin class $ProductsApiModelCopyWith<$Res> {
  factory $ProductsApiModelCopyWith(
          ProductsApiModel value, $Res Function(ProductsApiModel) _then) =
      _$ProductsApiModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      int categoryId,
      String imageUrl,
      List<int?> volumeMl,
      int basePrice});
}

/// @nodoc
class _$ProductsApiModelCopyWithImpl<$Res>
    implements $ProductsApiModelCopyWith<$Res> {
  _$ProductsApiModelCopyWithImpl(this._self, this._then);

  final ProductsApiModel _self;
  final $Res Function(ProductsApiModel) _then;

  /// Create a copy of ProductsApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? categoryId = null,
    Object? imageUrl = null,
    Object? volumeMl = null,
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
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      volumeMl: null == volumeMl
          ? _self.volumeMl
          : volumeMl // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      basePrice: null == basePrice
          ? _self.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductsApiModel].
extension ProductsApiModelPatterns on ProductsApiModel {
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
    TResult Function(_ProductsApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductsApiModel() when $default != null:
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
    TResult Function(_ProductsApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductsApiModel():
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
    TResult? Function(_ProductsApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductsApiModel() when $default != null:
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
    TResult Function(int id, String name, String? description, int categoryId,
            String imageUrl, List<int?> volumeMl, int basePrice)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductsApiModel() when $default != null:
        return $default(_that.id, _that.name, _that.description,
            _that.categoryId, _that.imageUrl, _that.volumeMl, _that.basePrice);
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
    TResult Function(int id, String name, String? description, int categoryId,
            String imageUrl, List<int?> volumeMl, int basePrice)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductsApiModel():
        return $default(_that.id, _that.name, _that.description,
            _that.categoryId, _that.imageUrl, _that.volumeMl, _that.basePrice);
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
    TResult? Function(int id, String name, String? description, int categoryId,
            String imageUrl, List<int?> volumeMl, int basePrice)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductsApiModel() when $default != null:
        return $default(_that.id, _that.name, _that.description,
            _that.categoryId, _that.imageUrl, _that.volumeMl, _that.basePrice);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProductsApiModel implements ProductsApiModel {
  const _ProductsApiModel(
      {required this.id,
      required this.name,
      this.description,
      required this.categoryId,
      required this.imageUrl,
      required final List<int?> volumeMl,
      required this.basePrice})
      : _volumeMl = volumeMl;
  factory _ProductsApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsApiModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final int categoryId;
  @override
  final String imageUrl;
  final List<int?> _volumeMl;
  @override
  List<int?> get volumeMl {
    if (_volumeMl is EqualUnmodifiableListView) return _volumeMl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_volumeMl);
  }

  @override
  final int basePrice;

  /// Create a copy of ProductsApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductsApiModelCopyWith<_ProductsApiModel> get copyWith =>
      __$ProductsApiModelCopyWithImpl<_ProductsApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductsApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductsApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._volumeMl, _volumeMl) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      categoryId,
      imageUrl,
      const DeepCollectionEquality().hash(_volumeMl),
      basePrice);

  @override
  String toString() {
    return 'ProductsApiModel(id: $id, name: $name, description: $description, categoryId: $categoryId, imageUrl: $imageUrl, volumeMl: $volumeMl, basePrice: $basePrice)';
  }
}

/// @nodoc
abstract mixin class _$ProductsApiModelCopyWith<$Res>
    implements $ProductsApiModelCopyWith<$Res> {
  factory _$ProductsApiModelCopyWith(
          _ProductsApiModel value, $Res Function(_ProductsApiModel) _then) =
      __$ProductsApiModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      int categoryId,
      String imageUrl,
      List<int?> volumeMl,
      int basePrice});
}

/// @nodoc
class __$ProductsApiModelCopyWithImpl<$Res>
    implements _$ProductsApiModelCopyWith<$Res> {
  __$ProductsApiModelCopyWithImpl(this._self, this._then);

  final _ProductsApiModel _self;
  final $Res Function(_ProductsApiModel) _then;

  /// Create a copy of ProductsApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? categoryId = null,
    Object? imageUrl = null,
    Object? volumeMl = null,
    Object? basePrice = null,
  }) {
    return _then(_ProductsApiModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      volumeMl: null == volumeMl
          ? _self._volumeMl
          : volumeMl // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      basePrice: null == basePrice
          ? _self.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
