import 'package:flutter/material.dart';
import 'package:collection/collection.dart' show DeepCollectionEquality;

class SlideText<T> extends StatefulWidget {
  final T data;
  final Widget Function(T data) builder;
  final SlideEffect slideTransition;
  final Offset offset;
  final Duration duration;
  final Function(T, T) isEqual;

  const SlideText({
    Key key,
    @required this.data,
    @required this.builder,
    this.slideTransition = SlideEffect.sliderOutSlideIn,
    this.offset = const Offset(10.0, 0.0),
    this.duration = const Duration(milliseconds: 300),
    this.isEqual,
  }) : super(key: key);

  @override
  _SlideTextState createState() => _SlideTextState<T>();
}

class _SlideTextState<T> extends State<SlideText<T>>
    with SingleTickerProviderStateMixin {
  final equality = DeepCollectionEquality();
  AnimationController controller;
  Offset offset;
  T data;

  @override
  void initState() {
    super.initState();
    data = widget.data;
    offset = widget.offset;
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          data = widget.data;
          offset = _offsetFromTransition();
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          offset = widget.offset;
        }
      });
    controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SlideText<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    final areEqual = widget.isEqual != null
        ? widget.isEqual(data, widget.data)
        : equality.equals(data, widget.data);
    if (!areEqual) {
      controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        offset.dx * controller.value,
        offset.dy * controller.value,
      ),
      child: Opacity(
        opacity: 1.0 - controller.value,
        child: widget.builder(data),
      ),
    );
  }

  Offset _offsetFromTransition() {
    switch (widget.slideTransition) {
      case SlideEffect.sliderOutSlideIn:
        return Offset(-offset.dx, -offset.dy);
      case SlideEffect.slideOutAndIn:
        return offset;
      default:
        return Offset.zero;
    }
  }
}

enum SlideEffect {
  slideOutAndIn,
  sliderOutSlideIn,
}
