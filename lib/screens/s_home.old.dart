import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/todo/m_post.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Post>> _loadPostsFuture;
  late final ScrollController _scrollController;

  final List<Post> _posts = [];
  var _page = 1;

  var _isLoadingMore = false;
  var _isInitLoading = true;

  var _isAllLoaded = false;

  Future<List<Post>> _loadPosts({
    int limit = 10,
  }) async {
    const baseUrl = 'https://blog.playstation.com/wp-json/wp/v2';
    final response = await http.get(
      Uri.parse(
        '$baseUrl/posts?context=embed&per_page=$limit&page=$_page',
      ),
    );
    final jsonResponseBody = jsonDecode(response.body) as List<dynamic>;
    final responseBody = jsonResponseBody.map((e) => Post.fromJson(e)).toList();
    if (_page == 5) {
      return [];
    }
    return responseBody;
  }

  @override
  void initState() {
    super.initState();
    _loadPostsFuture = _loadPosts();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (_isAllLoaded) {
        print('Returned because all items is already loaded');
        return;
      }
      setState(() {
        _isLoadingMore = true;
      });
      _page++;
      _loadPostsFuture = _loadPosts();
      final posts = await _loadPostsFuture;
      if (posts.isEmpty) {
        setState(() {
          _isLoadingMore = false;
          _isAllLoaded = true;
        });
        await Future.delayed(Duration.zero);
        Future.microtask(
          () => ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('No more data'))),
        );
        return;
      }
      _posts.addAll(posts);
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Widget get list => ListView.builder(
        controller: _scrollController,
        itemCount: _isLoadingMore ? _posts.length + 1 : _posts.length,
        itemBuilder: (context, index) {
          if (index == _posts.length) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          final post = _posts[index];
          return ListTile(
            title: Text(post.title.rendered),
            subtitle: Text(post.id.toString()),
            leading: CircleAvatar(
              child: Text((index + 1).toString()),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi'),
      ),
      body: Builder(
        builder: (context) {
          if (!_isInitLoading) {
            return list;
          }
          return FutureBuilder(
            future: _loadPostsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              _isInitLoading = false;
              final posts = snapshot.requireData;
              if (posts.isEmpty) {
                return const Center(
                  child: Text('No data'),
                );
              }
              _posts.addAll(posts);
              return list;
            },
          );
        },
      ),
    );
  }
}
