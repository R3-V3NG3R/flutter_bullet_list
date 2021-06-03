# Flutter Bullet List
> Developed by [Flutter Simplified](https://www.instagram.com/flutter.simplified/)

## Targeted Features
- [x] Single-level Unordered list
- [x] Customize Bullet point style
- [x] Multi-level unordered list
- [ ] Add Icon to bullet point
- [ ] Add customizations to individual level 
 
## Basic Usage
### Implementing Single Level List
- Declare your list of `ListItemModel` 
```dart
final List<ListItemModel> data=[
    ListItemModel(label: "Flutter Simplified"),
    ListItemModel(label: "Flutter Simplified"),
    ListItemModel(label: "Flutter Simplified"),
    ListItemModel(label: "Flutter Simplified"),
    ListItemModel(label: "Flutter Simplified"),
];
```
- Add `FlutterBulletList` to your widget tree
```dart
FlutterBulletList(
  data: data,
  textStyle: TextStyle(color: Colors.blue),
  bulletColor: Colors.red,
),
```
### Implementing Multi-level Lists
- Add `List<ListItemModel>` to `data` key 
```dart
final List<ListItemModel> data = [
    ListItemModel(
        label: "Flutter Simplified",
        data: [ListItemModel(label: "Follow Us on Instagram")],
    ),
    ListItemModel(  
        label: "Flutter Simplified",
        data: [
            ListItemModel(
                label: "Flutter",
                data: [
                    ListItemModel(
                        label: "Simplified",
                        data: [ListItemModel(label: "Follow us")],
                    ),
                ],
            ),
        ],
    ),
];
```

## Properties
| Property | Usage |
| -------- | ----- |
| data | List of `ListItemComponent` |
| spaceBetweenItem | distance between one list item to other |
| bulletSize | size bullet indicator |
| bulletType | design of bullet indicator |
| bulletColor | Customize the color of bullet indicator | 
| bulletSpacing | distance between bullet indicator and string |

