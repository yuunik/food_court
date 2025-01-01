import 'package:flutter/material.dart';

class ChorriaStyleApp extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? floatingActionButton;

  ChorriaStyleApp({
    required this.title,
    required this.child,
    this.floatingActionButton,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }
}
