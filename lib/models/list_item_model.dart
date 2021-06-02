part of '../flutter_bullet_list.dart';

class ListItemModel {
  final List<ListItemModel>? data;
  final String? label;

  ListItemModel({this.data, @required this.label}) : assert(label != null);
}
