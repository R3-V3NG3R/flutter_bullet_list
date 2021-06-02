part of '../flutter_bullet_list.dart';

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
              bulletType: kBulletTypeList[bulletType] ?? BulletType.dot,
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
