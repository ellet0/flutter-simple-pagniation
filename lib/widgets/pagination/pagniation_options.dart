import 'package:flutter/widgets.dart' show Widget, VoidCallback, immutable;

import 'pagniation_controller.dart';

@immutable
class PagniationOptions {
  final PagniationController? controller;
  final VoidCallback? onReachEnd;
  final Widget initLoadingIndicatorWidget;
  final Widget loadingMoreIndicatorWidget;
  final Widget Function(Object? error) initErrorHandler;
  final Function(Object error) loadingMoreErrorHandler;

  const PagniationOptions({
    this.controller,
    this.onReachEnd,
    required this.initLoadingIndicatorWidget,
    required this.loadingMoreIndicatorWidget,
    required this.initErrorHandler,
    required this.loadingMoreErrorHandler,
  });
}
