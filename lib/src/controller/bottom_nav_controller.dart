import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/components/messagePopup.dart';
import 'package:flutter_instagram/src/pages/upload.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.MYPAGE:
      case PageName.HOME:
      case PageName.ACTIVITY:
      case PageName.SEARCH:
        _changePage(value, hasGesture: hasGesture);
        break;
      case PageName.UPLOAD:
        Get.to(() => const Upload());
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
    }
    print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopup(
                message: '종료하시겠습니까?',
                okCallback: () {
                  exit(0);
                },
                cancelCallback: Get.back,
                title: '시스템 종료',
              ));
      return true;
    } else {
      bottomHistory.removeLast();
      var lastIndex = bottomHistory.last;
      _changePage(lastIndex, hasGesture: false);
      print(bottomHistory);
      return false;
    }
  }
}

class MessagePop {}
