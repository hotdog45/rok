# rok

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



flutter pub run flutter_l10n:build

//flutter pub get   pubspec 更新包


//flutter相关命令

`flutter build ios --release`

``flutter attach`` 热重载
`flutter attach -d 3HX5T17605005855`

``flutter packages pub run build_runner build`` 生成model .g.dart文件

`flutter packages pub run build_runner build --delete-conflicting-outputs`


运行：
flutter run （默认为debug环境）
flutter run --release (以release模式运行)
帮助：flutter -h 或 flutter --help
诊断flutter：flutter doctor
查看flutter版本号：flutter --version
flutter升级：flutter upgrade
获取flutter packages包：flutter packages get
json序列化，自动监听命令（使用json_annotation、build_runner、json_serializable库的执行命令）：
flutter packages pub run build_runner watch
打包apk包：
64位-release：
flutter build apk --release --target-platform android-arm64
32位-release：
flutter build apk --release --target-platform android-arm
查看flutter当前版本：flutter channel
切换flutter版本的master：flutter channel master


