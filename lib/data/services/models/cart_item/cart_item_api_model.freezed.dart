// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartItemApiModel {
  int get cartItemId;
  int get quantity;
  @JsonKey(includeToJson: false)
  String get createdAt;
  int get variantId;
  int get volumeMl;
  int get price;
  int get productId;
  String get productName;
  String get imageUrl;
  String? get description;

  /// Create a copy of CartItemApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartItemApiModelCopyWith<CartItemApiModel> get copyWith =>
      _$CartItemApiModelCopyWithImpl<CartItemApiModel>(
          this as CartItemApiModel, _$identity);

  /// Serializes this CartItemApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartItemApiModel &&
            (identical(other.cartItemId, cartItemId) ||
                other.cartItemId == cartItemId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.volumeMl, volumeMl) ||
                other.volumeMl == volumeMl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cartItemId,
      quantity,
      createdAt,
      variantId,
      volumeMl,
      price,
      productId,
      productName,
      imageUrl,
      description);

  @override
  String toString() {
    return 'CartItemApiModel(cartItemId: $cartItemId, quantity: $quantity, createdAt: $createdAt, variantId: $variantId, volumeMl: $volumeMl, price: $price, productId: $productId, productName: $productName, imageUrl: $imageUrl, description: $description)';
  }
}

/// @nodoc
abstract mixin class $CartItemApiModelCopyWith<$Res> {
  factory $CartItemApiModelCopyWith(
          CartItemApiModel value, $Res Function(CartItemApiModel) _then) =
      _$CartItemApiModelCopyWithImpl;
  @useResult
  $Res call(
      {int cartItemId,
      int quantity,
      @JsonKey(includeToJson: false) String createdAt,
      int variantId,
      int volumeMl,
      int price,
      int productId,
      String productName,
      String imageUrl,
      String? description});
}

/// @nodoc
class _$CartItemApiModelCopyWithImpl<$Res>
    implements $CartItemApiModelCopyWith<$Res> {
  _$CartItemApiModelCopyWithImpl(this._self, this._then);

  final CartItemApiModel _self;
  final $Res Function(CartItemApiModel) _then;

  /// Create a copy of CartItemApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = null,
    Object? quantity = null,
    Object? createdAt = null,
    Object? variantId = null,
    Object? volumeMl = null,
    Object? price = null,
    Object? productId = null,
    Object? productName = null,
    Object? imageUrl = null,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      cartItemId: null == cartItemId
          ? _self.cartItemId
          : cartItemId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: null == variantId
          ? _self.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int,
      volumeMl: null == volumeMl
          ? _self.volumeMl
          : volumeMl // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CartItemApiModel].
extension CartItemApiModelPatterns on CartItemApiModel {
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
    TResult Function(_CartItemApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartItemApiModel() when $default != null:
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
    TResult Function(_CartItemApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartItemApiModel():
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
    TResult? Function(_CartItemApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartItemApiModel() when $default != null:
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
            int cartItemId,
            int quantity,
            @JsonKey(includeToJson: false) String createdAt,
            int variantId,
            int volumeMl,
            int price,
            int productId,
            String productName,
            String imageUrl,
            String? description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartItemApiModel() when $default != null:
        return $default(
            _that.cartItemId,
            _that.quantity,
            _that.createdAt,
            _that.variantId,
            _that.volumeMl,
            _that.price,
            _that.productId,
            _that.productName,
            _that.imageUrl,
            _that.description);
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
            int cartItemId,
            int quantity,
            @JsonKey(includeToJson: false) String createdAt,
            int variantId,
            int volumeMl,
            int price,
            int productId,
            String productName,
            String imageUrl,
            String? description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartItemApiModel():
        return $default(
            _that.cartItemId,
            _that.quantity,
            _that.createdAt,
            _that.variantId,
            _that.volumeMl,
            _that.price,
            _that.productId,
            _that.productName,
            _that.imageUrl,
            _that.description);
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
            int cartItemId,
            int quantity,
            @JsonKey(includeToJson: false) String createdAt,
            int variantId,
            int volumeMl,
            int price,
            int productId,
            String productName,
            String imageUrl,
            String? description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartItemApiModel() when $default != null:
        return $default(
            _that.cartItemId,
            _that.quantity,
            _that.createdAt,
            _that.variantId,
            _that.volumeMl,
            _that.price,
            _that.productId,
            _that.productName,
            _that.imageUrl,
            _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CartItemApiModel implements CartItemApiModel {
  const _CartItemApiModel(
      {required this.cartItemId,
      required this.quantity,
      @JsonKey(includeToJson: false) required this.createdAt,
      required this.variantId,
      required this.volumeMl,
      required this.price,
      required this.productId,
      required this.productName,
      required this.imageUrl,
      this.description});
  factory _CartItemApiModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemApiModelFromJson(json);

  @override
  final int cartItemId;
  @override
  final int quantity;
  @override
  @JsonKey(includeToJson: false)
  final String createdAt;
  @override
  final int variantId;
  @override
  final int volumeMl;
  @override
  final int price;
  @override
  final int productId;
  @override
  final String productName;
  @override
  final String imageUrl;
  @override
  final String? description;

  /// Create a copy of CartItemApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartItemApiModelCopyWith<_CartItemApiModel> get copyWith =>
      __$CartItemApiModelCopyWithImpl<_CartItemApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CartItemApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartItemApiModel &&
            (identical(other.cartItemId, cartItemId) ||
                other.cartItemId == cartItemId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.volumeMl, volumeMl) ||
                other.volumeMl == volumeMl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cartItemId,
      quantity,
      createdAt,
      variantId,
      volumeMl,
      price,
      productId,
      productName,
      imageUrl,
      description);

  @override
  String toString() {
    return 'CartItemApiModel(cartItemId: $cartItemId, quantity: $quantity, createdAt: $createdAt, variantId: $variantId, volumeMl: $volumeMl, price: $price, productId: $productId, productName: $productName, imageUrl: $imageUrl, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$CartItemApiModelCopyWith<$Res>
    implements $CartItemApiModelCopyWith<$Res> {
  factory _$CartItemApiModelCopyWith(
          _CartItemApiModel value, $Res Function(_CartItemApiModel) _then) =
      __$CartItemApiModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int cartItemId,
      int quantity,
      @JsonKey(includeToJson: false) String createdAt,
      int variantId,
      int volumeMl,
      int price,
      int productId,
      String productName,
      String imageUrl,
      String? description});
}

/// @nodoc
class __$CartItemApiModelCopyWithImpl<$Res>
    implements _$CartItemApiModelCopyWith<$Res> {
  __$CartItemApiModelCopyWithImpl(this._self, this._then);

  final _CartItemApiModel _self;
  final $Res Function(_CartItemApiModel) _then;

  /// Create a copy of CartItemApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cartItemId = null,
    Object? quantity = null,
    Object? createdAt = null,
    Object? variantId = null,
    Object? volumeMl = null,
    Object? price = null,
    Object? productId = null,
    Object? productName = null,
    Object? imageUrl = null,
    Object? description = freezed,
  }) {
    return _then(_CartItemApiModel(
      cartItemId: null == cartItemId
          ? _self.cartItemId
          : cartItemId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: null == variantId
          ? _self.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int,
      volumeMl: null == volumeMl
          ? _self.volumeMl
          : volumeMl // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
