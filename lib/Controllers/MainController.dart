import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

class maincontroller extends GetxController {
  TextEditingController title = TextEditingController();
  onchanged(value,data) {
    title.text = value;
    refresh();
  }
}
