import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:contextmenu/src/ContextMenu.dart';

/// Show a [ContextMenu] on the given [BuildContext]. For other parameters, see [ContextMenu].
Future<T?> showContextMenu<T>(
  Offset offset,
  BuildContext context,
  List<Widget> Function(BuildContext) builder,
  verticalPadding,
  width,
) {
  return showModal(
    context: context,
    configuration: FadeScaleTransitionConfiguration(
      barrierColor: Colors.transparent,
    ),
    builder: (context) => ContextMenu(
      position: offset,
      verticalPadding: verticalPadding,
      width: width,
      children: builder.call(context),
    ),
  );
}

/// The [ContextMenuArea] is the way to use a [ContextMenu]
///
/// It listens for right click and long press and executes [showContextMenu]
/// with the corresponding location [Offset].

class ContextMenuArea extends StatelessWidget {
  /// The widget displayed inside the [ContextMenuArea]
  final Widget child;

  /// A [Builder] of items to be displayed in an opened [ContextMenu]
  ///
  final List<Widget> Function(BuildContext) builder;

  /// The padding value at the top an bottom between the edge of the [ContextMenu] and the first / last item
  final double verticalPadding;

  /// The width for the [ContextMenu]. 320 by default according to Material Design specs.
  final double width;

  const ContextMenuArea({
    Key? key,
    required this.child,
    required this.builder,
    this.verticalPadding = 8,
    this.width = 320,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTapDown: (details) => showContextMenu(
        details.globalPosition,
        context,
        builder,
        verticalPadding,
        width,
      ),
      onLongPressStart: (details) => showContextMenu(
        details.globalPosition,
        context,
        builder,
        verticalPadding,
        width,
      ),
      child: child,
    );
  }
}
