import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/access_screen_controller.dart';

class AccessScreenView extends GetView<AccessScreenController> {
  const AccessScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccessScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AccessScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
