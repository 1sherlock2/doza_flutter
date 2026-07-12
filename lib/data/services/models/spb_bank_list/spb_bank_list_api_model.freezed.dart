// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spb_bank_list_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpbBankListItemApiModel {
  @JsonKey(name: 'bank_id')
  String get bankId;
  String get name;
  String get bic;

  /// Create a copy of SpbBankListItemApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SpbBankListItemApiModelCopyWith<SpbBankListItemApiModel> get copyWith =>
      _$SpbBankListItemApiModelCopyWithImpl<SpbBankListItemApiModel>(
          this as SpbBankListItemApiModel, _$identity);

  /// Serializes this SpbBankListItemApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SpbBankListItemApiModel &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bic, bic) || other.bic == bic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bankId, name, bic);

  @override
  String toString() {
    return 'SpbBankListItemApiModel(bankId: $bankId, name: $name, bic: $bic)';
  }
}

/// @nodoc
abstract mixin class $SpbBankListItemApiModelCopyWith<$Res> {
  factory $SpbBankListItemApiModelCopyWith(SpbBankListItemApiModel value,
          $Res Function(SpbBankListItemApiModel) _then) =
      _$SpbBankListItemApiModelCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'bank_id') String bankId, String name, String bic});
}

/// @nodoc
class _$SpbBankListItemApiModelCopyWithImpl<$Res>
    implements $SpbBankListItemApiModelCopyWith<$Res> {
  _$SpbBankListItemApiModelCopyWithImpl(this._self, this._then);

  final SpbBankListItemApiModel _self;
  final $Res Function(SpbBankListItemApiModel) _then;

  /// Create a copy of SpbBankListItemApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankId = null,
    Object? name = null,
    Object? bic = null,
  }) {
    return _then(_self.copyWith(
      bankId: null == bankId
          ? _self.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bic: null == bic
          ? _self.bic
          : bic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SpbBankListItemApiModel].
extension SpbBankListItemApiModelPatterns on SpbBankListItemApiModel {
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
    TResult Function(_SpbBankListItemApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SpbBankListItemApiModel() when $default != null:
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
    TResult Function(_SpbBankListItemApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpbBankListItemApiModel():
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
    TResult? Function(_SpbBankListItemApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpbBankListItemApiModel() when $default != null:
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
            @JsonKey(name: 'bank_id') String bankId, String name, String bic)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SpbBankListItemApiModel() when $default != null:
        return $default(_that.bankId, _that.name, _that.bic);
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
            @JsonKey(name: 'bank_id') String bankId, String name, String bic)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpbBankListItemApiModel():
        return $default(_that.bankId, _that.name, _that.bic);
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
            @JsonKey(name: 'bank_id') String bankId, String name, String bic)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpbBankListItemApiModel() when $default != null:
        return $default(_that.bankId, _that.name, _that.bic);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SpbBankListItemApiModel implements SpbBankListItemApiModel {
  const _SpbBankListItemApiModel(
      {@JsonKey(name: 'bank_id') required this.bankId,
      required this.name,
      required this.bic});
  factory _SpbBankListItemApiModel.fromJson(Map<String, dynamic> json) =>
      _$SpbBankListItemApiModelFromJson(json);

  @override
  @JsonKey(name: 'bank_id')
  final String bankId;
  @override
  final String name;
  @override
  final String bic;

  /// Create a copy of SpbBankListItemApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SpbBankListItemApiModelCopyWith<_SpbBankListItemApiModel> get copyWith =>
      __$SpbBankListItemApiModelCopyWithImpl<_SpbBankListItemApiModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SpbBankListItemApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SpbBankListItemApiModel &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bic, bic) || other.bic == bic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bankId, name, bic);

  @override
  String toString() {
    return 'SpbBankListItemApiModel(bankId: $bankId, name: $name, bic: $bic)';
  }
}

/// @nodoc
abstract mixin class _$SpbBankListItemApiModelCopyWith<$Res>
    implements $SpbBankListItemApiModelCopyWith<$Res> {
  factory _$SpbBankListItemApiModelCopyWith(_SpbBankListItemApiModel value,
          $Res Function(_SpbBankListItemApiModel) _then) =
      __$SpbBankListItemApiModelCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'bank_id') String bankId, String name, String bic});
}

