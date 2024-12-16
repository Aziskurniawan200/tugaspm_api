import 'package:flutter/material.dart';

class HomepageWithMenu extends StatelessWidget {
  const HomepageWithMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage with Menu'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Menu clicked!')),
            );
          },
          child: const Text('Click Menu'),
        ),
      ),
    );
  }
}
