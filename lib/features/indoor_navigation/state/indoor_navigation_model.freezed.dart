// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'indoor_navigation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IndoorNavigationModel {
  IndoorLocationVertex? get origin => throw _privateConstructorUsedError;
  IndoorLocationVertex? get destination => throw _privateConstructorUsedError;
  IndoorLocationGraph? get indoorLocationGraph =>
      throw _privateConstructorUsedError;
  bool get gettingIndoorLocationGraph => throw _privateConstructorUsedError;
  ShortestPath? get shortestPath => throw _privateConstructorUsedError;
  IndoorLocationVertex? get nextIndoorLocation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IndoorNavigationModelCopyWith<IndoorNavigationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndoorNavigationModelCopyWith<$Res> {
  factory $IndoorNavigationModelCopyWith(IndoorNavigationModel value,
          $Res Function(IndoorNavigationModel) then) =
      _$IndoorNavigationModelCopyWithImpl<$Res, IndoorNavigationModel>;
  @useResult
  $Res call(
      {IndoorLocationVertex? origin,
      IndoorLocationVertex? destination,
      IndoorLocationGraph? indoorLocationGraph,
      bool gettingIndoorLocationGraph,
      ShortestPath? shortestPath,
      IndoorLocationVertex? nextIndoorLocation});
}

