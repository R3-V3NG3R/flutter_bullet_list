library flutter_bullet_list;

import 'package:flutter/material.dart';

part './components/list_item_component.dart';

part './constants/enums.dart';

part './models/list_item_model.dart';

class FlutterBulletList extends StatelessWidget {
  final List<ListItemModel>? data;
  final TextStyle? textStyle;
  final double spaceBetweenItem;
  final double bulletSize;
  final BulletType bulletType;
  final Color bulletColor;
  final double bulletSpacing;
  final double levelPadding;

  const FlutterBulletList({
    @required this.data,
    this.textStyle,
    this.spaceBetweenItem = 8.0,
    this.bulletSize = 5.0,
    this.bulletType = BulletType.dot,
    this.bulletColor = Colors.black,
    this.bulletSpacing = 6.0,
    this.levelPadding = 24.0,
  }) : assert(data != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data!
          .map<Widget>(
            (item) => _ListItemComponent(
              item: item,
              bulletType: bulletType,
              bulletColor: bulletColor,
              bulletSize: bulletSize,
              bulletSpacing: bulletSpacing,
              spaceBetweenItem: spaceBetweenItem,
              textStyle: textStyle,
              levelPadding: levelPadding,
            ),
          )
          .toList(),
    );
  }
}

