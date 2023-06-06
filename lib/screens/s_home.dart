import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pagination_solution/widgets/pagination/pagniation_controller.dart';

import 'package:pagination_solution/widgets/pagination/w_pagination_list_view.dart';

import '../data/todo/m_post.dart';
import '../widgets/pagination/pagniation_options.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pagniationController = PagniationController();
  var _searchQuery = '';

  @override
  void dispose() {
    _pagniationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi'),
        actions: [
          IconButton(
            onPressed: () {
              _pagniationController.refreshDataList();
            },
            icon: const Icon(Icons.refresh),
          ),
          Expanded(
            child: TextField(
              onSubmitted: (value) {
                print('Submitted');
                _searchQuery = value;
                _pagniationController.refreshDataList();
              },
              onChanged: (value) {
                if (value.trim().isEmpty && _searchQuery.trim().isNotEmpty) {
                  _searchQuery = '';
                  _pagniationController.refreshDataList();
                }
              },
            ),
          )
        ],
      ),
      body: PagniationListView<Post>(
        options: PagniationOptions(
          loadingMoreErrorHandler: (error) {
            print(error);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error.toString()),
            ));
          },
          initErrorHandler: (error) {
            print(error.toString());
            return Text(error.toString());
          },
          initLoadingIndicatorWidget: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          loadingMoreIndicatorWidget: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          controller: _pagniationController,
        ),
        loadData: (page) async {
          const baseUrl = 'https://www.sonymusic.com/wp-json/wp/v2';
          const limit = 10;
          final response = await http.get(
            Uri.parse(
              '$baseUrl/posts?context=embed&per_page=$limit&page=$page&search=$_searchQuery',
            ),
          );
          if (response.statusCode == 400) {
            return [];
          }
          final jsonResponseBody = jsonDecode(response.body) as List<dynamic>;
          final responseBody =
              jsonResponseBody.map((e) => Post.fromJson(e)).toList();
          await Future.delayed(const Duration(milliseconds: 700));
          // Fake api emulation:
          // final responseBody = List.generate(
          //     10,
          //     (index) => Post(
          //           id: Random().nextInt(255),
          //           title: PostTitle(
          //             rendered: Random().nextInt(255).toString() * 50,
          //           ),
          //         ));
          // if (page == 5) {
          //   return [];
          // }
          return responseBody;
        },
        itemBuilder: (context, index, dynamicItem) {
          final item = dynamicItem as Post;
          return ListTile(
            title: Text(item.title.rendered),
            subtitle: Text(item.id.toString()),
            leading: CircleAvatar(
              child: Text((index + 1).toString()),
            ),
          );
        },
      ),
    );
  }
}
