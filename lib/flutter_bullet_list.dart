library flutter_bullet_list;

import 'package:flutter/material.dart';

enum BulletType { dot, circle, square }

class FlutterBulletList extends StatelessWidget {
  final List<String>? data;
  final TextStyle? textStyle;
  final double spaceBetweenItem;
  final double bulletSize;
  final BulletType bulletType;
  final Color bulletColor;
  final double bulletSpacing;

  const FlutterBulletList({
    @required this.data,
    this.textStyle,
    this.spaceBetweenItem = 8.0,
    this.bulletSize = 5.0,
    this.bulletType = BulletType.dot,
    this.bulletColor = Colors.black,
    this.bulletSpacing = 6.0,
  }):assert(data!=null);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data!.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(bulletSize),
                decoration: BoxDecoration(
                  color: (bulletType != BulletType.circle)
                      ? bulletColor
                      : Colors.transparent,
                  borderRadius: (bulletType != BulletType.square)
                      ? BorderRadius.circular(40.0)
                      : BorderRadius.zero,
                  border: Border.all(
                    color: bulletColor,
                    width: 1.0,
                  ),
                ),
              ),
              SizedBox(width: bulletSpacing),
              Expanded(
                child: Text(
                  data![index],
                  style: textStyle,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
