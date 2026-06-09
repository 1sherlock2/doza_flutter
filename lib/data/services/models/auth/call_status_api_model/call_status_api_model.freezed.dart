// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_status_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CallStatusApiModel {

@CallStatusConverter() CallStatus get status;@JsonKey(name: 'call_id') int get callId; String get created; String get phone;@JsonKey(name: 'dial_status_display') String? get dialStatusDisplay;
/// Create a copy of CallStatusApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallStatusApiModelCopyWith<CallStatusApiModel> get copyWith => _$CallStatusApiModelCopyWithImpl<CallStatusApiModel>(this as CallStatusApiModel, _$identity);

  /// Serializes this CallStatusApiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallStatusApiModel&&(identical(other.status, status) || other.status == status)&&(identical(other.callId, callId) || other.callId == callId)&&(identical(other.created, created) || other.created == created)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.dialStatusDisplay, dialStatusDisplay) || other.dialStatusDisplay == dialStatusDisplay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,callId,created,phone,dialStatusDisplay);

@override
String toString() {
  return 'CallStatusApiModel(status: $status, callId: $callId, created: $created, phone: $phone, dialStatusDisplay: $dialStatusDisplay)';
}


}

/// @nodoc
abstract mixin class $CallStatusApiModelCopyWith<$Res>  {
  factory $CallStatusApiModelCopyWith(CallStatusApiModel value, $Res Function(CallStatusApiModel) _then) = _$CallStatusApiModelCopyWithImpl;
@useResult
$Res call({
@CallStatusConverter() CallStatus status,@JsonKey(name: 'call_id') int callId, String created, String phone,@JsonKey(name: 'dial_status_display') String? dialStatusDisplay
});




}
/// @nodoc
class _$CallStatusApiModelCopyWithImpl<$Res>
    implements $CallStatusApiModelCopyWith<$Res> {
  _$CallStatusApiModelCopyWithImpl(this._self, this._then);

  final CallStatusApiModel _self;
  final $Res Function(CallStatusApiModel) _then;

/// Create a copy of CallStatusApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? callId = null,Object? created = null,Object? phone = null,Object? dialStatusDisplay = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CallStatus,callId: null == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as int,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,dialStatusDisplay: freezed == dialStatusDisplay ? _self.dialStatusDisplay : dialStatusDisplay // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CallStatusApiModel].
extension CallStatusApiModelPatterns on CallStatusApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallStatusApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallStatusApiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallStatusApiModel value)  $default,){
final _that = this;
switch (_that) {
case _CallStatusApiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallStatusApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _CallStatusApiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@CallStatusConverter()  CallStatus status, @JsonKey(name: 'call_id')  int callId,  String created,  String phone, @JsonKey(name: 'dial_status_display')  String? dialStatusDisplay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallStatusApiModel() when $default != null:
return $default(_that.status,_that.callId,_that.created,_that.phone,_that.dialStatusDisplay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@CallStatusConverter()  CallStatus status, @JsonKey(name: 'call_id')  int callId,  String created,  String phone, @JsonKey(name: 'dial_status_display')  String? dialStatusDisplay)  $default,) {final _that = this;
switch (_that) {
case _CallStatusApiModel():
return $default(_that.status,_that.callId,_that.created,_that.phone,_that.dialStatusDisplay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@CallStatusConverter()  CallStatus status, @JsonKey(name: 'call_id')  int callId,  String created,  String phone, @JsonKey(name: 'dial_status_display')  String? dialStatusDisplay)?  $default,) {final _that = this;
switch (_that) {
case _CallStatusApiModel() when $default != null:
return $default(_that.status,_that.callId,_that.created,_that.phone,_that.dialStatusDisplay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CallStatusApiModel implements CallStatusApiModel {
  const _CallStatusApiModel({@CallStatusConverter() required this.status, @JsonKey(name: 'call_id') required this.callId, required this.created, required this.phone, @JsonKey(name: 'dial_status_display') this.dialStatusDisplay});
  factory _CallStatusApiModel.fromJson(Map<String, dynamic> json) => _$CallStatusApiModelFromJson(json);

@override@CallStatusConverter() final  CallStatus status;
@override@JsonKey(name: 'call_id') final  int callId;
@override final  String created;
@override final  String phone;
@override@JsonKey(name: 'dial_status_display') final  String? dialStatusDisplay;

/// Create a copy of CallStatusApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallStatusApiModelCopyWith<_CallStatusApiModel> get copyWith => __$CallStatusApiModelCopyWithImpl<_CallStatusApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CallStatusApiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallStatusApiModel&&(identical(other.status, status) || other.status == status)&&(identical(other.callId, callId) || other.callId == callId)&&(identical(other.created, created) || other.created == created)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.dialStatusDisplay, dialStatusDisplay) || other.dialStatusDisplay == dialStatusDisplay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,callId,created,phone,dialStatusDisplay);

@override
String toString() {
  return 'CallStatusApiModel(status: $status, callId: $callId, created: $created, phone: $phone, dialStatusDisplay: $dialStatusDisplay)';
}


}

/// @nodoc
abstract mixin class _$CallStatusApiModelCopyWith<$Res> implements $CallStatusApiModelCopyWith<$Res> {
  factory _$CallStatusApiModelCopyWith(_CallStatusApiModel value, $Res Function(_CallStatusApiModel) _then) = __$CallStatusApiModelCopyWithImpl;
@override @useResult
$Res call({
@CallStatusConverter() CallStatus status,@JsonKey(name: 'call_id') int callId, String created, String phone,@JsonKey(name: 'dial_status_display') String? dialStatusDisplay
});




}
/// @nodoc
class __$CallStatusApiModelCopyWithImpl<$Res>
    implements _$CallStatusApiModelCopyWith<$Res> {
  __$CallStatusApiModelCopyWithImpl(this._self, this._then);

  final _CallStatusApiModel _self;
  final $Res Function(_CallStatusApiModel) _then;

/// Create a copy of CallStatusApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? callId = null,Object? created = null,Object? phone = null,Object? dialStatusDisplay = freezed,}) {
  return _then(_CallStatusApiModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CallStatus,callId: null == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as int,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,dialStatusDisplay: freezed == dialStatusDisplay ? _self.dialStatusDisplay : dialStatusDisplay // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
