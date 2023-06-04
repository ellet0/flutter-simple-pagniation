// import 'package:flutter/widgets.dart';
// import 'package:pagination_solution/widgets/pagination/pagniation_controller.dart';
// import 'package:pagination_solution/widgets/pagination/w_custom_pagniation.dart';

// import 'pagniation_options.dart';

// /// T is the item type in the list
// class PaginationListView<T> extends StatefulWidget {
//   const PaginationListView({
//     super.key,
//     required this.itemBuilder,
//     required this.loadData,
//     required this.options,
//   });

//   final PagniationItemBuilder<T> itemBuilder;
//   final Future<List<T>> Function(int page) loadData;
//   final PagniationOptions options;

//   @override
//   State<PaginationListView> createState() => _PaginationListViewState<T>();
// }

// class _PaginationListViewState<T> extends State<PaginationListView> {
//   late Future<List<T>> _loadDataFuture;
//   late final ScrollController _scrollController;

//   final List<T> _dataList = [];
//   var _page = 1;

//   var _isLoadingMore = false;
//   var _isInitLoading = true;

//   var _isAllLoaded = false;
//   Future<List<T>> _loadData() => widget.loadData(_page) as Future<List<T>>;

//   @override
//   void initState() {
//     super.initState();
//     _loadDataFuture = _loadData();
//     _scrollController = ScrollController();
//     _scrollController.addListener(_onScroll);
//     if (widget.options.controller != null) {
//       widget.options.controller?.addListener(_controllerListener);
//     }
//   }

//   void _resetAllStates() {
//     _dataList.clear();
//     _page = 1;
//     _isLoadingMore = false;
//     _isInitLoading = true;
//     _isAllLoaded = false;
//   }

//   void _controllerListener() {
//     switch (widget.options.controller!.action) {
//       case PagniationControllerAction.refreshDataList:
//         setState(() {
//           _resetAllStates();
//           _loadDataFuture = _loadData();
//         });
//         break;
//       case PagniationControllerAction.none:
//         break;
//     }
//   }

//   void _onScroll() async {
//     if (_scrollController.offset >=
//             _scrollController.position.maxScrollExtent &&
//         !_scrollController.position.outOfRange) {
//       if (_isAllLoaded) {
//         print('Returned because all items is already loaded');
//         return;
//       }
//       try {
//         setState(() {
//           _isLoadingMore = true;
//         });
//         _page++;
//         _loadDataFuture = _loadData();
//         final posts = await _loadDataFuture;
//         if (posts.isEmpty) {
//           setState(() {
//             _isLoadingMore = false;
//             _isAllLoaded = true;
//           });
//           await Future.delayed(Duration.zero);
//           Future.microtask(
//             () {
//               if (widget.options.onReachEnd != null) {
//                 widget.options.onReachEnd!();
//               }
//             },
//           );
//           return;
//         }
//         _dataList.addAll(posts);
//       } catch (e) {
//         widget.options.loadingMoreErrorHandler(e);
//       } finally {
//         setState(() {
//           _isLoadingMore = false;
//         });
//       }
//     }
//   }

//   @override
//   void dispose() {
//     if (widget.options.controller != null) {
//       widget.options.controller?.removeListener(_controllerListener);
//       widget.options.controller?.dispose();
//     }
//     _scrollController.removeListener(_onScroll);
//     _scrollController.dispose();
//     super.dispose();
//   }

//   Widget get _list => ListView.builder(
//         controller: _scrollController,
//         itemCount: _isLoadingMore ? _dataList.length + 1 : _dataList.length,
//         itemBuilder: (context, index) {
//           if (index == _dataList.length) {
//             return widget.options.loadingMoreIndicatorWidget;
//           }
//           final item = _dataList[index];
//           return widget.itemBuilder(context, index, item);
//         },
//       );

//   @override
//   Widget build(BuildContext context) {
//     if (!_isInitLoading) {
//       return _list;
//     }
//     return FutureBuilder(
//       future: _loadDataFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return widget.options.initLoadingIndicatorWidget;
//         }
//         if (snapshot.hasError) {
//           return widget.options.initErrorHandler(snapshot.error);
//         }
//         _isInitLoading = false;
//         final posts = snapshot.requireData;
//         if (posts.isEmpty) {
//           return const Center(
//             child: Text('No data'),
//           );
//         }
//         _dataList.addAll(posts);
//         return _list;
//       },
//     );
//   }
// }

import 'package:flutter/widgets.dart';
import 'package:pagination_solution/widgets/pagination/pagniation_options.dart';
import 'package:pagination_solution/widgets/pagination/w_custom_pagniation.dart';

import 'pagination_item_builder.dart';

class PagniationListView<T> extends StatelessWidget {
  const PagniationListView({
    super.key,
    required this.loadData,
    required this.itemBuilder,
    required this.options,
  });

  final PagniationLoadData<T> loadData;
  final PagniationItemBuilder<T> itemBuilder;
  final PagniationOptions options;

  @override
  Widget build(BuildContext context) {
    return PaginationCustomView(
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
    );
  }
}
