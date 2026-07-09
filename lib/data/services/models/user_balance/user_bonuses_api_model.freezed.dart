// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bonuses_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserBonusesApiModel {
  int get balance;
  int get bonusPercent;

  /// Create a copy of UserBonusesApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserBonusesApiModelCopyWith<UserBonusesApiModel> get copyWith =>
      _$UserBonusesApiModelCopyWithImpl<UserBonusesApiModel>(
          this as UserBonusesApiModel, _$identity);

  /// Serializes this UserBonusesApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserBonusesApiModel &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.bonusPercent, bonusPercent) ||
                other.bonusPercent == bonusPercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, balance, bonusPercent);

  @override
  String toString() {
    return 'UserBonusesApiModel(balance: $balance, bonusPercent: $bonusPercent)';
  }
}

/// @nodoc
abstract mixin class $UserBonusesApiModelCopyWith<$Res> {
  factory $UserBonusesApiModelCopyWith(
          UserBonusesApiModel value, $Res Function(UserBonusesApiModel) _then) =
      _$UserBonusesApiModelCopyWithImpl;
  @useResult
  $Res call({int balance, int bonusPercent});
}

/// @nodoc
class _$UserBonusesApiModelCopyWithImpl<$Res>
    implements $UserBonusesApiModelCopyWith<$Res> {
  _$UserBonusesApiModelCopyWithImpl(this._self, this._then);

  final UserBonusesApiModel _self;
  final $Res Function(UserBonusesApiModel) _then;

  /// Create a copy of UserBonusesApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? bonusPercent = null,
  }) {
    return _then(_self.copyWith(
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      bonusPercent: null == bonusPercent
          ? _self.bonusPercent
          : bonusPercent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserBonusesApiModel].
extension UserBonusesApiModelPatterns on UserBonusesApiModel {
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
    TResult Function(_UserBonusesApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserBonusesApiModel() when $default != null:
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
    TResult Function(_UserBonusesApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBonusesApiModel():
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
    TResult? Function(_UserBonusesApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBonusesApiModel() when $default != null:
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
    TResult Function(int balance, int bonusPercent)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserBonusesApiModel() when $default != null:
        return $default(_that.balance, _that.bonusPercent);
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
    TResult Function(int balance, int bonusPercent) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBonusesApiModel():
        return $default(_that.balance, _that.bonusPercent);
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
    TResult? Function(int balance, int bonusPercent)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserBonusesApiModel() when $default != null:
        return $default(_that.balance, _that.bonusPercent);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserBonusesApiModel implements UserBonusesApiModel {
  const _UserBonusesApiModel(
      {required this.balance, required this.bonusPercent});
  factory _UserBonusesApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserBonusesApiModelFromJson(json);

  @override
  final int balance;
  @override
  final int bonusPercent;

  /// Create a copy of UserBonusesApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserBonusesApiModelCopyWith<_UserBonusesApiModel> get copyWith =>
      __$UserBonusesApiModelCopyWithImpl<_UserBonusesApiModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserBonusesApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserBonusesApiModel &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.bonusPercent, bonusPercent) ||
                other.bonusPercent == bonusPercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, balance, bonusPercent);

  @override
  String toString() {
    return 'UserBonusesApiModel(balance: $balance, bonusPercent: $bonusPercent)';
  }
}

/// @nodoc
abstract mixin class _$UserBonusesApiModelCopyWith<$Res>
    implements $UserBonusesApiModelCopyWith<$Res> {
  factory _$UserBonusesApiModelCopyWith(_UserBonusesApiModel value,
          $Res Function(_UserBonusesApiModel) _then) =
      __$UserBonusesApiModelCopyWithImpl;
  @override
  @useResult
  $Res call({int balance, int bonusPercent});
}

/// @nodoc
class __$UserBonusesApiModelCopyWithImpl<$Res>
    implements _$UserBonusesApiModelCopyWith<$Res> {
  __$UserBonusesApiModelCopyWithImpl(this._self, this._then);

  final _UserBonusesApiModel _self;
  final $Res Function(_UserBonusesApiModel) _then;

  /// Create a copy of UserBonusesApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? balance = null,
    Object? bonusPercent = null,
  }) {
    return _then(_UserBonusesApiModel(
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      bonusPercent: null == bonusPercent
          ? _self.bonusPercent
          : bonusPercent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
