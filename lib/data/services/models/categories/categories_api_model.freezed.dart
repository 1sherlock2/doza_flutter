// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoriesApiModel {
  int get id;
  String get name;
  String get slug;
  String? get description;
  String? get imageUrl;

  /// Create a copy of CategoriesApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoriesApiModelCopyWith<CategoriesApiModel> get copyWith =>
      _$CategoriesApiModelCopyWithImpl<CategoriesApiModel>(
          this as CategoriesApiModel, _$identity);

  /// Serializes this CategoriesApiModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoriesApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, slug, description, imageUrl);

  @override
  String toString() {
    return 'CategoriesApiModel(id: $id, name: $name, slug: $slug, description: $description, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class $CategoriesApiModelCopyWith<$Res> {
  factory $CategoriesApiModelCopyWith(
          CategoriesApiModel value, $Res Function(CategoriesApiModel) _then) =
      _$CategoriesApiModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      String? description,
      String? imageUrl});
}

/// @nodoc
class _$CategoriesApiModelCopyWithImpl<$Res>
    implements $CategoriesApiModelCopyWith<$Res> {
  _$CategoriesApiModelCopyWithImpl(this._self, this._then);

  final CategoriesApiModel _self;
  final $Res Function(CategoriesApiModel) _then;

  /// Create a copy of CategoriesApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
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
      slug: null == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CategoriesApiModel].
extension CategoriesApiModelPatterns on CategoriesApiModel {
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
    TResult Function(_CategoriesApiModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoriesApiModel() when $default != null:
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
    TResult Function(_CategoriesApiModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesApiModel():
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
    TResult? Function(_CategoriesApiModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesApiModel() when $default != null:
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
    TResult Function(int id, String name, String slug, String? description,
            String? imageUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoriesApiModel() when $default != null:
        return $default(_that.id, _that.name, _that.slug, _that.description,
            _that.imageUrl);
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
    TResult Function(int id, String name, String slug, String? description,
            String? imageUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesApiModel():
        return $default(_that.id, _that.name, _that.slug, _that.description,
            _that.imageUrl);
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
    TResult? Function(int id, String name, String slug, String? description,
            String? imageUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoriesApiModel() when $default != null:
        return $default(_that.id, _that.name, _that.slug, _that.description,
            _that.imageUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoriesApiModel implements CategoriesApiModel {
  const _CategoriesApiModel(
      {required this.id,
      required this.name,
      required this.slug,
      this.description,
      this.imageUrl});
  factory _CategoriesApiModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesApiModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String? description;
  @override
  final String? imageUrl;

  /// Create a copy of CategoriesApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoriesApiModelCopyWith<_CategoriesApiModel> get copyWith =>
      __$CategoriesApiModelCopyWithImpl<_CategoriesApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoriesApiModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoriesApiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, slug, description, imageUrl);

  @override
  String toString() {
    return 'CategoriesApiModel(id: $id, name: $name, slug: $slug, description: $description, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class _$CategoriesApiModelCopyWith<$Res>
    implements $CategoriesApiModelCopyWith<$Res> {
  factory _$CategoriesApiModelCopyWith(
          _CategoriesApiModel value, $Res Function(_CategoriesApiModel) _then) =
      __$CategoriesApiModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      String? description,
      String? imageUrl});
}

/// @nodoc
class __$CategoriesApiModelCopyWithImpl<$Res>
    implements _$CategoriesApiModelCopyWith<$Res> {
  __$CategoriesApiModelCopyWithImpl(this._self, this._then);

  final _CategoriesApiModel _self;
  final $Res Function(_CategoriesApiModel) _then;

  /// Create a copy of CategoriesApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_CategoriesApiModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
