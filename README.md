# manga_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Run this command to generate HIVE adapters
flutter pub run build_runner build --delete-conflicting-outputs


# Code Coverage

Generate lconv.info
``` 
./run_tests.sh
```

Generate html
```
./run_tests.sh --report
```

##Run the generator #
#Use the [watch] flag to watch the files system for edits and rebuild as necessary.

```
flutter packages pub run build_runner watch
```

# if you want the generator to run one time and exits use

```
flutter packages pub run build_runner build
```

# Run on Web
flutter run -d chrome