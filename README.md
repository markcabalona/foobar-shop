# FooBar - Shop

This is a dummy e-commerce application

## App Demo - Android
 You can get the latest apk build [here](https://drive.google.com/drive/folders/1-52cGFZv6EDxBtFjwhHGKt8GQ_q6Jdcl?usp=share_link)

# Run the app in your machine

## Getting Started

## Requirements
- Flutter SDK:  >=3.7.3 (Dart SDK: >=2.19.2) 

### Clone this repository
```
git clone https://github.com/markcabalona/foobar-shop.git
```
- go into the app's root directory
```
cd foobar-shop
```
## Install dependencies
```
flutter pub get
```
## Run the app
- Use `--release`, and `--profile` flags to run in release, and profile modes respectively
#### To run this app
```
flutter run -d <your_device>
```

## Build the app for release
- Use `--release`, and `--profile` flags to build in release, and profile modes
#### To build this app:
```
flutter build <target-platform> --obfuscate --split-debug-info=build/app/outputs/symbols
```