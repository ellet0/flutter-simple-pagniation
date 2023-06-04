import 'package:flutter/widgets.dart';
import 'package:pagination_solution/widgets/pagination/pagniation_controller.dart';

import 'pagniation_options.dart';

typedef PagniationLoadData<T> = Future<List<T>> Function(int page);

class PagiantionListBuilder<T> {
  final ScrollController scrollController;
  final bool isLoadingMore;
  final List<T> dataList;
  final int itemCount;
  final Widget loadingMoreIndicatorWidget;

  const PagiantionListBuilder({
    required this.scrollController,
    required this.isLoadingMore,
    required this.dataList,
    required this.itemCount,
    required this.loadingMoreIndicatorWidget,
  });
}

/// T is the item type in the list
class PaginationCustomView<T> extends StatefulWidget {
  const PaginationCustomView({
    super.key,
    required this.loadData,
    required this.options,
    required this.listBuilder,
  });

  /*
  Example
  PaginationListView(
      listBuilder: (pagiantionListBuilder) {
        return ListView.builder(
          controller: pagiantionListBuilder.scrollController,
          itemCount: pagiantionListBuilder.itemCount,
          itemBuilder: (context, index) {
            if (index == pagiantionListBuilder.dataList.length) {
              return pagiantionListBuilder.loadingMoreIndicatorWidget;
            }
            final item = pagiantionListBuilder.dataList[index] as T;
            return itemBuilder(context, index, item);
          },
        );
      },
      loadData: loadData,
      options: options,
    )
  */
  final Widget Function(PagiantionListBuilder pagiantionListBuilder)
      listBuilder;

  final PagniationLoadData<T> loadData;
  final PagniationOptions options;

  @override
  State<PaginationCustomView> createState() => _PaginationListViewState<T>();
}

class _PaginationListViewState<T> extends State<PaginationCustomView> {
  late Future<List<T>> _loadDataFuture;
  late final ScrollController _scrollController;

  final List<T> _dataList = [];
  var _page = 1;

  var _isLoadingMore = false;
  var _isInitLoading = true;

  var _isAllLoaded = false;
  Future<List<T>> _loadData() => widget.loadData(_page) as Future<List<T>>;

  @override
  void initState() {
    super.initState();
    _loadDataFuture = _loadData();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    if (widget.options.controller != null) {
      widget.options.controller?.addListener(_controllerListener);
    }
  }

  void _resetAllStates() {
    _dataList.clear();
    _page = 1;
    _isLoadingMore = false;
    _isInitLoading = true;
    _isAllLoaded = false;
  }

  void _controllerListener() {
    switch (widget.options.controller!.action) {
      case PagniationControllerAction.refreshDataList:
        setState(() {
          _resetAllStates();
          _loadDataFuture = _loadData();
        });
        break;
      case PagniationControllerAction.none:
        break;
    }
  }

  void _onScroll() async {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (_isAllLoaded) {
        print('Returned because all items is already loaded');
        return;
      }
      try {
        setState(() {
          _isLoadingMore = true;
        });
        _page++;
        _loadDataFuture = _loadData();
        final posts = await _loadDataFuture;
        if (posts.isEmpty) {
          setState(() {
            _isLoadingMore = false;
            _isAllLoaded = true;
          });
          await Future.delayed(Duration.zero);
          Future.microtask(
            () {
              if (widget.options.onReachEnd != null) {
                widget.options.onReachEnd!();
              }
            },
          );
          return;
        }
        _dataList.addAll(posts);
      } catch (e) {
        widget.options.loadingMoreErrorHandler(e);
      } finally {
        setState(() {
          _isLoadingMore = false;
        });
      }
    }
  }

  @override
  void dispose() {
    if (widget.options.controller != null) {
      widget.options.controller?.removeListener(_controllerListener);
      widget.options.controller?.dispose();
    }
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Widget get _list {
    return widget.listBuilder(
      PagiantionListBuilder(
        scrollController: _scrollController,
        dataList: _dataList,
        isLoadingMore: _isLoadingMore,
        itemCount: _isLoadingMore ? _dataList.length + 1 : _dataList.length,
        loadingMoreIndicatorWidget: widget.options.loadingMoreIndicatorWidget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitLoading) {
      return _list;
    }
    return FutureBuilder(
      future: _loadDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return widget.options.initLoadingIndicatorWidget;
        }
        if (snapshot.hasError) {
          return widget.options.initErrorHandler(snapshot.error);
        }
        _isInitLoading = false;
        final posts = snapshot.requireData;
        if (posts.isEmpty) {
          return const Center(
            child: Text('No data'),
          );
        }
        _dataList.addAll(posts);
        return _list;
      },
    );
  }
}
