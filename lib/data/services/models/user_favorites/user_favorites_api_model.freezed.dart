// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_favorites_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserFavoritesApiModel {
  int get id;
  int get userId;
  int get productId;

  /// Create a copy of UserFavoritesApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserFavoritesApiModelCopyWith<UserFavoritesApiModel> get copyWith =>
      _$UserFavoritesApiModelCopyWithImpl<UserFavoritesApiModel>(
          this as UserFavoritesApiModel, _$identity);

  /// Serializes this UserFavoritesApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserFavoritesApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, productId);

  @override
  String toString() {
    return 'UserFavoritesApiModel(id: $id, userId: $userId, productId: $productId)';
  }
}

/// @nodoc
abstract mixin class $UserFavoritesApiModelCopyWith<$Res> {
  factory $UserFavoritesApiModelCopyWith(UserFavoritesApiModel value,
          $Res Function(UserFavoritesApiModel) _then) =
      _$UserFavoritesApiModelCopyWithImpl;
  @useResult
  $Res call({int id, int userId, int productId});
}

/// @nodoc
class _$UserFavoritesApiModelCopyWithImpl<$Res>
    implements $UserFavoritesApiModelCopyWith<$Res> {
  _$UserFavoritesApiModelCopyWithImpl(this._self, this._then);

  final UserFavoritesApiModel _self;
  final $Res Function(UserFavoritesApiModel) _then;

  /// Create a copy of UserFavoritesApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? productId = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserFavoritesApiModel].
extension UserFavoritesApiModelPatterns on UserFavoritesApiModel {
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
    TResult Function(_UserFavoritesApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserFavoritesApiModel() when $default != null:
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
    TResult Function(_UserFavoritesApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserFavoritesApiModel():
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
    TResult? Function(_UserFavoritesApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserFavoritesApiModel() when $default != null:
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
    TResult Function(int id, int userId, int productId)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserFavoritesApiModel() when $default != null:
        return $default(_that.id, _that.userId, _that.productId);
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
    TResult Function(int id, int userId, int productId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserFavoritesApiModel():
        return $default(_that.id, _that.userId, _that.productId);
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
    TResult? Function(int id, int userId, int productId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserFavoritesApiModel() when $default != null:
        return $default(_that.id, _that.userId, _that.productId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserFavoritesApiModel implements UserFavoritesApiModel {
  const _UserFavoritesApiModel(
      {required this.id, required this.userId, required this.productId});
  factory _UserFavoritesApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserFavoritesApiModelFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final int productId;

  /// Create a copy of UserFavoritesApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserFavoritesApiModelCopyWith<_UserFavoritesApiModel> get copyWith =>
      __$UserFavoritesApiModelCopyWithImpl<_UserFavoritesApiModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserFavoritesApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserFavoritesApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, productId);

  @override
  String toString() {
    return 'UserFavoritesApiModel(id: $id, userId: $userId, productId: $productId)';
  }
}

/// @nodoc
abstract mixin class _$UserFavoritesApiModelCopyWith<$Res>
    implements $UserFavoritesApiModelCopyWith<$Res> {
  factory _$UserFavoritesApiModelCopyWith(_UserFavoritesApiModel value,
          $Res Function(_UserFavoritesApiModel) _then) =
      __$UserFavoritesApiModelCopyWithImpl;
  @override
  @useResult
  $Res call({int id, int userId, int productId});
}

/// @nodoc
class __$UserFavoritesApiModelCopyWithImpl<$Res>
    implements _$UserFavoritesApiModelCopyWith<$Res> {
  __$UserFavoritesApiModelCopyWithImpl(this._self, this._then);

  final _UserFavoritesApiModel _self;
  final $Res Function(_UserFavoritesApiModel) _then;

  /// Create a copy of UserFavoritesApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? productId = null,
  }) {
    return _then(_UserFavoritesApiModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
