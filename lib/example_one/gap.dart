import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Gap extends LeafRenderObjectWidget {
  final double space;
  const Gap({super.key, required this.space});

  @override
  RenderGap createRenderObject(BuildContext context) {
    return RenderGap(space: space);
  }

  @override
  void updateRenderObject(BuildContext context, RenderGap renderObject) {
    renderObject.setSpace = space;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('space', space));
  }
}

class RenderGap extends RenderBox {
  double _space;
  double get space => _space;

  set setSpace(double value) {
    if (_space != value) {
      _space = value;
      markNeedsLayout();
    }
  }

  RenderGap({required double space}) : _space = space;
  @override
  void performLayout() {
    final RenderObject? parent = this.parent;

    if (parent is RenderFlex) {
      switch (parent.direction) {
        case Axis.horizontal:
          size = Size(_space, 0);
        case Axis.vertical:
          size = Size(0, _space);
      }
    } else {
      throw FlutterError("Parent is not a RenderFlex");
    }
  }

//if you want to see the gap, you can uncomment the paint method

  // @override
  // void paint(PaintingContext context, Offset offset) {
  //   context.canvas.drawRect(offset & size, Paint()..color = Colors.red);
  // }
}
