library flutter_bullet_list;

import 'package:flutter/material.dart';

part './models/list_item_model.dart';

part './constants/enums.dart';

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
            (item) => ListItemComponent(
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

class ListItemComponent extends StatelessWidget {
  final ListItemModel? item;
  final TextStyle? textStyle;
  final double? spaceBetweenItem;
  final double? bulletSize;
  final BulletType? bulletType;
  final Color? bulletColor;
  final double? bulletSpacing;
  final double? levelPadding;

  const ListItemComponent({
    @required this.item,
    @required this.textStyle,
    @required this.spaceBetweenItem,
    @required this.bulletSize,
    @required this.bulletType,
    @required this.bulletColor,
    @required this.bulletSpacing,
    @required this.levelPadding,
  }) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(bulletSize!),
                decoration: BoxDecoration(
                  color: (bulletType != BulletType.circle)
                      ? bulletColor
                      : Colors.transparent,
                  borderRadius: (bulletType != BulletType.square)
                      ? BorderRadius.circular(40.0)
                      : BorderRadius.zero,
                  border: Border.all(
                    color: bulletColor!,
                    width: 1.0,
                  ),
                ),
              ),
              SizedBox(width: bulletSpacing),
              Expanded(
                child: Text(
                  (item!.label ?? ''),
                  style: textStyle,
                ),
              ),
            ],
          ),
          SizedBox(height: spaceBetweenItem),
          if (item!.data != null && (item!.data ?? []).isNotEmpty)
            FlutterBulletList(
              data: item!.data,
              bulletType: kBulletTypeList[bulletType]??BulletType.dot,
              textStyle: textStyle,
              levelPadding: levelPadding!,
              spaceBetweenItem: spaceBetweenItem!,
              bulletSpacing: bulletSpacing!,
              bulletSize: bulletSize!,
              bulletColor: bulletColor!,
            ),
        ],
      ),
    );
  }
}
