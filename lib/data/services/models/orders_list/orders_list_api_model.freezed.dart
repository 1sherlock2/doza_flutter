// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_list_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrdersListProductApiModel {
  String get imageUrl;
  String get name;

  /// Create a copy of OrdersListProductApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrdersListProductApiModelCopyWith<OrdersListProductApiModel> get copyWith =>
      _$OrdersListProductApiModelCopyWithImpl<OrdersListProductApiModel>(
          this as OrdersListProductApiModel, _$identity);

  /// Serializes this OrdersListProductApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrdersListProductApiModel &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, name);

  @override
  String toString() {
    return 'OrdersListProductApiModel(imageUrl: $imageUrl, name: $name)';
  }
}

/// @nodoc
abstract mixin class $OrdersListProductApiModelCopyWith<$Res> {
  factory $OrdersListProductApiModelCopyWith(OrdersListProductApiModel value,
          $Res Function(OrdersListProductApiModel) _then) =
      _$OrdersListProductApiModelCopyWithImpl;
  @useResult
  $Res call({String imageUrl, String name});
}

/// @nodoc
class _$OrdersListProductApiModelCopyWithImpl<$Res>
    implements $OrdersListProductApiModelCopyWith<$Res> {
  _$OrdersListProductApiModelCopyWithImpl(this._self, this._then);

  final OrdersListProductApiModel _self;
  final $Res Function(OrdersListProductApiModel) _then;

  /// Create a copy of OrdersListProductApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrdersListProductApiModel].
extension OrdersListProductApiModelPatterns on OrdersListProductApiModel {
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
    TResult Function(_OrdersListProductApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrdersListProductApiModel() when $default != null:
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
    TResult Function(_OrdersListProductApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListProductApiModel():
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
    TResult? Function(_OrdersListProductApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListProductApiModel() when $default != null:
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
    TResult Function(String imageUrl, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrdersListProductApiModel() when $default != null:
        return $default(_that.imageUrl, _that.name);
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
    TResult Function(String imageUrl, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListProductApiModel():
        return $default(_that.imageUrl, _that.name);
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
    TResult? Function(String imageUrl, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListProductApiModel() when $default != null:
        return $default(_that.imageUrl, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrdersListProductApiModel implements OrdersListProductApiModel {
  _OrdersListProductApiModel({required this.imageUrl, required this.name});
  factory _OrdersListProductApiModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersListProductApiModelFromJson(json);

  @override
  final String imageUrl;
  @override
  final String name;

  /// Create a copy of OrdersListProductApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrdersListProductApiModelCopyWith<_OrdersListProductApiModel>
      get copyWith =>
          __$OrdersListProductApiModelCopyWithImpl<_OrdersListProductApiModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrdersListProductApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrdersListProductApiModel &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, name);

  @override
  String toString() {
    return 'OrdersListProductApiModel(imageUrl: $imageUrl, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$OrdersListProductApiModelCopyWith<$Res>
    implements $OrdersListProductApiModelCopyWith<$Res> {
  factory _$OrdersListProductApiModelCopyWith(_OrdersListProductApiModel value,
          $Res Function(_OrdersListProductApiModel) _then) =
      __$OrdersListProductApiModelCopyWithImpl;
  @override
  @useResult
  $Res call({String imageUrl, String name});
}

/// @nodoc
class __$OrdersListProductApiModelCopyWithImpl<$Res>
    implements _$OrdersListProductApiModelCopyWith<$Res> {
  __$OrdersListProductApiModelCopyWithImpl(this._self, this._then);

  final _OrdersListProductApiModel _self;
  final $Res Function(_OrdersListProductApiModel) _then;

  /// Create a copy of OrdersListProductApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageUrl = null,
    Object? name = null,
  }) {
    return _then(_OrdersListProductApiModel(
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$OrdersListProductVariantApiModel {
  int get price;
  OrdersListProductApiModel get product;
  int get volumeMl;

  /// Create a copy of OrdersListProductVariantApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrdersListProductVariantApiModelCopyWith<OrdersListProductVariantApiModel>
      get copyWith => _$OrdersListProductVariantApiModelCopyWithImpl<
              OrdersListProductVariantApiModel>(
          this as OrdersListProductVariantApiModel, _$identity);

  /// Serializes this OrdersListProductVariantApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrdersListProductVariantApiModel &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.volumeMl, volumeMl) ||
                other.volumeMl == volumeMl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, price, product, volumeMl);

  @override
  String toString() {
    return 'OrdersListProductVariantApiModel(price: $price, product: $product, volumeMl: $volumeMl)';
  }
}

/// @nodoc
abstract mixin class $OrdersListProductVariantApiModelCopyWith<$Res> {
  factory $OrdersListProductVariantApiModelCopyWith(
          OrdersListProductVariantApiModel value,
          $Res Function(OrdersListProductVariantApiModel) _then) =
      _$OrdersListProductVariantApiModelCopyWithImpl;
  @useResult
  $Res call({int price, OrdersListProductApiModel product, int volumeMl});

  $OrdersListProductApiModelCopyWith<$Res> get product;
}

/// @nodoc
class _$OrdersListProductVariantApiModelCopyWithImpl<$Res>
    implements $OrdersListProductVariantApiModelCopyWith<$Res> {
  _$OrdersListProductVariantApiModelCopyWithImpl(this._self, this._then);

  final OrdersListProductVariantApiModel _self;
  final $Res Function(OrdersListProductVariantApiModel) _then;

  /// Create a copy of OrdersListProductVariantApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? product = null,
    Object? volumeMl = null,
  }) {
    return _then(_self.copyWith(
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as OrdersListProductApiModel,
      volumeMl: null == volumeMl
          ? _self.volumeMl
          : volumeMl // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of OrdersListProductVariantApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrdersListProductApiModelCopyWith<$Res> get product {
    return $OrdersListProductApiModelCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OrdersListProductVariantApiModel].
extension OrdersListProductVariantApiModelPatterns
    on OrdersListProductVariantApiModel {
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
    TResult Function(_OrdersListProductVariantApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrdersListProductVariantApiModel() when $default != null:
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
    TResult Function(_OrdersListProductVariantApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListProductVariantApiModel():
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
    TResult? Function(_OrdersListProductVariantApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListProductVariantApiModel() when $default != null:
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
            int price, OrdersListProductApiModel product, int volumeMl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrdersListProductVariantApiModel() when $default != null:
        return $default(_that.price, _that.product, _that.volumeMl);
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
    TResult Function(int price, OrdersListProductApiModel product, int volumeMl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListProductVariantApiModel():
        return $default(_that.price, _that.product, _that.volumeMl);
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
            int price, OrdersListProductApiModel product, int volumeMl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListProductVariantApiModel() when $default != null:
        return $default(_that.price, _that.product, _that.volumeMl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrdersListProductVariantApiModel
    implements OrdersListProductVariantApiModel {
  _OrdersListProductVariantApiModel(
      {required this.price, required this.product, required this.volumeMl});
  factory _OrdersListProductVariantApiModel.fromJson(
          Map<String, dynamic> json) =>
      _$OrdersListProductVariantApiModelFromJson(json);

  @override
  final int price;
  @override
  final OrdersListProductApiModel product;
  @override
  final int volumeMl;

  /// Create a copy of OrdersListProductVariantApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrdersListProductVariantApiModelCopyWith<_OrdersListProductVariantApiModel>
      get copyWith => __$OrdersListProductVariantApiModelCopyWithImpl<
          _OrdersListProductVariantApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrdersListProductVariantApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrdersListProductVariantApiModel &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.volumeMl, volumeMl) ||
                other.volumeMl == volumeMl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, price, product, volumeMl);

  @override
  String toString() {
    return 'OrdersListProductVariantApiModel(price: $price, product: $product, volumeMl: $volumeMl)';
  }
}

/// @nodoc
abstract mixin class _$OrdersListProductVariantApiModelCopyWith<$Res>
    implements $OrdersListProductVariantApiModelCopyWith<$Res> {
  factory _$OrdersListProductVariantApiModelCopyWith(
          _OrdersListProductVariantApiModel value,
          $Res Function(_OrdersListProductVariantApiModel) _then) =
      __$OrdersListProductVariantApiModelCopyWithImpl;
  @override
  @useResult
  $Res call({int price, OrdersListProductApiModel product, int volumeMl});

  @override
  $OrdersListProductApiModelCopyWith<$Res> get product;
}

/// @nodoc
class __$OrdersListProductVariantApiModelCopyWithImpl<$Res>
    implements _$OrdersListProductVariantApiModelCopyWith<$Res> {
  __$OrdersListProductVariantApiModelCopyWithImpl(this._self, this._then);

  final _OrdersListProductVariantApiModel _self;
  final $Res Function(_OrdersListProductVariantApiModel) _then;

  /// Create a copy of OrdersListProductVariantApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? price = null,
    Object? product = null,
    Object? volumeMl = null,
  }) {
    return _then(_OrdersListProductVariantApiModel(
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as OrdersListProductApiModel,
      volumeMl: null == volumeMl
          ? _self.volumeMl
          : volumeMl // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of OrdersListProductVariantApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrdersListProductApiModelCopyWith<$Res> get product {
    return $OrdersListProductApiModelCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

/// @nodoc
mixin _$OrdersListItemApiModel {
  OrdersListProductVariantApiModel get productVariant;
  int get quantity;
  int get subtotal;

  /// Create a copy of OrdersListItemApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrdersListItemApiModelCopyWith<OrdersListItemApiModel> get copyWith =>
      _$OrdersListItemApiModelCopyWithImpl<OrdersListItemApiModel>(
          this as OrdersListItemApiModel, _$identity);

  /// Serializes this OrdersListItemApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrdersListItemApiModel &&
            (identical(other.productVariant, productVariant) ||
                other.productVariant == productVariant) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productVariant, quantity, subtotal);

  @override
  String toString() {
    return 'OrdersListItemApiModel(productVariant: $productVariant, quantity: $quantity, subtotal: $subtotal)';
  }
}

/// @nodoc
abstract mixin class $OrdersListItemApiModelCopyWith<$Res> {
  factory $OrdersListItemApiModelCopyWith(OrdersListItemApiModel value,
          $Res Function(OrdersListItemApiModel) _then) =
      _$OrdersListItemApiModelCopyWithImpl;
  @useResult
  $Res call(
      {OrdersListProductVariantApiModel productVariant,
      int quantity,
      int subtotal});

  $OrdersListProductVariantApiModelCopyWith<$Res> get productVariant;
}

/// @nodoc
class _$OrdersListItemApiModelCopyWithImpl<$Res>
    implements $OrdersListItemApiModelCopyWith<$Res> {
  _$OrdersListItemApiModelCopyWithImpl(this._self, this._then);

  final OrdersListItemApiModel _self;
  final $Res Function(OrdersListItemApiModel) _then;

  /// Create a copy of OrdersListItemApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productVariant = null,
    Object? quantity = null,
    Object? subtotal = null,
  }) {
    return _then(_self.copyWith(
      productVariant: null == productVariant
          ? _self.productVariant
          : productVariant // ignore: cast_nullable_to_non_nullable
              as OrdersListProductVariantApiModel,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of OrdersListItemApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrdersListProductVariantApiModelCopyWith<$Res> get productVariant {
    return $OrdersListProductVariantApiModelCopyWith<$Res>(_self.productVariant,
        (value) {
      return _then(_self.copyWith(productVariant: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OrdersListItemApiModel].
extension OrdersListItemApiModelPatterns on OrdersListItemApiModel {
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
    TResult Function(_OrdersListItemApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrdersListItemApiModel() when $default != null:
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
    TResult Function(_OrdersListItemApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListItemApiModel():
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
    TResult? Function(_OrdersListItemApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListItemApiModel() when $default != null:
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
    TResult Function(OrdersListProductVariantApiModel productVariant,
            int quantity, int subtotal)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrdersListItemApiModel() when $default != null:
        return $default(_that.productVariant, _that.quantity, _that.subtotal);
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
    TResult Function(OrdersListProductVariantApiModel productVariant,
            int quantity, int subtotal)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListItemApiModel():
        return $default(_that.productVariant, _that.quantity, _that.subtotal);
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
    TResult? Function(OrdersListProductVariantApiModel productVariant,
            int quantity, int subtotal)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListItemApiModel() when $default != null:
        return $default(_that.productVariant, _that.quantity, _that.subtotal);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrdersListItemApiModel implements OrdersListItemApiModel {
  const _OrdersListItemApiModel(
      {required this.productVariant,
      required this.quantity,
      required this.subtotal});
  factory _OrdersListItemApiModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersListItemApiModelFromJson(json);

  @override
  final OrdersListProductVariantApiModel productVariant;
  @override
  final int quantity;
  @override
  final int subtotal;

  /// Create a copy of OrdersListItemApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrdersListItemApiModelCopyWith<_OrdersListItemApiModel> get copyWith =>
      __$OrdersListItemApiModelCopyWithImpl<_OrdersListItemApiModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrdersListItemApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrdersListItemApiModel &&
            (identical(other.productVariant, productVariant) ||
                other.productVariant == productVariant) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productVariant, quantity, subtotal);

  @override
  String toString() {
    return 'OrdersListItemApiModel(productVariant: $productVariant, quantity: $quantity, subtotal: $subtotal)';
  }
}

/// @nodoc
abstract mixin class _$OrdersListItemApiModelCopyWith<$Res>
    implements $OrdersListItemApiModelCopyWith<$Res> {
  factory _$OrdersListItemApiModelCopyWith(_OrdersListItemApiModel value,
          $Res Function(_OrdersListItemApiModel) _then) =
      __$OrdersListItemApiModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {OrdersListProductVariantApiModel productVariant,
      int quantity,
      int subtotal});

  @override
  $OrdersListProductVariantApiModelCopyWith<$Res> get productVariant;
}

/// @nodoc
class __$OrdersListItemApiModelCopyWithImpl<$Res>
    implements _$OrdersListItemApiModelCopyWith<$Res> {
  __$OrdersListItemApiModelCopyWithImpl(this._self, this._then);

  final _OrdersListItemApiModel _self;
  final $Res Function(_OrdersListItemApiModel) _then;

  /// Create a copy of OrdersListItemApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productVariant = null,
    Object? quantity = null,
    Object? subtotal = null,
  }) {
    return _then(_OrdersListItemApiModel(
      productVariant: null == productVariant
          ? _self.productVariant
          : productVariant // ignore: cast_nullable_to_non_nullable
              as OrdersListProductVariantApiModel,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of OrdersListItemApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrdersListProductVariantApiModelCopyWith<$Res> get productVariant {
    return $OrdersListProductVariantApiModelCopyWith<$Res>(_self.productVariant,
        (value) {
      return _then(_self.copyWith(productVariant: value));
    });
  }
}

/// @nodoc
mixin _$OrdersListDeliveryCityApiModel {
  String get city;

  /// Create a copy of OrdersListDeliveryCityApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrdersListDeliveryCityApiModelCopyWith<OrdersListDeliveryCityApiModel>
      get copyWith => _$OrdersListDeliveryCityApiModelCopyWithImpl<
              OrdersListDeliveryCityApiModel>(
          this as OrdersListDeliveryCityApiModel, _$identity);

  /// Serializes this OrdersListDeliveryCityApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrdersListDeliveryCityApiModel &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, city);

  @override
  String toString() {
    return 'OrdersListDeliveryCityApiModel(city: $city)';
  }
}

/// @nodoc
abstract mixin class $OrdersListDeliveryCityApiModelCopyWith<$Res> {
  factory $OrdersListDeliveryCityApiModelCopyWith(
          OrdersListDeliveryCityApiModel value,
          $Res Function(OrdersListDeliveryCityApiModel) _then) =
      _$OrdersListDeliveryCityApiModelCopyWithImpl;
  @useResult
  $Res call({String city});
}

/// @nodoc
class _$OrdersListDeliveryCityApiModelCopyWithImpl<$Res>
    implements $OrdersListDeliveryCityApiModelCopyWith<$Res> {
  _$OrdersListDeliveryCityApiModelCopyWithImpl(this._self, this._then);

  final OrdersListDeliveryCityApiModel _self;
  final $Res Function(OrdersListDeliveryCityApiModel) _then;

  /// Create a copy of OrdersListDeliveryCityApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
  }) {
    return _then(_self.copyWith(
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrdersListDeliveryCityApiModel].
extension OrdersListDeliveryCityApiModelPatterns
    on OrdersListDeliveryCityApiModel {
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
    TResult Function(_OrdersListDeliveryCityApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrdersListDeliveryCityApiModel() when $default != null:
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
    TResult Function(_OrdersListDeliveryCityApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListDeliveryCityApiModel():
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
    TResult? Function(_OrdersListDeliveryCityApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListDeliveryCityApiModel() when $default != null:
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
    TResult Function(String city)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrdersListDeliveryCityApiModel() when $default != null:
        return $default(_that.city);
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
    TResult Function(String city) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListDeliveryCityApiModel():
        return $default(_that.city);
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
    TResult? Function(String city)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListDeliveryCityApiModel() when $default != null:
        return $default(_that.city);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrdersListDeliveryCityApiModel
    implements OrdersListDeliveryCityApiModel {
  _OrdersListDeliveryCityApiModel({required this.city});
  factory _OrdersListDeliveryCityApiModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersListDeliveryCityApiModelFromJson(json);

  @override
  final String city;

  /// Create a copy of OrdersListDeliveryCityApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrdersListDeliveryCityApiModelCopyWith<_OrdersListDeliveryCityApiModel>
      get copyWith => __$OrdersListDeliveryCityApiModelCopyWithImpl<
          _OrdersListDeliveryCityApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrdersListDeliveryCityApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrdersListDeliveryCityApiModel &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, city);

  @override
  String toString() {
    return 'OrdersListDeliveryCityApiModel(city: $city)';
  }
}

/// @nodoc
abstract mixin class _$OrdersListDeliveryCityApiModelCopyWith<$Res>
    implements $OrdersListDeliveryCityApiModelCopyWith<$Res> {
  factory _$OrdersListDeliveryCityApiModelCopyWith(
          _OrdersListDeliveryCityApiModel value,
          $Res Function(_OrdersListDeliveryCityApiModel) _then) =
      __$OrdersListDeliveryCityApiModelCopyWithImpl;
  @override
  @useResult
  $Res call({String city});
}

/// @nodoc
class __$OrdersListDeliveryCityApiModelCopyWithImpl<$Res>
    implements _$OrdersListDeliveryCityApiModelCopyWith<$Res> {
  __$OrdersListDeliveryCityApiModelCopyWithImpl(this._self, this._then);

  final _OrdersListDeliveryCityApiModel _self;
  final $Res Function(_OrdersListDeliveryCityApiModel) _then;

  /// Create a copy of OrdersListDeliveryCityApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? city = null,
  }) {
    return _then(_OrdersListDeliveryCityApiModel(
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$OrdersListDelivery {
  String get address;
  String get estimatedDeliveryTime;
  OrdersListDeliveryCityApiModel get city;
  DateTime get deliveryDate;

  /// Create a copy of OrdersListDelivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrdersListDeliveryCopyWith<OrdersListDelivery> get copyWith =>
      _$OrdersListDeliveryCopyWithImpl<OrdersListDelivery>(
          this as OrdersListDelivery, _$identity);

  /// Serializes this OrdersListDelivery to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrdersListDelivery &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.estimatedDeliveryTime, estimatedDeliveryTime) ||
                other.estimatedDeliveryTime == estimatedDeliveryTime) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, address, estimatedDeliveryTime, city, deliveryDate);

  @override
  String toString() {
    return 'OrdersListDelivery(address: $address, estimatedDeliveryTime: $estimatedDeliveryTime, city: $city, deliveryDate: $deliveryDate)';
  }
}

/// @nodoc
abstract mixin class $OrdersListDeliveryCopyWith<$Res> {
  factory $OrdersListDeliveryCopyWith(
          OrdersListDelivery value, $Res Function(OrdersListDelivery) _then) =
      _$OrdersListDeliveryCopyWithImpl;
  @useResult
  $Res call(
      {String address,
      String estimatedDeliveryTime,
      OrdersListDeliveryCityApiModel city,
      DateTime deliveryDate});

  $OrdersListDeliveryCityApiModelCopyWith<$Res> get city;
}

/// @nodoc
class _$OrdersListDeliveryCopyWithImpl<$Res>
    implements $OrdersListDeliveryCopyWith<$Res> {
  _$OrdersListDeliveryCopyWithImpl(this._self, this._then);

  final OrdersListDelivery _self;
  final $Res Function(OrdersListDelivery) _then;

  /// Create a copy of OrdersListDelivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? estimatedDeliveryTime = null,
    Object? city = null,
    Object? deliveryDate = null,
  }) {
    return _then(_self.copyWith(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedDeliveryTime: null == estimatedDeliveryTime
          ? _self.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as OrdersListDeliveryCityApiModel,
      deliveryDate: null == deliveryDate
          ? _self.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of OrdersListDelivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrdersListDeliveryCityApiModelCopyWith<$Res> get city {
    return $OrdersListDeliveryCityApiModelCopyWith<$Res>(_self.city, (value) {
      return _then(_self.copyWith(city: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OrdersListDelivery].
extension OrdersListDeliveryPatterns on OrdersListDelivery {
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
    TResult Function(_OrdersListDelivery value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrdersListDelivery() when $default != null:
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
    TResult Function(_OrdersListDelivery value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListDelivery():
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
    TResult? Function(_OrdersListDelivery value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListDelivery() when $default != null:
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
    TResult Function(String address, String estimatedDeliveryTime,
            OrdersListDeliveryCityApiModel city, DateTime deliveryDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrdersListDelivery() when $default != null:
        return $default(_that.address, _that.estimatedDeliveryTime, _that.city,
            _that.deliveryDate);
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
    TResult Function(String address, String estimatedDeliveryTime,
            OrdersListDeliveryCityApiModel city, DateTime deliveryDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListDelivery():
        return $default(_that.address, _that.estimatedDeliveryTime, _that.city,
            _that.deliveryDate);
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
    TResult? Function(String address, String estimatedDeliveryTime,
            OrdersListDeliveryCityApiModel city, DateTime deliveryDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListDelivery() when $default != null:
        return $default(_that.address, _that.estimatedDeliveryTime, _that.city,
            _that.deliveryDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrdersListDelivery implements OrdersListDelivery {
  _OrdersListDelivery(
      {required this.address,
      required this.estimatedDeliveryTime,
      required this.city,
      required this.deliveryDate});
  factory _OrdersListDelivery.fromJson(Map<String, dynamic> json) =>
      _$OrdersListDeliveryFromJson(json);

  @override
  final String address;
  @override
  final String estimatedDeliveryTime;
  @override
  final OrdersListDeliveryCityApiModel city;
  @override
  final DateTime deliveryDate;

  /// Create a copy of OrdersListDelivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrdersListDeliveryCopyWith<_OrdersListDelivery> get copyWith =>
      __$OrdersListDeliveryCopyWithImpl<_OrdersListDelivery>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrdersListDeliveryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrdersListDelivery &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.estimatedDeliveryTime, estimatedDeliveryTime) ||
                other.estimatedDeliveryTime == estimatedDeliveryTime) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, address, estimatedDeliveryTime, city, deliveryDate);

  @override
  String toString() {
    return 'OrdersListDelivery(address: $address, estimatedDeliveryTime: $estimatedDeliveryTime, city: $city, deliveryDate: $deliveryDate)';
  }
}

/// @nodoc
abstract mixin class _$OrdersListDeliveryCopyWith<$Res>
    implements $OrdersListDeliveryCopyWith<$Res> {
  factory _$OrdersListDeliveryCopyWith(
          _OrdersListDelivery value, $Res Function(_OrdersListDelivery) _then) =
      __$OrdersListDeliveryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String address,
      String estimatedDeliveryTime,
      OrdersListDeliveryCityApiModel city,
      DateTime deliveryDate});

  @override
  $OrdersListDeliveryCityApiModelCopyWith<$Res> get city;
}

/// @nodoc
class __$OrdersListDeliveryCopyWithImpl<$Res>
    implements _$OrdersListDeliveryCopyWith<$Res> {
  __$OrdersListDeliveryCopyWithImpl(this._self, this._then);

  final _OrdersListDelivery _self;
  final $Res Function(_OrdersListDelivery) _then;

  /// Create a copy of OrdersListDelivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? address = null,
    Object? estimatedDeliveryTime = null,
    Object? city = null,
    Object? deliveryDate = null,
  }) {
    return _then(_OrdersListDelivery(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedDeliveryTime: null == estimatedDeliveryTime
          ? _self.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as OrdersListDeliveryCityApiModel,
      deliveryDate: null == deliveryDate
          ? _self.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of OrdersListDelivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrdersListDeliveryCityApiModelCopyWith<$Res> get city {
    return $OrdersListDeliveryCityApiModelCopyWith<$Res>(_self.city, (value) {
      return _then(_self.copyWith(city: value));
    });
  }
}

/// @nodoc
mixin _$OrdersListApiModel {
  int get id;
  int get finalPrice;
  String get status;
  List<OrdersListItemApiModel> get orderItems;
  OrdersListDelivery get delivery;

  /// Create a copy of OrdersListApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrdersListApiModelCopyWith<OrdersListApiModel> get copyWith =>
      _$OrdersListApiModelCopyWithImpl<OrdersListApiModel>(
          this as OrdersListApiModel, _$identity);

  /// Serializes this OrdersListApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrdersListApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.orderItems, orderItems) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, finalPrice, status,
      const DeepCollectionEquality().hash(orderItems), delivery);

  @override
  String toString() {
    return 'OrdersListApiModel(id: $id, finalPrice: $finalPrice, status: $status, orderItems: $orderItems, delivery: $delivery)';
  }
}

/// @nodoc
abstract mixin class $OrdersListApiModelCopyWith<$Res> {
  factory $OrdersListApiModelCopyWith(
          OrdersListApiModel value, $Res Function(OrdersListApiModel) _then) =
      _$OrdersListApiModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int finalPrice,
      String status,
      List<OrdersListItemApiModel> orderItems,
      OrdersListDelivery delivery});

  $OrdersListDeliveryCopyWith<$Res> get delivery;
}

/// @nodoc
class _$OrdersListApiModelCopyWithImpl<$Res>
    implements $OrdersListApiModelCopyWith<$Res> {
  _$OrdersListApiModelCopyWithImpl(this._self, this._then);

  final OrdersListApiModel _self;
  final $Res Function(OrdersListApiModel) _then;

  /// Create a copy of OrdersListApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? finalPrice = null,
    Object? status = null,
    Object? orderItems = null,
    Object? delivery = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      finalPrice: null == finalPrice
          ? _self.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      orderItems: null == orderItems
          ? _self.orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<OrdersListItemApiModel>,
      delivery: null == delivery
          ? _self.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as OrdersListDelivery,
    ));
  }

  /// Create a copy of OrdersListApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrdersListDeliveryCopyWith<$Res> get delivery {
    return $OrdersListDeliveryCopyWith<$Res>(_self.delivery, (value) {
      return _then(_self.copyWith(delivery: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OrdersListApiModel].
extension OrdersListApiModelPatterns on OrdersListApiModel {
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
    TResult Function(_OrdersListApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrdersListApiModel() when $default != null:
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
    TResult Function(_OrdersListApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListApiModel():
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
    TResult? Function(_OrdersListApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListApiModel() when $default != null:
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
            int finalPrice,
            String status,
            List<OrdersListItemApiModel> orderItems,
            OrdersListDelivery delivery)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrdersListApiModel() when $default != null:
        return $default(_that.id, _that.finalPrice, _that.status,
            _that.orderItems, _that.delivery);
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
            int finalPrice,
            String status,
            List<OrdersListItemApiModel> orderItems,
            OrdersListDelivery delivery)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListApiModel():
        return $default(_that.id, _that.finalPrice, _that.status,
            _that.orderItems, _that.delivery);
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
            int finalPrice,
            String status,
            List<OrdersListItemApiModel> orderItems,
            OrdersListDelivery delivery)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrdersListApiModel() when $default != null:
        return $default(_that.id, _that.finalPrice, _that.status,
            _that.orderItems, _that.delivery);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrdersListApiModel implements OrdersListApiModel {
  const _OrdersListApiModel(
      {required this.id,
      required this.finalPrice,
      required this.status,
      required final List<OrdersListItemApiModel> orderItems,
      required this.delivery})
      : _orderItems = orderItems;
  factory _OrdersListApiModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersListApiModelFromJson(json);

  @override
  final int id;
  @override
  final int finalPrice;
  @override
  final String status;
  final List<OrdersListItemApiModel> _orderItems;
  @override
  List<OrdersListItemApiModel> get orderItems {
    if (_orderItems is EqualUnmodifiableListView) return _orderItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderItems);
  }

  @override
  final OrdersListDelivery delivery;

  /// Create a copy of OrdersListApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrdersListApiModelCopyWith<_OrdersListApiModel> get copyWith =>
      __$OrdersListApiModelCopyWithImpl<_OrdersListApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrdersListApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrdersListApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._orderItems, _orderItems) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, finalPrice, status,
      const DeepCollectionEquality().hash(_orderItems), delivery);

  @override
  String toString() {
    return 'OrdersListApiModel(id: $id, finalPrice: $finalPrice, status: $status, orderItems: $orderItems, delivery: $delivery)';
  }
}

/// @nodoc
abstract mixin class _$OrdersListApiModelCopyWith<$Res>
    implements $OrdersListApiModelCopyWith<$Res> {
  factory _$OrdersListApiModelCopyWith(
          _OrdersListApiModel value, $Res Function(_OrdersListApiModel) _then) =
      __$OrdersListApiModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int finalPrice,
      String status,
      List<OrdersListItemApiModel> orderItems,
      OrdersListDelivery delivery});

  @override
  $OrdersListDeliveryCopyWith<$Res> get delivery;
}

/// @nodoc
class __$OrdersListApiModelCopyWithImpl<$Res>
    implements _$OrdersListApiModelCopyWith<$Res> {
  __$OrdersListApiModelCopyWithImpl(this._self, this._then);

  final _OrdersListApiModel _self;
  final $Res Function(_OrdersListApiModel) _then;

  /// Create a copy of OrdersListApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? finalPrice = null,
    Object? status = null,
    Object? orderItems = null,
    Object? delivery = null,
  }) {
    return _then(_OrdersListApiModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      finalPrice: null == finalPrice
          ? _self.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      orderItems: null == orderItems
          ? _self._orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<OrdersListItemApiModel>,
      delivery: null == delivery
          ? _self.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as OrdersListDelivery,
    ));
  }

  /// Create a copy of OrdersListApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrdersListDeliveryCopyWith<$Res> get delivery {
    return $OrdersListDeliveryCopyWith<$Res>(_self.delivery, (value) {
      return _then(_self.copyWith(delivery: value));
    });
  }
}

// dart format on
