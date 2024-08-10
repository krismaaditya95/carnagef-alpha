import 'package:carnagef_alpha/features/movies/presentation/home/getx/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarItem{
  NavigationBarItem({
    this.icon,
    this.text
  });
  IconData? icon;
  String? text;
}

class CustomBottomNavigationBar extends GetView<HomeController>{

  const CustomBottomNavigationBar({
    super.key,
    this.height = 60.0,
    this.iconSize = 20.0,
    this.fontSize = 10.0,
    this.foregroundColor,
    this.backgroundColor,
    this.selectedColor,
    this.centerItemIcon,
    this.centerItemTextColor,
    this.centerItemText,
    this.iconMidOnTap,
    this.notchedShape,
  });

  final double height;
  final double iconSize;
  final double fontSize;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? selectedColor;
  final IconData? centerItemIcon;
  final Color? centerItemTextColor;
  final String? centerItemText;
  final VoidCallback? iconMidOnTap;
  final NotchedShape? notchedShape;

  @override
  Widget build(BuildContext context) {
    List<Widget> menuItems = List.generate(controller.menu.length, (int index){
      return Expanded(
          child: SizedBox(
            height: height,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: (){
                  controller.bottomNavigationController.index = index;
                },
                child: Obx(() => Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Image.asset(
                    //   items![index].icon.toString(),
                    //   width: 25,
                    //   color: controller.selectedMenuIndex == index ? selectedColor : foregroundColor
                    // ),
                    Icon(
                      controller.menu[index].icon,
                      size: iconSize,
                      color: controller.selectedMenuIndex == index ? selectedColor : foregroundColor
                    ),
                    const Padding(padding: EdgeInsets.only(top: 3)),
                    Text(
                      controller.menu[index].text.toString(),
                      style: TextStyle(
                        fontSize: fontSize,
                        color: controller.selectedMenuIndex == index ? selectedColor : foregroundColor
                      ),
                    )
                  ],
                )),
              ),
            ),
          )
      );
    });

    // menuItems.insert(menuItems.length >> 1, element)

    return BottomAppBar(
      // shape: notchedShape,
      color: backgroundColor,
      elevation: 10.0,
      shadowColor: Colors.grey,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: menuItems,
      ),
    );
  }

}