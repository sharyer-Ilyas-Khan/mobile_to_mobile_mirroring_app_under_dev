import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dialogs_controller.dart';

class DialogsView extends GetView<DialogsController> {
  final String? tag;
  const DialogsView({this.tag,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DialogsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DialogsView is working in $tag',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
