import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesTabBar extends StatefulWidget {
  CategoriesTabBar({
    super.key,
  });

  @override
  State<CategoriesTabBar> createState() => _CategoriesTabBarState();
}

class _CategoriesTabBarState extends State<CategoriesTabBar> {
  Widget customIcon(IconData icon, bool isSelected) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 22.0,
            color: isSelected ? Colors.red : Colors.grey,
          ),
          const SizedBox(
            height: 10.0,
          ),
          if (isSelected)
            Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50.0)),
            )
        ],
      ),
      onTap: () {
        setState(() {
          for (var element in items) {
            if (element['icon'] == icon) {
              element['isSelected'] = true;
            } else {
              element['isSelected'] = false;
            }
          }
        });
      },
    );
  }

  final List items = [
    {"icon": FontAwesomeIcons.house, "isSelected": true},
    {"icon": FontAwesomeIcons.solidHeart, "isSelected": false},
    {"icon": FontAwesomeIcons.bagShopping, "isSelected": false},
    {"icon": FontAwesomeIcons.solidMessage, "isSelected": false},
    {"icon": FontAwesomeIcons.solidUser, "isSelected": false}
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.map((element) {
              return customIcon(element['icon'], element['isSelected']);
            }).toList()),
      ),
    );
  }
}
