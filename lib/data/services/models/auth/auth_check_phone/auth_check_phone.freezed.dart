// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_check_phone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthCheckPhone {

 String get number;
/// Create a copy of AuthCheckPhone
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthCheckPhoneCopyWith<AuthCheckPhone> get copyWith => _$AuthCheckPhoneCopyWithImpl<AuthCheckPhone>(this as AuthCheckPhone, _$identity);

  /// Serializes this AuthCheckPhone to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCheckPhone&&(identical(other.number, number) || other.number == number));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number);

@override
String toString() {
  return 'AuthCheckPhone(number: $number)';
}


}

/// @nodoc
abstract mixin class $AuthCheckPhoneCopyWith<$Res>  {
  factory $AuthCheckPhoneCopyWith(AuthCheckPhone value, $Res Function(AuthCheckPhone) _then) = _$AuthCheckPhoneCopyWithImpl;
@useResult
$Res call({
 String number
});




}
/// @nodoc
class _$AuthCheckPhoneCopyWithImpl<$Res>
    implements $AuthCheckPhoneCopyWith<$Res> {
  _$AuthCheckPhoneCopyWithImpl(this._self, this._then);

  final AuthCheckPhone _self;
  final $Res Function(AuthCheckPhone) _then;

/// Create a copy of AuthCheckPhone
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,}) {
  return _then(_self.copyWith(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthCheckPhone].
extension AuthCheckPhonePatterns on AuthCheckPhone {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthCheckPhone value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthCheckPhone() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthCheckPhone value)  $default,){
final _that = this;
switch (_that) {
case _AuthCheckPhone():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthCheckPhone value)?  $default,){
final _that = this;
switch (_that) {
case _AuthCheckPhone() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthCheckPhone() when $default != null:
return $default(_that.number);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number)  $default,) {final _that = this;
switch (_that) {
case _AuthCheckPhone():
return $default(_that.number);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number)?  $default,) {final _that = this;
switch (_that) {
case _AuthCheckPhone() when $default != null:
return $default(_that.number);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthCheckPhone implements AuthCheckPhone {
  const _AuthCheckPhone({required this.number});
  factory _AuthCheckPhone.fromJson(Map<String, dynamic> json) => _$AuthCheckPhoneFromJson(json);

@override final  String number;

/// Create a copy of AuthCheckPhone
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthCheckPhoneCopyWith<_AuthCheckPhone> get copyWith => __$AuthCheckPhoneCopyWithImpl<_AuthCheckPhone>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthCheckPhoneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthCheckPhone&&(identical(other.number, number) || other.number == number));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number);

@override
String toString() {
  return 'AuthCheckPhone(number: $number)';
}


}

/// @nodoc
abstract mixin class _$AuthCheckPhoneCopyWith<$Res> implements $AuthCheckPhoneCopyWith<$Res> {
  factory _$AuthCheckPhoneCopyWith(_AuthCheckPhone value, $Res Function(_AuthCheckPhone) _then) = __$AuthCheckPhoneCopyWithImpl;
@override @useResult
$Res call({
 String number
});




}
/// @nodoc
class __$AuthCheckPhoneCopyWithImpl<$Res>
    implements _$AuthCheckPhoneCopyWith<$Res> {
  __$AuthCheckPhoneCopyWithImpl(this._self, this._then);

  final _AuthCheckPhone _self;
  final $Res Function(_AuthCheckPhone) _then;

/// Create a copy of AuthCheckPhone
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,}) {
  return _then(_AuthCheckPhone(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
