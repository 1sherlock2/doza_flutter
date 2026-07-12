// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserInfoApiModel {
  int get id;
  String get phone;
  int? get balance;
  int get bonusBalance;

  /// Create a copy of UserInfoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserInfoApiModelCopyWith<UserInfoApiModel> get copyWith =>
      _$UserInfoApiModelCopyWithImpl<UserInfoApiModel>(
          this as UserInfoApiModel, _$identity);

  /// Serializes this UserInfoApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserInfoApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.bonusBalance, bonusBalance) ||
                other.bonusBalance == bonusBalance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, phone, balance, bonusBalance);

  @override
  String toString() {
    return 'UserInfoApiModel(id: $id, phone: $phone, balance: $balance, bonusBalance: $bonusBalance)';
  }
}

/// @nodoc
abstract mixin class $UserInfoApiModelCopyWith<$Res> {
  factory $UserInfoApiModelCopyWith(
          UserInfoApiModel value, $Res Function(UserInfoApiModel) _then) =
      _$UserInfoApiModelCopyWithImpl;
  @useResult
  $Res call({int id, String phone, int? balance, int bonusBalance});
}

/// @nodoc
class _$UserInfoApiModelCopyWithImpl<$Res>
    implements $UserInfoApiModelCopyWith<$Res> {
  _$UserInfoApiModelCopyWithImpl(this._self, this._then);

  final UserInfoApiModel _self;
  final $Res Function(UserInfoApiModel) _then;

  /// Create a copy of UserInfoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phone = null,
    Object? balance = freezed,
    Object? bonusBalance = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      balance: freezed == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      bonusBalance: null == bonusBalance
          ? _self.bonusBalance
          : bonusBalance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserInfoApiModel].
extension UserInfoApiModelPatterns on UserInfoApiModel {
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
    TResult Function(_UserInfoApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserInfoApiModel() when $default != null:
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
    TResult Function(_UserInfoApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoApiModel():
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
    TResult? Function(_UserInfoApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoApiModel() when $default != null:
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
    TResult Function(int id, String phone, int? balance, int bonusBalance)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserInfoApiModel() when $default != null:
        return $default(
            _that.id, _that.phone, _that.balance, _that.bonusBalance);
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
    TResult Function(int id, String phone, int? balance, int bonusBalance)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoApiModel():
        return $default(
            _that.id, _that.phone, _that.balance, _that.bonusBalance);
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
    TResult? Function(int id, String phone, int? balance, int bonusBalance)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoApiModel() when $default != null:
        return $default(
            _that.id, _that.phone, _that.balance, _that.bonusBalance);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserInfoApiModel implements UserInfoApiModel {
  _UserInfoApiModel(
      {required this.id,
      required this.phone,
      required this.balance,
      required this.bonusBalance});
  factory _UserInfoApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoApiModelFromJson(json);

  @override
  final int id;
  @override
  final String phone;
  @override
  final int? balance;
  @override
  final int bonusBalance;

  /// Create a copy of UserInfoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserInfoApiModelCopyWith<_UserInfoApiModel> get copyWith =>
      __$UserInfoApiModelCopyWithImpl<_UserInfoApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserInfoApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInfoApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.bonusBalance, bonusBalance) ||
                other.bonusBalance == bonusBalance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, phone, balance, bonusBalance);

  @override
  String toString() {
    return 'UserInfoApiModel(id: $id, phone: $phone, balance: $balance, bonusBalance: $bonusBalance)';
  }
}

/// @nodoc
abstract mixin class _$UserInfoApiModelCopyWith<$Res>
    implements $UserInfoApiModelCopyWith<$Res> {
  factory _$UserInfoApiModelCopyWith(
          _UserInfoApiModel value, $Res Function(_UserInfoApiModel) _then) =
      __$UserInfoApiModelCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String phone, int? balance, int bonusBalance});
}

/// @nodoc
class __$UserInfoApiModelCopyWithImpl<$Res>
    implements _$UserInfoApiModelCopyWith<$Res> {
  __$UserInfoApiModelCopyWithImpl(this._self, this._then);

  final _UserInfoApiModel _self;
  final $Res Function(_UserInfoApiModel) _then;

  /// Create a copy of UserInfoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? phone = null,
    Object? balance = freezed,
    Object? bonusBalance = null,
  }) {
    return _then(_UserInfoApiModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      balance: freezed == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      bonusBalance: null == bonusBalance
          ? _self.bonusBalance
          : bonusBalance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
