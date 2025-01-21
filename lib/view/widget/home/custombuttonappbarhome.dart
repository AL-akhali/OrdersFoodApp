import 'package:flutter/material.dart';
import 'package:full_ecommerce/controller/homescreen_controller.dart';
import 'package:full_ecommerce/view/widget/home/custombuttonappbar.dart';
import 'package:get/get.dart';

class CustomButtonAppbarHome extends StatelessWidget {
  const CustomButtonAppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(controller.ListPage.length + 1, ((index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? Spacer()
                        : CustomButtonAppbar(
                            title: controller.titlebottomappbar[i]["title"],
                            icon: controller.titlebottomappbar[i]["icon"],
                            active: controller.currentpage == i ? true : false,
                            onPressed: () {
                              controller.changePage(i);
                            },
                          );
                  }))
                ],
              ),
            ));
  }
}
