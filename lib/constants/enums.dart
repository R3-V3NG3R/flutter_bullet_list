part of '../flutter_bullet_list.dart';

enum BulletType { dot, circle, square }

final Map<BulletType, BulletType> kBulletTypeList = {
  BulletType.dot: BulletType.circle,
  BulletType.circle: BulletType.square,
  BulletType.square: BulletType.dot,
};




