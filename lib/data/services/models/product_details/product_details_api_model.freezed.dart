// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VolumeInfoApiModel {
  int get volumeMl;
  int get price;
  int get variantId;

  /// Create a copy of VolumeInfoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VolumeInfoApiModelCopyWith<VolumeInfoApiModel> get copyWith =>
      _$VolumeInfoApiModelCopyWithImpl<VolumeInfoApiModel>(
          this as VolumeInfoApiModel, _$identity);

  /// Serializes this VolumeInfoApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VolumeInfoApiModel &&
            (identical(other.volumeMl, volumeMl) ||
                other.volumeMl == volumeMl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, volumeMl, price, variantId);

  @override
  String toString() {
    return 'VolumeInfoApiModel(volumeMl: $volumeMl, price: $price, variantId: $variantId)';
  }
}

/// @nodoc
abstract mixin class $VolumeInfoApiModelCopyWith<$Res> {
  factory $VolumeInfoApiModelCopyWith(
          VolumeInfoApiModel value, $Res Function(VolumeInfoApiModel) _then) =
      _$VolumeInfoApiModelCopyWithImpl;
  @useResult
  $Res call({int volumeMl, int price, int variantId});
}

/// @nodoc
class _$VolumeInfoApiModelCopyWithImpl<$Res>
    implements $VolumeInfoApiModelCopyWith<$Res> {
  _$VolumeInfoApiModelCopyWithImpl(this._self, this._then);

  final VolumeInfoApiModel _self;
  final $Res Function(VolumeInfoApiModel) _then;

  /// Create a copy of VolumeInfoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? volumeMl = null,
    Object? price = null,
    Object? variantId = null,
  }) {
    return _then(_self.copyWith(
      volumeMl: null == volumeMl
          ? _self.volumeMl
          : volumeMl // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      variantId: null == variantId
          ? _self.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [VolumeInfoApiModel].
extension VolumeInfoApiModelPatterns on VolumeInfoApiModel {
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
    TResult Function(_VolumeInfoApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VolumeInfoApiModel() when $default != null:
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
    TResult Function(_VolumeInfoApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolumeInfoApiModel():
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
    TResult? Function(_VolumeInfoApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolumeInfoApiModel() when $default != null:
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
    TResult Function(int volumeMl, int price, int variantId)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VolumeInfoApiModel() when $default != null:
        return $default(_that.volumeMl, _that.price, _that.variantId);
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
    TResult Function(int volumeMl, int price, int variantId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolumeInfoApiModel():
        return $default(_that.volumeMl, _that.price, _that.variantId);
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
    TResult? Function(int volumeMl, int price, int variantId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolumeInfoApiModel() when $default != null:
        return $default(_that.volumeMl, _that.price, _that.variantId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VolumeInfoApiModel implements VolumeInfoApiModel {
  const _VolumeInfoApiModel(
      {required this.volumeMl, required this.price, required this.variantId});
  factory _VolumeInfoApiModel.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoApiModelFromJson(json);

  @override
  final int volumeMl;
  @override
  final int price;
  @override
  final int variantId;

  /// Create a copy of VolumeInfoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VolumeInfoApiModelCopyWith<_VolumeInfoApiModel> get copyWith =>
      __$VolumeInfoApiModelCopyWithImpl<_VolumeInfoApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VolumeInfoApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VolumeInfoApiModel &&
            (identical(other.volumeMl, volumeMl) ||
                other.volumeMl == volumeMl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, volumeMl, price, variantId);

  @override
  String toString() {
    return 'VolumeInfoApiModel(volumeMl: $volumeMl, price: $price, variantId: $variantId)';
  }
}

/// @nodoc
abstract mixin class _$VolumeInfoApiModelCopyWith<$Res>
    implements $VolumeInfoApiModelCopyWith<$Res> {
  factory _$VolumeInfoApiModelCopyWith(
          _VolumeInfoApiModel value, $Res Function(_VolumeInfoApiModel) _then) =
      __$VolumeInfoApiModelCopyWithImpl;
  @override
  @useResult
  $Res call({int volumeMl, int price, int variantId});
}

/// @nodoc
class __$VolumeInfoApiModelCopyWithImpl<$Res>
    implements _$VolumeInfoApiModelCopyWith<$Res> {
  __$VolumeInfoApiModelCopyWithImpl(this._self, this._then);

  final _VolumeInfoApiModel _self;
  final $Res Function(_VolumeInfoApiModel) _then;

  /// Create a copy of VolumeInfoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? volumeMl = null,
    Object? price = null,
    Object? variantId = null,
  }) {
    return _then(_VolumeInfoApiModel(
      volumeMl: null == volumeMl
          ? _self.volumeMl
          : volumeMl // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      variantId: null == variantId
          ? _self.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ProductDetailsApiModel {
  int get id;
  String get name;
  String? get description;
  int get categoryId;
  String get categoryName;
  String get imageUrl;
  int get basePrice;
  List<VolumeInfoApiModel> get volumeInfo;

  /// Create a copy of ProductDetailsApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductDetailsApiModelCopyWith<ProductDetailsApiModel> get copyWith =>
      _$ProductDetailsApiModelCopyWithImpl<ProductDetailsApiModel>(
          this as ProductDetailsApiModel, _$identity);

  /// Serializes this ProductDetailsApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductDetailsApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            const DeepCollectionEquality()
                .equals(other.volumeInfo, volumeInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      categoryId,
      categoryName,
      imageUrl,
      basePrice,
      const DeepCollectionEquality().hash(volumeInfo));

  @override
  String toString() {
    return 'ProductDetailsApiModel(id: $id, name: $name, description: $description, categoryId: $categoryId, categoryName: $categoryName, imageUrl: $imageUrl, basePrice: $basePrice, volumeInfo: $volumeInfo)';
  }
}

/// @nodoc
abstract mixin class $ProductDetailsApiModelCopyWith<$Res> {
  factory $ProductDetailsApiModelCopyWith(ProductDetailsApiModel value,
          $Res Function(ProductDetailsApiModel) _then) =
      _$ProductDetailsApiModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      int categoryId,
      String categoryName,
      String imageUrl,
      int basePrice,
      List<VolumeInfoApiModel> volumeInfo});
}

/// @nodoc
class _$ProductDetailsApiModelCopyWithImpl<$Res>
    implements $ProductDetailsApiModelCopyWith<$Res> {
  _$ProductDetailsApiModelCopyWithImpl(this._self, this._then);

  final ProductDetailsApiModel _self;
  final $Res Function(ProductDetailsApiModel) _then;

  /// Create a copy of ProductDetailsApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? imageUrl = null,
    Object? basePrice = null,
    Object? volumeInfo = null,
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
      categoryName: null == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: null == basePrice
          ? _self.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int,
      volumeInfo: null == volumeInfo
          ? _self.volumeInfo
          : volumeInfo // ignore: cast_nullable_to_non_nullable
              as List<VolumeInfoApiModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductDetailsApiModel].
extension ProductDetailsApiModelPatterns on ProductDetailsApiModel {
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
    TResult Function(_ProductDetailsApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductDetailsApiModel() when $default != null:
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
    TResult Function(_ProductDetailsApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductDetailsApiModel():
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
    TResult? Function(_ProductDetailsApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductDetailsApiModel() when $default != null:
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
    TResult Function(
            int id,
            String name,
            String? description,
            int categoryId,
            String categoryName,
            String imageUrl,
            int basePrice,
            List<VolumeInfoApiModel> volumeInfo)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductDetailsApiModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.categoryId,
            _that.categoryName,
            _that.imageUrl,
            _that.basePrice,
            _that.volumeInfo);
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
    TResult Function(
            int id,
            String name,
            String? description,
            int categoryId,
            String categoryName,
            String imageUrl,
            int basePrice,
            List<VolumeInfoApiModel> volumeInfo)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductDetailsApiModel():
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.categoryId,
            _that.categoryName,
            _that.imageUrl,
            _that.basePrice,
            _that.volumeInfo);
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
    TResult? Function(
            int id,
            String name,
            String? description,
            int categoryId,
            String categoryName,
            String imageUrl,
            int basePrice,
            List<VolumeInfoApiModel> volumeInfo)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductDetailsApiModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.categoryId,
            _that.categoryName,
            _that.imageUrl,
            _that.basePrice,
            _that.volumeInfo);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProductDetailsApiModel implements ProductDetailsApiModel {
  const _ProductDetailsApiModel(
      {required this.id,
      required this.name,
      this.description,
      required this.categoryId,
      required this.categoryName,
      required this.imageUrl,
      required this.basePrice,
      required final List<VolumeInfoApiModel> volumeInfo})
      : _volumeInfo = volumeInfo;
  factory _ProductDetailsApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsApiModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final int categoryId;
  @override
  final String categoryName;
  @override
  final String imageUrl;
  @override
  final int basePrice;
  final List<VolumeInfoApiModel> _volumeInfo;
  @override
  List<VolumeInfoApiModel> get volumeInfo {
    if (_volumeInfo is EqualUnmodifiableListView) return _volumeInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_volumeInfo);
  }

  /// Create a copy of ProductDetailsApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductDetailsApiModelCopyWith<_ProductDetailsApiModel> get copyWith =>
      __$ProductDetailsApiModelCopyWithImpl<_ProductDetailsApiModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductDetailsApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductDetailsApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            const DeepCollectionEquality()
                .equals(other._volumeInfo, _volumeInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      categoryId,
      categoryName,
      imageUrl,
      basePrice,
      const DeepCollectionEquality().hash(_volumeInfo));

  @override
  String toString() {
    return 'ProductDetailsApiModel(id: $id, name: $name, description: $description, categoryId: $categoryId, categoryName: $categoryName, imageUrl: $imageUrl, basePrice: $basePrice, volumeInfo: $volumeInfo)';
  }
}

/// @nodoc
abstract mixin class _$ProductDetailsApiModelCopyWith<$Res>
    implements $ProductDetailsApiModelCopyWith<$Res> {
  factory _$ProductDetailsApiModelCopyWith(_ProductDetailsApiModel value,
          $Res Function(_ProductDetailsApiModel) _then) =
      __$ProductDetailsApiModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      int categoryId,
      String categoryName,
      String imageUrl,
      int basePrice,
      List<VolumeInfoApiModel> volumeInfo});
}

/// @nodoc
class __$ProductDetailsApiModelCopyWithImpl<$Res>
    implements _$ProductDetailsApiModelCopyWith<$Res> {
  __$ProductDetailsApiModelCopyWithImpl(this._self, this._then);

  final _ProductDetailsApiModel _self;
  final $Res Function(_ProductDetailsApiModel) _then;

  /// Create a copy of ProductDetailsApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? imageUrl = null,
    Object? basePrice = null,
    Object? volumeInfo = null,
  }) {
    return _then(_ProductDetailsApiModel(
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
      categoryName: null == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: null == basePrice
          ? _self.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as int,
      volumeInfo: null == volumeInfo
          ? _self._volumeInfo
          : volumeInfo // ignore: cast_nullable_to_non_nullable
              as List<VolumeInfoApiModel>,
    ));
  }
}

// dart format on
