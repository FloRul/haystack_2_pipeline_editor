// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pipeline_editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PipelineEditorState {
  List<ConnectionUI> get connections => throw _privateConstructorUsedError;
  List<NodeUI> get nodesUI => throw _privateConstructorUsedError;
  List<SocketUI> get sockets => throw _privateConstructorUsedError;
  Offset get gridOffset => throw _privateConstructorUsedError;
  double get maxGridSize => throw _privateConstructorUsedError;
  double get maxDragOffset => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PipelineEditorStateCopyWith<PipelineEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PipelineEditorStateCopyWith<$Res> {
  factory $PipelineEditorStateCopyWith(
          PipelineEditorState value, $Res Function(PipelineEditorState) then) =
      _$PipelineEditorStateCopyWithImpl<$Res, PipelineEditorState>;
  @useResult
  $Res call(
      {List<ConnectionUI> connections,
      List<NodeUI> nodesUI,
      List<SocketUI> sockets,
      Offset gridOffset,
      double maxGridSize,
      double maxDragOffset});
}

/// @nodoc
class _$PipelineEditorStateCopyWithImpl<$Res, $Val extends PipelineEditorState>
    implements $PipelineEditorStateCopyWith<$Res> {
  _$PipelineEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connections = null,
    Object? nodesUI = null,
    Object? sockets = null,
    Object? gridOffset = null,
    Object? maxGridSize = null,
    Object? maxDragOffset = null,
  }) {
    return _then(_value.copyWith(
      connections: null == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as List<ConnectionUI>,
      nodesUI: null == nodesUI
          ? _value.nodesUI
          : nodesUI // ignore: cast_nullable_to_non_nullable
              as List<NodeUI>,
      sockets: null == sockets
          ? _value.sockets
          : sockets // ignore: cast_nullable_to_non_nullable
              as List<SocketUI>,
      gridOffset: null == gridOffset
          ? _value.gridOffset
          : gridOffset // ignore: cast_nullable_to_non_nullable
              as Offset,
      maxGridSize: null == maxGridSize
          ? _value.maxGridSize
          : maxGridSize // ignore: cast_nullable_to_non_nullable
              as double,
      maxDragOffset: null == maxDragOffset
          ? _value.maxDragOffset
          : maxDragOffset // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PipelineStateImplCopyWith<$Res>
    implements $PipelineEditorStateCopyWith<$Res> {
  factory _$$PipelineStateImplCopyWith(
          _$PipelineStateImpl value, $Res Function(_$PipelineStateImpl) then) =
      __$$PipelineStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ConnectionUI> connections,
      List<NodeUI> nodesUI,
      List<SocketUI> sockets,
      Offset gridOffset,
      double maxGridSize,
      double maxDragOffset});
}

/// @nodoc
class __$$PipelineStateImplCopyWithImpl<$Res>
    extends _$PipelineEditorStateCopyWithImpl<$Res, _$PipelineStateImpl>
    implements _$$PipelineStateImplCopyWith<$Res> {
  __$$PipelineStateImplCopyWithImpl(
      _$PipelineStateImpl _value, $Res Function(_$PipelineStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connections = null,
    Object? nodesUI = null,
    Object? sockets = null,
    Object? gridOffset = null,
    Object? maxGridSize = null,
    Object? maxDragOffset = null,
  }) {
    return _then(_$PipelineStateImpl(
      connections: null == connections
          ? _value._connections
          : connections // ignore: cast_nullable_to_non_nullable
              as List<ConnectionUI>,
      nodesUI: null == nodesUI
          ? _value._nodesUI
          : nodesUI // ignore: cast_nullable_to_non_nullable
              as List<NodeUI>,
      sockets: null == sockets
          ? _value._sockets
          : sockets // ignore: cast_nullable_to_non_nullable
              as List<SocketUI>,
      gridOffset: null == gridOffset
          ? _value.gridOffset
          : gridOffset // ignore: cast_nullable_to_non_nullable
              as Offset,
      maxGridSize: null == maxGridSize
          ? _value.maxGridSize
          : maxGridSize // ignore: cast_nullable_to_non_nullable
              as double,
      maxDragOffset: null == maxDragOffset
          ? _value.maxDragOffset
          : maxDragOffset // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PipelineStateImpl implements _PipelineState {
  const _$PipelineStateImpl(
      {required final List<ConnectionUI> connections,
      required final List<NodeUI> nodesUI,
      required final List<SocketUI> sockets,
      required this.gridOffset,
      required this.maxGridSize,
      required this.maxDragOffset})
      : _connections = connections,
        _nodesUI = nodesUI,
        _sockets = sockets;

  final List<ConnectionUI> _connections;
  @override
  List<ConnectionUI> get connections {
    if (_connections is EqualUnmodifiableListView) return _connections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_connections);
  }

  final List<NodeUI> _nodesUI;
  @override
  List<NodeUI> get nodesUI {
    if (_nodesUI is EqualUnmodifiableListView) return _nodesUI;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodesUI);
  }

  final List<SocketUI> _sockets;
  @override
  List<SocketUI> get sockets {
    if (_sockets is EqualUnmodifiableListView) return _sockets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sockets);
  }

  @override
  final Offset gridOffset;
  @override
  final double maxGridSize;
  @override
  final double maxDragOffset;

  @override
  String toString() {
    return 'PipelineEditorState(connections: $connections, nodesUI: $nodesUI, sockets: $sockets, gridOffset: $gridOffset, maxGridSize: $maxGridSize, maxDragOffset: $maxDragOffset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PipelineStateImpl &&
            const DeepCollectionEquality()
                .equals(other._connections, _connections) &&
            const DeepCollectionEquality().equals(other._nodesUI, _nodesUI) &&
            const DeepCollectionEquality().equals(other._sockets, _sockets) &&
            (identical(other.gridOffset, gridOffset) ||
                other.gridOffset == gridOffset) &&
            (identical(other.maxGridSize, maxGridSize) ||
                other.maxGridSize == maxGridSize) &&
            (identical(other.maxDragOffset, maxDragOffset) ||
                other.maxDragOffset == maxDragOffset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_connections),
      const DeepCollectionEquality().hash(_nodesUI),
      const DeepCollectionEquality().hash(_sockets),
      gridOffset,
      maxGridSize,
      maxDragOffset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PipelineStateImplCopyWith<_$PipelineStateImpl> get copyWith =>
      __$$PipelineStateImplCopyWithImpl<_$PipelineStateImpl>(this, _$identity);
}

abstract class _PipelineState implements PipelineEditorState {
  const factory _PipelineState(
      {required final List<ConnectionUI> connections,
      required final List<NodeUI> nodesUI,
      required final List<SocketUI> sockets,
      required final Offset gridOffset,
      required final double maxGridSize,
      required final double maxDragOffset}) = _$PipelineStateImpl;

  @override
  List<ConnectionUI> get connections;
  @override
  List<NodeUI> get nodesUI;
  @override
  List<SocketUI> get sockets;
  @override
  Offset get gridOffset;
  @override
  double get maxGridSize;
  @override
  double get maxDragOffset;
  @override
  @JsonKey(ignore: true)
  _$$PipelineStateImplCopyWith<_$PipelineStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