/// @nodoc
class _$IndoorNavigationModelCopyWithImpl<$Res,
        $Val extends IndoorNavigationModel>
    implements $IndoorNavigationModelCopyWith<$Res> {
  _$IndoorNavigationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = freezed,
    Object? destination = freezed,
    Object? indoorLocationGraph = freezed,
    Object? gettingIndoorLocationGraph = null,
    Object? shortestPath = freezed,
    Object? nextIndoorLocation = freezed,
  }) {
    return _then(_value.copyWith(
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as IndoorLocationVertex?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as IndoorLocationVertex?,
      indoorLocationGraph: freezed == indoorLocationGraph
          ? _value.indoorLocationGraph
          : indoorLocationGraph // ignore: cast_nullable_to_non_nullable
              as IndoorLocationGraph?,
      gettingIndoorLocationGraph: null == gettingIndoorLocationGraph
          ? _value.gettingIndoorLocationGraph
          : gettingIndoorLocationGraph // ignore: cast_nullable_to_non_nullable
              as bool,
      shortestPath: freezed == shortestPath
          ? _value.shortestPath
          : shortestPath // ignore: cast_nullable_to_non_nullable
              as ShortestPath?,
      nextIndoorLocation: freezed == nextIndoorLocation
          ? _value.nextIndoorLocation
          : nextIndoorLocation // ignore: cast_nullable_to_non_nullable
              as IndoorLocationVertex?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IndoorNavigationModelImplCopyWith<$Res>
    implements $IndoorNavigationModelCopyWith<$Res> {
  factory _$$IndoorNavigationModelImplCopyWith(
          _$IndoorNavigationModelImpl value,
          $Res Function(_$IndoorNavigationModelImpl) then) =
      __$$IndoorNavigationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {IndoorLocationVertex? origin,
      IndoorLocationVertex? destination,
      IndoorLocationGraph? indoorLocationGraph,
      bool gettingIndoorLocationGraph,
      ShortestPath? shortestPath,
      IndoorLocationVertex? nextIndoorLocation});
}

/// @nodoc
class __$$IndoorNavigationModelImplCopyWithImpl<$Res>
    extends _$IndoorNavigationModelCopyWithImpl<$Res,
        _$IndoorNavigationModelImpl>
    implements _$$IndoorNavigationModelImplCopyWith<$Res> {
  __$$IndoorNavigationModelImplCopyWithImpl(_$IndoorNavigationModelImpl _value,
      $Res Function(_$IndoorNavigationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = freezed,
    Object? destination = freezed,
    Object? indoorLocationGraph = freezed,
    Object? gettingIndoorLocationGraph = null,
    Object? shortestPath = freezed,
    Object? nextIndoorLocation = freezed,
  }) {
    return _then(_$IndoorNavigationModelImpl(
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as IndoorLocationVertex?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as IndoorLocationVertex?,
      indoorLocationGraph: freezed == indoorLocationGraph
          ? _value.indoorLocationGraph
          : indoorLocationGraph // ignore: cast_nullable_to_non_nullable
              as IndoorLocationGraph?,
      gettingIndoorLocationGraph: null == gettingIndoorLocationGraph
          ? _value.gettingIndoorLocationGraph
          : gettingIndoorLocationGraph // ignore: cast_nullable_to_non_nullable
              as bool,
      shortestPath: freezed == shortestPath
          ? _value.shortestPath
          : shortestPath // ignore: cast_nullable_to_non_nullable
              as ShortestPath?,
      nextIndoorLocation: freezed == nextIndoorLocation
          ? _value.nextIndoorLocation
          : nextIndoorLocation // ignore: cast_nullable_to_non_nullable
              as IndoorLocationVertex?,
    ));
  }
}

/// @nodoc

class _$IndoorNavigationModelImpl implements _IndoorNavigationModel {
  const _$IndoorNavigationModelImpl(
      {this.origin,
      this.destination,
      this.indoorLocationGraph,
      this.gettingIndoorLocationGraph = false,
      this.shortestPath,
      this.nextIndoorLocation});

  @override
  final IndoorLocationVertex? origin;
  @override
  final IndoorLocationVertex? destination;
  @override
  final IndoorLocationGraph? indoorLocationGraph;
  @override
  @JsonKey()
  final bool gettingIndoorLocationGraph;
  @override
  final ShortestPath? shortestPath;
  @override
  final IndoorLocationVertex? nextIndoorLocation;

  @override
  String toString() {
    return 'IndoorNavigationModel(origin: $origin, destination: $destination, indoorLocationGraph: $indoorLocationGraph, gettingIndoorLocationGraph: $gettingIndoorLocationGraph, shortestPath: $shortestPath, nextIndoorLocation: $nextIndoorLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndoorNavigationModelImpl &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.indoorLocationGraph, indoorLocationGraph) ||
                other.indoorLocationGraph == indoorLocationGraph) &&
            (identical(other.gettingIndoorLocationGraph,
                    gettingIndoorLocationGraph) ||
                other.gettingIndoorLocationGraph ==
                    gettingIndoorLocationGraph) &&
            (identical(other.shortestPath, shortestPath) ||
                other.shortestPath == shortestPath) &&
            (identical(other.nextIndoorLocation, nextIndoorLocation) ||
                other.nextIndoorLocation == nextIndoorLocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      origin,
      destination,
      indoorLocationGraph,
      gettingIndoorLocationGraph,
      shortestPath,
      nextIndoorLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IndoorNavigationModelImplCopyWith<_$IndoorNavigationModelImpl>
      get copyWith => __$$IndoorNavigationModelImplCopyWithImpl<
          _$IndoorNavigationModelImpl>(this, _$identity);
}

abstract class _IndoorNavigationModel implements IndoorNavigationModel {
  const factory _IndoorNavigationModel(
          {final IndoorLocationVertex? origin,
          final IndoorLocationVertex? destination,
          final IndoorLocationGraph? indoorLocationGraph,
          final bool gettingIndoorLocationGraph,
          final ShortestPath? shortestPath,
          final IndoorLocationVertex? nextIndoorLocation}) =
      _$IndoorNavigationModelImpl;

  @override
  IndoorLocationVertex? get origin;
  @override
  IndoorLocationVertex? get destination;
  @override
  IndoorLocationGraph? get indoorLocationGraph;
  @override
  bool get gettingIndoorLocationGraph;
  @override
  ShortestPath? get shortestPath;
  @override
  IndoorLocationVertex? get nextIndoorLocation;
  @override
  @JsonKey(ignore: true)
  _$$IndoorNavigationModelImplCopyWith<_$IndoorNavigationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
