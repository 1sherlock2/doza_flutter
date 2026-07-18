// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'changes_order_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangesOrderStatus {
  int get orderId;
  String get status;

  /// Create a copy of ChangesOrderStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChangesOrderStatusCopyWith<ChangesOrderStatus> get copyWith =>
      _$ChangesOrderStatusCopyWithImpl<ChangesOrderStatus>(
          this as ChangesOrderStatus, _$identity);

  /// Serializes this ChangesOrderStatus to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangesOrderStatus &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, status);

  @override
  String toString() {
    return 'ChangesOrderStatus(orderId: $orderId, status: $status)';
  }
}

/// @nodoc
abstract mixin class $ChangesOrderStatusCopyWith<$Res> {
  factory $ChangesOrderStatusCopyWith(
          ChangesOrderStatus value, $Res Function(ChangesOrderStatus) _then) =
      _$ChangesOrderStatusCopyWithImpl;
  @useResult
  $Res call({int orderId, String status});
}

/// @nodoc
class _$ChangesOrderStatusCopyWithImpl<$Res>
    implements $ChangesOrderStatusCopyWith<$Res> {
  _$ChangesOrderStatusCopyWithImpl(this._self, this._then);

  final ChangesOrderStatus _self;
  final $Res Function(ChangesOrderStatus) _then;

  /// Create a copy of ChangesOrderStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChangesOrderStatus].
extension ChangesOrderStatusPatterns on ChangesOrderStatus {
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
    TResult Function(_ChangesOrderStatus value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChangesOrderStatus() when $default != null:
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
    TResult Function(_ChangesOrderStatus value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChangesOrderStatus():
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
    TResult? Function(_ChangesOrderStatus value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChangesOrderStatus() when $default != null:
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
    TResult Function(int orderId, String status)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChangesOrderStatus() when $default != null:
        return $default(_that.orderId, _that.status);
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
    TResult Function(int orderId, String status) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChangesOrderStatus():
        return $default(_that.orderId, _that.status);
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
    TResult? Function(int orderId, String status)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChangesOrderStatus() when $default != null:
        return $default(_that.orderId, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChangesOrderStatus implements ChangesOrderStatus {
  _ChangesOrderStatus({required this.orderId, required this.status});
  factory _ChangesOrderStatus.fromJson(Map<String, dynamic> json) =>
      _$ChangesOrderStatusFromJson(json);

  @override
  final int orderId;
  @override
  final String status;

  /// Create a copy of ChangesOrderStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangesOrderStatusCopyWith<_ChangesOrderStatus> get copyWith =>
      __$ChangesOrderStatusCopyWithImpl<_ChangesOrderStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChangesOrderStatusToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangesOrderStatus &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, status);

  @override
  String toString() {
    return 'ChangesOrderStatus(orderId: $orderId, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$ChangesOrderStatusCopyWith<$Res>
    implements $ChangesOrderStatusCopyWith<$Res> {
  factory _$ChangesOrderStatusCopyWith(
          _ChangesOrderStatus value, $Res Function(_ChangesOrderStatus) _then) =
      __$ChangesOrderStatusCopyWithImpl;
  @override
  @useResult
  $Res call({int orderId, String status});
}

/// @nodoc
class __$ChangesOrderStatusCopyWithImpl<$Res>
    implements _$ChangesOrderStatusCopyWith<$Res> {
  __$ChangesOrderStatusCopyWithImpl(this._self, this._then);

  final _ChangesOrderStatus _self;
  final $Res Function(_ChangesOrderStatus) _then;

  /// Create a copy of ChangesOrderStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? orderId = null,
    Object? status = null,
  }) {
    return _then(_ChangesOrderStatus(
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
