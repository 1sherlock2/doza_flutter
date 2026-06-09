// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_register_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthRegisterApiModel {

 String get authPayload;
 bool get isNewUser;
/// Create a copy of AuthRegisterApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthRegisterApiModelCopyWith<AuthRegisterApiModel> get copyWith => _$AuthRegisterApiModelCopyWithImpl<AuthRegisterApiModel>(this as AuthRegisterApiModel, _$identity);

  /// Serializes this AuthRegisterApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthRegisterApiModel&&(identical(other.authPayload, authPayload) || other.authPayload == authPayload)&&(identical(other.isNewUser, isNewUser) || other.isNewUser == isNewUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authPayload,isNewUser);

@override
String toString() {
  return 'AuthRegisterApiModel(authPayload: $authPayload, isNewUser: $isNewUser)';
}


}

/// @nodoc
abstract mixin class $AuthRegisterApiModelCopyWith<$Res>  {
  factory $AuthRegisterApiModelCopyWith(AuthRegisterApiModel value, $Res Function(AuthRegisterApiModel) _then) = _$AuthRegisterApiModelCopyWithImpl;
@useResult
$Res call({
 String authPayload,
 bool isNewUser
});




}
/// @nodoc
class _$AuthRegisterApiModelCopyWithImpl<$Res>
    implements $AuthRegisterApiModelCopyWith<$Res> {
  _$AuthRegisterApiModelCopyWithImpl(this._self, this._then);

  final AuthRegisterApiModel _self;
  final $Res Function(AuthRegisterApiModel) _then;

/// Create a copy of AuthRegisterApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authPayload = null,Object? isNewUser = null,}) {
  return _then(_self.copyWith(
authPayload: null == authPayload ? _self.authPayload : authPayload // ignore: cast_nullable_to_non_nullable
as String,
isNewUser: null == isNewUser ? _self.isNewUser : isNewUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthRegisterApiModel].
extension AuthRegisterApiModelPatterns on AuthRegisterApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthRegisterApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthRegisterApiModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthRegisterApiModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthRegisterApiModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthRegisterApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthRegisterApiModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String authPayload, bool isNewUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthRegisterApiModel() when $default != null:
return $default(_that.authPayload, _that.isNewUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String authPayload, bool isNewUser)  $default,) {final _that = this;
switch (_that) {
case _AuthRegisterApiModel():
return $default(_that.authPayload, _that.isNewUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String authPayload, bool isNewUser)?  $default,) {final _that = this;
switch (_that) {
case _AuthRegisterApiModel() when $default != null:
return $default(_that.authPayload, _that.isNewUser);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthRegisterApiModel implements AuthRegisterApiModel {
  const _AuthRegisterApiModel({required this.authPayload, this.isNewUser = false});
  factory _AuthRegisterApiModel.fromJson(Map<String, dynamic> json) => _$AuthRegisterApiModelFromJson(json);

@override final  String authPayload;
@override final  bool isNewUser;

/// Create a copy of AuthRegisterApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthRegisterApiModelCopyWith<_AuthRegisterApiModel> get copyWith => __$AuthRegisterApiModelCopyWithImpl<_AuthRegisterApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthRegisterApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthRegisterApiModel&&(identical(other.authPayload, authPayload) || other.authPayload == authPayload)&&(identical(other.isNewUser, isNewUser) || other.isNewUser == isNewUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authPayload,isNewUser);

@override
String toString() {
  return 'AuthRegisterApiModel(authPayload: $authPayload, isNewUser: $isNewUser)';
}


}

/// @nodoc
abstract mixin class _$AuthRegisterApiModelCopyWith<$Res> implements $AuthRegisterApiModelCopyWith<$Res> {
  factory _$AuthRegisterApiModelCopyWith(_AuthRegisterApiModel value, $Res Function(_AuthRegisterApiModel) _then) = __$AuthRegisterApiModelCopyWithImpl;
@override @useResult
$Res call({
 String authPayload,
 bool isNewUser
});




}
/// @nodoc
class __$AuthRegisterApiModelCopyWithImpl<$Res>
    implements _$AuthRegisterApiModelCopyWith<$Res> {
  __$AuthRegisterApiModelCopyWithImpl(this._self, this._then);

  final _AuthRegisterApiModel _self;
  final $Res Function(_AuthRegisterApiModel) _then;

/// Create a copy of AuthRegisterApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authPayload = null,Object? isNewUser = null,}) {
  return _then(_AuthRegisterApiModel(
authPayload: null == authPayload ? _self.authPayload : authPayload // ignore: cast_nullable_to_non_nullable
as String,
isNewUser: null == isNewUser ? _self.isNewUser : isNewUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
