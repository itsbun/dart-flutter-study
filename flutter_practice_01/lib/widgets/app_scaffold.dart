import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget? title;

  final Widget body;

  final List<Widget>? actions;

  final EdgeInsetsGeometry padding;

  final Widget? floatingActionButton;

  const AppScaffold({
    super.key,
    this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? AppBar(title: title, actions: actions, centerTitle: false)
          : null,
      body: Padding(padding: padding, child: body),
      floatingActionButton: floatingActionButton,
    );
  }
}
