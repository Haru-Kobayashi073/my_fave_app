# my_fave_app

## 環境構築

*1. fvmの適用*
```
fvm use 3.16.0
```

*2. pub get*
```
fvm flutter pub get
```

*3. firebaseの設定*
```
flutterfire configure
```


- 該当プロジェクトを選択する
- Which platforms should your configuration support (use arrow keys & space to select)?
と聞かれたら、iosかandroidを選択する

*4. ビルドして完了*

## 作者の環境
```
fvm flutter doctor -v
[✓] Flutter (Channel stable, 3.16.0, on macOS 14.0 23A344 darwin-arm64, locale ja-JP)
    • Flutter version 3.16.0 on channel stable at /Users/kobayashiharu/fvm/versions/3.16.0
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision db7ef5bf9f (11 days ago), 2023-11-15 11:25:44 -0800
    • Engine revision 74d16627b9
    • Dart version 3.2.0
    • DevTools version 2.28.2

[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
    • Android SDK at /Users/kobayashiharu/Library/Android/sdk
    • Platform android-34, build-tools 33.0.0
    • Java binary at: /Applications/Android Studio 2.app/Contents/jbr/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build 17.0.6+0-17.0.6b829.9-10027231)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 15.0)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Build 15A240d
    • CocoaPods version 1.13.0

[✓] Chrome - develop for the web
    • Chrome at /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

[✓] Android Studio (version 2021.2)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 11.0.12+0-b1504.28-7817840)

[✓] Android Studio (version 2022.3)
    • Android Studio at /Applications/Android Studio 2.app/Contents
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 17.0.6+0-17.0.6b829.9-10027231)

[✓] VS Code (version 1.84.2)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.76.0

[✓] Network resources
    • All expected network resources are available.

• No issues found!
```