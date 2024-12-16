import 'package:flutter/material.dart';
import 'package:latihan/layout/model/Getnews.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'apiPage/NewsCard.dart';

class Newspage extends StatefulWidget {
  const Newspage({Key? key}) : super(key: key);

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  Future<List<Getnews>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      var getPostsData = json.decode(response.body) as List;
      return getPostsData.map((i) => Getnews.fromJson(i)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  late Future<List<Getnews>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Post List',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade50, Colors.blue.shade200],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FutureBuilder<List<Getnews>>(
              future: futurePosts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      var post = snapshot.data![index];
                      return Newscard(getnews: post);
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                    ),
                    itemCount: snapshot.data!.length,
                  );
                } else {
                  return const Center(
                    child: Text(
                      'No data available',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