/// @nodoc
class __$SpbBankListItemApiModelCopyWithImpl<$Res>
    implements _$SpbBankListItemApiModelCopyWith<$Res> {
  __$SpbBankListItemApiModelCopyWithImpl(this._self, this._then);

  final _SpbBankListItemApiModel _self;
  final $Res Function(_SpbBankListItemApiModel) _then;

  /// Create a copy of SpbBankListItemApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bankId = null,
    Object? name = null,
    Object? bic = null,
  }) {
    return _then(_SpbBankListItemApiModel(
      bankId: null == bankId
          ? _self.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bic: null == bic
          ? _self.bic
          : bic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$SpbBankListApiModel {
  String get type;
  List<SpbBankListItemApiModel> get items;

  /// Create a copy of SpbBankListApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SpbBankListApiModelCopyWith<SpbBankListApiModel> get copyWith =>
      _$SpbBankListApiModelCopyWithImpl<SpbBankListApiModel>(
          this as SpbBankListApiModel, _$identity);

  /// Serializes this SpbBankListApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SpbBankListApiModel &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'SpbBankListApiModel(type: $type, items: $items)';
  }
}

/// @nodoc
abstract mixin class $SpbBankListApiModelCopyWith<$Res> {
  factory $SpbBankListApiModelCopyWith(
          SpbBankListApiModel value, $Res Function(SpbBankListApiModel) _then) =
      _$SpbBankListApiModelCopyWithImpl;
  @useResult
  $Res call({String type, List<SpbBankListItemApiModel> items});
}

/// @nodoc
class _$SpbBankListApiModelCopyWithImpl<$Res>
    implements $SpbBankListApiModelCopyWith<$Res> {
  _$SpbBankListApiModelCopyWithImpl(this._self, this._then);

  final SpbBankListApiModel _self;
  final $Res Function(SpbBankListApiModel) _then;

  /// Create a copy of SpbBankListApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SpbBankListItemApiModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SpbBankListApiModel].
extension SpbBankListApiModelPatterns on SpbBankListApiModel {
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
    TResult Function(_SpbBankListApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SpbBankListApiModel() when $default != null:
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
    TResult Function(_SpbBankListApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpbBankListApiModel():
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
    TResult? Function(_SpbBankListApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpbBankListApiModel() when $default != null:
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
    TResult Function(String type, List<SpbBankListItemApiModel> items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SpbBankListApiModel() when $default != null:
        return $default(_that.type, _that.items);
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
    TResult Function(String type, List<SpbBankListItemApiModel> items) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpbBankListApiModel():
        return $default(_that.type, _that.items);
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
    TResult? Function(String type, List<SpbBankListItemApiModel> items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SpbBankListApiModel() when $default != null:
        return $default(_that.type, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SpbBankListApiModel implements SpbBankListApiModel {
  const _SpbBankListApiModel(
      {required this.type, required final List<SpbBankListItemApiModel> items})
      : _items = items;
  factory _SpbBankListApiModel.fromJson(Map<String, dynamic> json) =>
      _$SpbBankListApiModelFromJson(json);

  @override
  final String type;
  final List<SpbBankListItemApiModel> _items;
  @override
  List<SpbBankListItemApiModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of SpbBankListApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SpbBankListApiModelCopyWith<_SpbBankListApiModel> get copyWith =>
      __$SpbBankListApiModelCopyWithImpl<_SpbBankListApiModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SpbBankListApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SpbBankListApiModel &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'SpbBankListApiModel(type: $type, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$SpbBankListApiModelCopyWith<$Res>
    implements $SpbBankListApiModelCopyWith<$Res> {
  factory _$SpbBankListApiModelCopyWith(_SpbBankListApiModel value,
          $Res Function(_SpbBankListApiModel) _then) =
      __$SpbBankListApiModelCopyWithImpl;
  @override
  @useResult
  $Res call({String type, List<SpbBankListItemApiModel> items});
}

/// @nodoc
class __$SpbBankListApiModelCopyWithImpl<$Res>
    implements _$SpbBankListApiModelCopyWith<$Res> {
  __$SpbBankListApiModelCopyWithImpl(this._self, this._then);

  final _SpbBankListApiModel _self;
  final $Res Function(_SpbBankListApiModel) _then;

  /// Create a copy of SpbBankListApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? items = null,
  }) {
    return _then(_SpbBankListApiModel(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SpbBankListItemApiModel>,
    ));
  }
}

// dart format on
