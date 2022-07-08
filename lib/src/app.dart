import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/components/image_data.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'controller/bottom_nav_controller.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(
        () => Scaffold(
          appBar: AppBar(),
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              Container(
                child:
                    Center(child: Text('HOME ${controller.pageIndex.value}')),
              ),
              Container(
                child:
                    Center(child: Text('SEARCH ${controller.pageIndex.value}')),
              ),
              Container(
                child:
                    Center(child: Text('UPLOAD ${controller.pageIndex.value}')),
              ),
              Container(
                child: Center(
                    child: Text('ACTIVITY ${controller.pageIndex.value}')),
              ),
              Container(
                child:
                    Center(child: Text('MYPAGE ${controller.pageIndex.value}')),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.pageIndex.value,
              onTap: controller.changeBottomNav,
              items: [
                BottomNavigationBarItem(
                    icon: ImageData(Iconpath.homeOff),
                    activeIcon: ImageData(Iconpath.homeOn),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: ImageData(Iconpath.searchOff),
                    activeIcon: ImageData(Iconpath.searchOn),
                    label: 'search'),
                BottomNavigationBarItem(
                    icon: ImageData(Iconpath.uploadIcon), label: 'upload'),
                BottomNavigationBarItem(
                    icon: ImageData(Iconpath.activeOff),
                    activeIcon: ImageData(Iconpath.activeOn),
                    label: 'activity'),
                BottomNavigationBarItem(
                    icon: ImageData(Iconpath.homeOff),
                    activeIcon: ImageData(Iconpath.homeOff),
                    label: 'mypage'),
              ]),
        ),
      ),
      onWillPop: controller.willPopAction,
      //뒤로 가기 버튼 클릭 이벤트
    );
  }
}
