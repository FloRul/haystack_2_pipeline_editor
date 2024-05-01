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
  List<BaseNode> get nodes => throw _privateConstructorUsedError;
  List<Connection> get connections => throw _privateConstructorUsedError;
  List<NodeUI> get nodesUI => throw _privateConstructorUsedError;
  List<SocketUI> get socketsUI => throw _privateConstructorUsedError;
  Offset get dragOffset => throw _privateConstructorUsedError;
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
      {List<BaseNode> nodes,
      List<Connection> connections,
      List<NodeUI> nodesUI,
      List<SocketUI> socketsUI,
      Offset dragOffset,
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
    Object? nodes = null,
    Object? connections = null,
    Object? nodesUI = null,
    Object? socketsUI = null,
    Object? dragOffset = null,
    Object? maxGridSize = null,
    Object? maxDragOffset = null,
  }) {
    return _then(_value.copyWith(
      nodes: null == nodes
          ? _value.nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<BaseNode>,
      connections: null == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as List<Connection>,
      nodesUI: null == nodesUI
          ? _value.nodesUI
          : nodesUI // ignore: cast_nullable_to_non_nullable
              as List<NodeUI>,
      socketsUI: null == socketsUI
          ? _value.socketsUI
          : socketsUI // ignore: cast_nullable_to_non_nullable
              as List<SocketUI>,
      dragOffset: null == dragOffset
          ? _value.dragOffset
          : dragOffset // ignore: cast_nullable_to_non_nullable
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
      {List<BaseNode> nodes,
      List<Connection> connections,
      List<NodeUI> nodesUI,
      List<SocketUI> socketsUI,
      Offset dragOffset,
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
    Object? nodes = null,
    Object? connections = null,
    Object? nodesUI = null,
    Object? socketsUI = null,
    Object? dragOffset = null,
    Object? maxGridSize = null,
    Object? maxDragOffset = null,
  }) {
    return _then(_$PipelineStateImpl(
      nodes: null == nodes
          ? _value._nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<BaseNode>,
      connections: null == connections
          ? _value._connections
          : connections // ignore: cast_nullable_to_non_nullable
              as List<Connection>,
      nodesUI: null == nodesUI
          ? _value._nodesUI
          : nodesUI // ignore: cast_nullable_to_non_nullable
              as List<NodeUI>,
      socketsUI: null == socketsUI
          ? _value._socketsUI
          : socketsUI // ignore: cast_nullable_to_non_nullable
              as List<SocketUI>,
      dragOffset: null == dragOffset
          ? _value.dragOffset
          : dragOffset // ignore: cast_nullable_to_non_nullable
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
      {required final List<BaseNode> nodes,
      required final List<Connection> connections,
      required final List<NodeUI> nodesUI,
      required final List<SocketUI> socketsUI,
      required this.dragOffset,
      required this.maxGridSize,
      required this.maxDragOffset})
      : _nodes = nodes,
        _connections = connections,
        _nodesUI = nodesUI,
        _socketsUI = socketsUI;

  final List<BaseNode> _nodes;
  @override
  List<BaseNode> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }

  final List<Connection> _connections;
  @override
  List<Connection> get connections {
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

  final List<SocketUI> _socketsUI;
  @override
  List<SocketUI> get socketsUI {
    if (_socketsUI is EqualUnmodifiableListView) return _socketsUI;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_socketsUI);
  }

  @override
  final Offset dragOffset;
  @override
  final double maxGridSize;
  @override
  final double maxDragOffset;

  @override
  String toString() {
    return 'PipelineEditorState(nodes: $nodes, connections: $connections, nodesUI: $nodesUI, socketsUI: $socketsUI, dragOffset: $dragOffset, maxGridSize: $maxGridSize, maxDragOffset: $maxDragOffset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PipelineStateImpl &&
            const DeepCollectionEquality().equals(other._nodes, _nodes) &&
            const DeepCollectionEquality()
                .equals(other._connections, _connections) &&
            const DeepCollectionEquality().equals(other._nodesUI, _nodesUI) &&
            const DeepCollectionEquality()
                .equals(other._socketsUI, _socketsUI) &&
            (identical(other.dragOffset, dragOffset) ||
                other.dragOffset == dragOffset) &&
            (identical(other.maxGridSize, maxGridSize) ||
                other.maxGridSize == maxGridSize) &&
            (identical(other.maxDragOffset, maxDragOffset) ||
                other.maxDragOffset == maxDragOffset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_nodes),
      const DeepCollectionEquality().hash(_connections),
      const DeepCollectionEquality().hash(_nodesUI),
      const DeepCollectionEquality().hash(_socketsUI),
      dragOffset,
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
      {required final List<BaseNode> nodes,
      required final List<Connection> connections,
      required final List<NodeUI> nodesUI,
      required final List<SocketUI> socketsUI,
      required final Offset dragOffset,
      required final double maxGridSize,
      required final double maxDragOffset}) = _$PipelineStateImpl;

  @override
  List<BaseNode> get nodes;
  @override
  List<Connection> get connections;
  @override
  List<NodeUI> get nodesUI;
  @override
  List<SocketUI> get socketsUI;
  @override
  Offset get dragOffset;
  @override
  double get maxGridSize;
  @override
  double get maxDragOffset;
  @override
  @JsonKey(ignore: true)
  _$$PipelineStateImplCopyWith<_$PipelineStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
