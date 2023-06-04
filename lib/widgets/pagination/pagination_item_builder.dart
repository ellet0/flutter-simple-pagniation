import 'package:flutter/widgets.dart' show BuildContext, Widget;

typedef PagniationItemBuilder<T> = Widget Function(
  BuildContext context,
  int index,
  dynamic item,
);
