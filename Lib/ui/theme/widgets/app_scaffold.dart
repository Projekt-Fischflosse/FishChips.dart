import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget? child;
  final Widget? body;
  final String? title;
  final EdgeInsetsGeometry padding;

  const AppScaffold({
    super.key,
    this.child,
    this.body,
    this.title,
    this.padding = const EdgeInsets.all(16),
  }) : assert(child != null || body != null,
            'Either child or body must be provided');

  @override
  Widget build(BuildContext context) {
    final content = body ?? child!;
    return Scaffold(
      appBar: title != null ? AppBar(title: Text(title!)) : null,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Padding(
              padding: padding,
              child: content,
            ),
          ),
        ),
      ),
    );
  }
}