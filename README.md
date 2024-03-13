# Media_Booster

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
<p>
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/3a5732cd-5979-44e0-b693-5e28b58d931c" height="50%" width="30%">
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/d89749bf-4a98-484f-8f7d-eb70df301ed5"  height="50%" width="30%">
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/a367e55b-1d1d-41e8-8f6c-2c421b731b02" height="50%" width="30%">
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/03d16549-43d1-433b-8e0c-88421869f7c1"  height="50%" width="30%">
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/04ee3303-2460-4e65-b026-d1f67453ed12"  height="50%" width="30%">l̥
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/b6468e19-42b7-40b9-84a6-48a59cab62ad" height="50%" width="30%">
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/7a3fd27a-4fc6-451f-b8c7-eb5e39ff0a19"  height="50%" width="30%">
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/cd3e5506-28ca-4252-bc40-f7e2759136af" height="50%" width="30%">
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/2573a684-8a18-43fd-bdda-806961d01b7e"  height="50%" width="30%">
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/b9e87e8f-c934-4ec4-814e-b4c7e66b5d6e"  height="50%" width="30%">
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/fe268799-d525-4537-8b5b-ff7235611c5f" height="50%" width="30%">
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/8b0313e9-596a-4b27-b8e2-6d77a7583305"  height="50%" width="30%">
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/3307dc4d-0cf4-4cae-aeb0-b7ccc9237867"  height="50%" width="30%">
   <img src="https://github.com/userravina/Media_Booster/assets/120082785/81938c32-607c-4905-981c-2dd636a4b389"  height="50%" width="30%">
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/5f8c4af5-98c3-472c-b41f-3ace0ed03307" height="50%" width="30%">
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/55fc1cb7-7311-42f2-93ab-c93d3ef32ebf"  height="50%" width="30%">
   <img src="https://github.com/userravina/Media_Booster/assets/120082785/b82954e9-49dc-484f-9fa6-6c548e453d3e"  height="50%" width="30%">
  <img src="https://github.com/userravina/Media_Booster/assets/120082785/0a565d81-af46-4760-be21-32d57767c928"  height="50%" width="30%">
  
<video src = "" height="1150px" width="351px">
    </video>
</p>


gallery_app

import 'package:flutter/cupertino.dart';

class Gallery_Model {

    String? img,name;

    Gallery_Model({this.img,this.name});
}

widgets

import 'dart:io';
import 'package:flutter/material.dart';

class FolderCover extends StatelessWidget {
  final String imagePath;
  final int? imageCount;
  final String folderName;

  const FolderCover(
      {super.key,
        required this.imagePath,
        required this.imageCount,
        required this.folderName});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: const Color.fromARGB(120, 0, 0, 0),
        title: Text(
          folderName,
          style: const TextStyle(color: Colors.white),
          maxLines: 1,
        ),
        subtitle: Text(
          '$imageCount images',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      child: Image.file(
        File(imagePath),
        cacheHeight: 200,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          print(error);
          return Container();
        },
      ),
    );
  }
}

import 'dart:io';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../provider/gallery_provider.dart';

class ImageFiles extends StatelessWidget {
  final String path;
  final int index;
  final Color? backgroundColor;

  final List<String>? folderFiles;

  const ImageFiles(
      {super.key,
      required this.path,
      required this.index,
      this.backgroundColor,
      this.folderFiles});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showImageViewerPager(
          context,
          FilesImageProvider(folderFiles: folderFiles, initialIndex: index),
          useSafeArea: true,
          doubleTapZoomable: true,
          onViewerDismissed: (_) {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: SystemUiOverlay.values);
          },
        );
      },
      child: Column(
        children: [
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.file(
                File(path),
                cacheHeight: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset('assets/placeholder.png'),
              ),
            ),
          ),
          IconButton(onPressed: () {
            // Share.share("${path}");
          }, icon: Icon(Icons.share),)
        ],
      ),
    );
  }
}

screen

import 'dart:convert';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_storage_path/flutter_storage_path.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widgets/folder_cover.dart';
import 'folder_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> imageDirectories = [];
  bool isClickOrder = false;

  @override
  void initState() {
    _requestPermissionGetImageFiles();
    _Requestpermion();
    super.initState();
  }

  Future<Map<String, List<String>>> _pathImageFiles() async {
    SplayTreeMap<String, List<String>> folders =
        SplayTreeMap<String, List<String>>();

    for (var path in imageDirectories) {
      String folderName;
      int removeLast = path.split('/').length;

      folderName = path.split('/').getRange(0, removeLast -1).last;
      folders.putIfAbsent(folderName, () => []);

      folders[folderName]?.add(path);
    }

    return folders;
  }

  Future<void> _Requestpermion() async {
    final PermissionStatus status = await Permission.storage.request();

    if (status == PermissionStatus.granted) {
      // Permission granted. You can now access image files.
    } else {
      // Permission denied.
      print('Permission denied. Could not access image files.');
    }
  }

  //Request for Storage Permission
  Future<void> _requestPermissionGetImageFiles() async {
    //contains images path and folder name in json format
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath!) as List;
    var files = images.map((e) => e['files']).toList();
    imageDirectories = files.expand((element) => element).toList();

    setState(() {}); // refresh after request
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Album'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.grey.shade400,
                      title: const Text(
                        'Project Details',
                        style: TextStyle(color: Colors.black54),
                      ),
                      content: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Project Name: Flutter Gallery\n',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: 'Created by: Daniel Remoquillo',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text(
                            'CLOSE',
                            style: TextStyle(color: Colors.black54),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
            },
            icon: const Icon(
              Icons.info_outline,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF393E46),
                Color.fromARGB(255, 43, 47, 53),
                Color.fromARGB(255, 34, 38, 43),
              ]),
        ),
        child: FutureBuilder<Map<String, List<String>>>(
          future: _pathImageFiles(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const CircularProgressIndicator();
            }
            return CustomScrollView(
              slivers: [
                snapshot.data!.isNotEmpty
                    ? SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            var folderName = snapshot.data!.keys.elementAt(index);
                            print(
                                ' ===================== ${snapshot.data![folderName]![0]}');
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FolderScreen(
                                            storageName: snapshot
                                                .data![folderName]![0]
                                                .split('/')
                                                .elementAt(2),
                                            folderName: folderName,
                                            folderFiles:
                                                snapshot.data![folderName])));
                              },
                              child: FolderCover(
                                imagePath: snapshot.data![folderName]![0],
                                folderName: folderName,
                                imageCount: snapshot.data![folderName]?.length,
                              ),
                            );
                          },
                          childCount: snapshot.data!.length,
                        ),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                MediaQuery.of(context).size.width * 0.6,
                            mainAxisSpacing: 2.0,
                            crossAxisSpacing: 2.0))
                    : const SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            'No Images found.',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../widgets/image_file.dart';

class FolderScreen extends StatelessWidget {
  final String folderName;
  final String storageName;
  String? folderPath;

  final List<String>? folderFiles;

  FolderScreen(
      {super.key,
      required this.folderName,
      required this.folderFiles,
      required this.storageName});

  @override
  Widget build(BuildContext context) {
    folderPath =
        '${folderFiles![0].split('/').getRange(0, folderFiles![0].split('/').length - 2).join('/')}/';
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 4,
            title: Text(
              '$folderName (${folderFiles?.length})',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.grey.shade400,
                            title: const Text(
                              'Folder Info',
                              style: TextStyle(color: Colors.black54),
                            ),
                            content: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Folder name: $folderName \n',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                  TextSpan(
                                    text:
                                        'Image count: ${folderFiles?.length} \n',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                  TextSpan(
                                    text: 'Path: $folderPath',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text(
                                  'CLOSE',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ))
            ],
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ImageFiles(
                path: folderFiles![index],
                index: index,
                backgroundColor: Colors.grey,
                folderFiles: folderFiles,
              );
            }, childCount: folderFiles!.length),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 5.0,
            ),
          ),
        ],
      ),
    );
  }
}

provider

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';


class FilesImageProvider extends EasyImageProvider {
  final List<String>? folderFiles;
  final int initialIndex;

  FilesImageProvider({required this.folderFiles, this.initialIndex = 0});

  @override
  ImageProvider<Object> imageBuilder(BuildContext context, int index) {
    String? localImagePath = folderFiles![index];
    File? imageFile;
    bool isCompatible = true;
    imageFile = File(localImagePath);

//Checks if the following file is compatible to fileimage
    FileImage(imageFile).resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
            (ImageInfo imageInfo, bool synchronousCall) {
          // Do something with the loaded image, such as display it in an `Image` widget
        },
        onError: (dynamic exception, StackTrace? stackTrace) {
          // Handle the error, such as displaying a default image or showing an error message
          isCompatible = false;
        },
      ),
    );

    ImageProvider imageProvider = isCompatible
        ? FileImage(imageFile)
        : const AssetImage('assets/placeholder.png') as ImageProvider;

    return imageProvider;
  }

  @override
  int get imageCount => folderFiles!.length;
}

plugins {
    id "com.android.application"
    id "kotlin-android"
    id "dev.flutter.flutter-gradle-plugin"
}

def localProperties = new Properties()
def localPropertiesFile = rootProject.file('local.properties')
if (localPropertiesFile.exists()) {
    localPropertiesFile.withReader('UTF-8') { reader ->
        localProperties.load(reader)
    }
}

def flutterVersionCode = localProperties.getProperty('flutter.versionCode')
if (flutterVersionCode == null) {
    flutterVersionCode = '1'
}

def flutterVersionName = localProperties.getProperty('flutter.versionName')
if (flutterVersionName == null) {
    flutterVersionName = '1.0'
}

android {
    namespace "com.example.gallary_app"
    compileSdk flutter.compileSdkVersion
    ndkVersion flutter.ndkVersion

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = '1.8'
    }

    sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.example.gallary_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-gradle-build-configuration.
        minSdkVersion flutter.minSdkVersion
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
        multiDexEnabled true
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig signingConfigs.debug
        }
    }
}

flutter {
    source '../..'
}

dependencies {
    implementation 'com.android.support:multidex:1.0.3'

}
apply plugin: 'com.google.gms.google-services'

<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.example_app">
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.INTERNET" />

    <application
        android:requestLegacyExternalStorage="true"
        android:label="gallary_app"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <!-- Specifies an Android theme to apply to this Activity as    soon as
                 the Android process has started. This theme is visible to the user
                 while the Flutter UI initializes. After that, this theme continues
                 to determine the Window background behind the Flutter UI. -->
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <!-- Don't delete the meta-data below.
             This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
        <meta-data
            android:name="com.google.android.gms.ads.APPLICATION_ID"
            android:value="ca-app-pub-3940256099942544~3347511713"/>
        <meta-data
            android:name="applovin.sdk.key"
            android:value="YOUR_APPLOVIN_MAX_SDK_KEY" />
    </application>
    <!-- Required to query activities that can process text, see:
         https://developer.android.com/training/package-visibility?hl=en and
         https://developer.android.com/reference/android/content/Intent#ACTION_PROCESS_TEXT.

         In particular, this is used by the Flutter engine in io.flutter.plugin.text.ProcessTextPlugin. -->
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="sms" />
        </intent>
        <!-- If your app checks for call support -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="tel" />
        </intent>
        <!-- If your application checks for inAppBrowserView launch mode support -->
        <intent>
            <action android:name="android.support.customtabs.action.CustomTabsService" />
        </intent>
    </queries>
</manifest>

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.buildDir = '../build'
subprojects {
    project.buildDir = "${rootProject.buildDir}/${project.name}"
}
subprojects {
    project.evaluationDependsOn(':app')
}

tasks.register("clean", Delete) {
    delete rootProject.buildDir
}
name: gallary_app
description: "A new Flutter project."
# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
  sdk: '>=3.3.0 <4.0.0'

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.6
  provider: ^6.1.2
  sizer: ^2.0.15
  flutter_storage_path: ^1.0.4
  easy_image_viewer: ^1.4.1
  permission_handler: ^11.3.0
  image_picker: ^1.0.7
  http: ^1.2.1
  get: ^4.6.6
  better_player: ^0.0.83
  shared_preferences: ^2.2.2
  google_mobile_ads: ^4.0.0
  applovin_max: ^3.7.0
  firebase_core: any
  firebase_remote_config: ^4.3.8
  firebase_analytics: ^10.8.0
  path_provider: ^2.1.2
  floor: ^1.4.2
  faker: ^2.1.0
  flutter_slidable: ^3.0.1
  easy_audience_network: ^0.0.6
  url_launcher: ^6.2.5
  flutter_custom_tabs: ^2.0.0+1


dev_dependencies:
  flutter_test:
    sdk: flutter
  floor_generator: ^1.4.2
  build_runner: ^2.4.8
  analyzer: ^5.13.0


  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^3.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg
  assets:
    - assets/images/

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/assets-and-images/#resolution-aware

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/assets-and-images/#from-packages

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/custom-fonts/#from-packages


import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gallary_app/model/Custom_Model.dart';
import 'package:gallary_app/model/imogi_model.dart';
import 'package:gallary_app/model/update_time_model.dart';
import 'package:gallary_app/model/version_model.dart';
import 'package:http/http.dart' as http;

class Api_helper {
  static final Api_helper api_helper = Api_helper();

  // gifts api

  Future<ImogiModel> postapi() async {
    String? like = "https://likeme.live/likeme/api/giftList";
    var response = await http.post(Uri.parse(like), headers: {
      "apikey": "123",
      "authtoken":
          "eyJpdiI6ImdGenZlbklDVnMzR1VlWWIyNC9YbGc9PSIsInZhbHVlIjoiTzE4V3ByNC9jelFCMDgwbEpBT0Y1Vkl1cmRpY1E3b205MG84RkljMnpFMFp4Q3doSlJvTzc2aVJZNmNSRStydSIsIm1hYyI6IjUxZTg5ZGM3OTE1ZWU1MWRkNTY0ZjA0YWMxODMzZTRkMmE3YjVkZDYxMDk4OWYxY2E4Nzg3MTFkOWQ1NGQzZWIiLCJ0YWciOiIifQ==",
    });

    var json = jsonDecode(response.body);

    ImogiModel data = ImogiModel.fromJson(json);

    data.data!.sort((a, b) {
      if (a.diamond != b.diamond) {
        return a.diamond!.compareTo(b.diamond!);
      } else {
        return a.images!.compareTo(b.images!);
      }
    });

    return data;
  }

  static String baseUrl = "";
  static String appSecret = "";

  Future<VersionModel> version() async {
    String? like = "https://groworbit.in/testadmin/api/testapp/version";

    var response = await http.post(Uri.parse(like),
        headers: {"app_secret": "wQSLrTQtTJwvU26v"}, body: {"code": "1"});

    var json = jsonDecode(response.body);

    VersionModel data = VersionModel.fromJson(json);

    return data;
  }

  // Custom_Api_Called

  Future<CustomModel> custom_Api() async {
    String? like = "https://groworbit.in/dynamic_admin/d_node_api/video_call_live_streaming_broadcasting_app_chat/api/";

    var headers = {
      "app_secret": "athh@1234",
      "Content-Type": "application/json",
    };

    var body = jsonEncode({
      "event_name": "CustomInApp",
      "islive": "true",
    });

    var responce = await http.post(Uri.parse(like),
        headers: headers,
        body: body);
    debugPrint(like);
    print(responce.headers);
    print(responce.body);


    if (responce.statusCode == 200) {
      var jsonData = jsonDecode(responce.body);
      CustomModel data = CustomModel.fromJson(jsonData);
      return data;

    } else {
      debugPrint("Request failed with status: ${responce.headers}");

      throw Exception("Failed to fetch data");
    }
  }

  // update time api
  Future<UpdateTimeModel> updateAPI()
  async {
    String? linke = "https://groworbit.in/facepikapp/api/facepik/updatetime";

    var response = await http.get(Uri.parse(linke),
        headers: {"app_secret": "wQSLrTQtTJwvU26v"});

    var json = jsonDecode(response.body);

    UpdateTimeModel data = UpdateTimeModel.fromJson(json);
    return data;
  }
}

custom ads

import 'dart:math';

import 'package:gallary_app/model/Custom_Model.dart';
import 'package:gallary_app/utils/api_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class Custom_Controller extends GetxController{

  CustomModel? data;
  RxBool islodin = false.obs;
  Random random = Random();
  RxInt current = 0.obs;
  Future customload() async {

    islodin.value = true;

    await Api_helper.api_helper.custom_Api().then((value) {

      data = value;

      current.value = Random().nextInt(data!.data!.length - 1);
          
      islodin.value = false;
    });
  }

}

// To parse this JSON data, do
//
//     final customModel = customModelFromJson(jsonString);

import 'dart:convert';

CustomModel customModelFromJson(String str) => CustomModel.fromJson(json.decode(str));

String customModelToJson(CustomModel data) => json.encode(data.toJson());

class CustomModel {
  int? code;
  List<Datum>? data;
  String? message;

  CustomModel({
    this.code,
    this.data,
    this.message,
  });

  factory CustomModel.fromJson(Map<String, dynamic> json) => CustomModel(
    code: json["code"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  String? id;
  String? addTitle;
  String? addDesc;
  List<AdvertisementCustomMulti>? advertisementCustomMulti;
  String? icon;
  String? banner;
  String? install;
  String? color;
  String? rating;
  String? download;
  String? review;
  int? enable;
  DateTime? date;
  int? isAppstore;

  Datum({
    this.id,
    this.addTitle,
    this.addDesc,
    this.advertisementCustomMulti,
    this.icon,
    this.banner,
    this.install,
    this.color,
    this.rating,
    this.download,
    this.review,
    this.enable,
    this.date,
    this.isAppstore,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    addTitle: json["add_title"],
    addDesc: json["add_desc"],
    advertisementCustomMulti: json["advertisement_custom_multi"] == null ? [] : List<AdvertisementCustomMulti>.from(json["advertisement_custom_multi"]!.map((x) => AdvertisementCustomMulti.fromJson(x))),
    icon: json["icon"],
    banner: json["banner"],
    install: json["install"],
    color: json["color"],
    rating: json["rating"],
    download: json["download"],
    review: json["review"],
    enable: json["enable"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    isAppstore: json["is_appstore"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "add_title": addTitle,
    "add_desc": addDesc,
    "advertisement_custom_multi": advertisementCustomMulti == null ? [] : List<dynamic>.from(advertisementCustomMulti!.map((x) => x.toJson())),
    "icon": icon,
    "banner": banner,
    "install": install,
    "color": color,
    "rating": rating,
    "download": download,
    "review": review,
    "enable": enable,
    "date": date?.toIso8601String(),
    "is_appstore": isAppstore,
  };
}

class AdvertisementCustomMulti {
  String? icon;
  String? banner;
  String? acid;
  String? color;
  String? adTag;
  String? designPage;
  int? enable;
  DateTime? date;

  AdvertisementCustomMulti({
    this.icon,
    this.banner,
    this.acid,
    this.color,
    this.adTag,
    this.designPage,
    this.enable,
    this.date,
  });

  factory AdvertisementCustomMulti.fromJson(Map<String, dynamic> json) => AdvertisementCustomMulti(
    icon: json["icon"],
    banner: json["banner"],
    acid: json["acid"],
    color: json["color"],
    adTag: json["ad_tag"],
    designPage: json["design_page"],
    enable: json["enable"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
    "banner": banner,
    "acid": acid,
    "color": color,
    "ad_tag": adTag,
    "design_page": designPage,
    "enable": enable,
    "date": date?.toIso8601String(),
  };
}
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:gallary_app/controller/custom_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

import '../../controller/instal_controller.dart';
import '../../controller/version_controller.dart';
import '../../utils/ads_helper.dart';

class Custom_Ads extends StatefulWidget {
  const Custom_Ads({super.key});

  @override
  State<Custom_Ads> createState() => _Custom_AdsState();
}

class _Custom_AdsState extends State<Custom_Ads> {
  Custom_Controller controller = Get.put(Custom_Controller());
  Version_Controller vcontroller = Get.put(Version_Controller());
  InstalController installController = Get.put(InstalController());

  @override
  void initState() {
    vcontroller.versionload();
    controller.customload();
    super.initState();
  }

  void countTotal() {
    vcontroller.count++;
    debugPrint("========== count plus ===================${vcontroller.count}");

    Navigator.pushNamed(context, 'add');

    if (vcontroller.totalCount == vcontroller.count) {
     if(Ads_helper.ads_helper.intertital == false)
       {
         Ads_helper.ads_helper.interstitialAd!.show();
         Ads_helper.ads_helper.loadInterstitialAd();
       }
     else{
       Navigator.pushNamed(context, 'inter');
     }
    }

    if (vcontroller.count == 5) {
      vcontroller.count.value = 0;
    }
  }

  Future<void> _launchUrl(BuildContext context) async {
    final theme = Theme.of(context);
    try {
      await launchUrl(
        Uri.parse(
            '${controller.data!.data![controller.current.value].install}'),
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
            navigationBarColor: theme.colorScheme.background,
          ),
          shareState: CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: true,
        ),
        safariVCOptions: SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.islodin.value
              ? Center(child: CircularProgressIndicator())
              : vcontroller.alternative == true
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Ads_helper.ads_helper.banner == false
                            ? Container(
                                height: 80,
                                child: AdWidget(
                                  ad: Ads_helper.ads_helper.bannerAd!,
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Spacer(),
                                  Container(
                                    height: 7.5.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://www.groworbit.in/dynamic_admin/images/AD_/${controller.data!.data![controller.current.value].icon}"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${controller.data!.data![controller.current.value].addTitle}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                        width: 55.w,
                                        child: Text(
                                          "${controller.data!.data![controller.current.value].addDesc}",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 4.h,
                                    width: 15.w,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: InkWell(
                                      onTap: () async {
                                        await _launchUrl(context);
                                      },
                                      child: Center(
                                          child: Text(
                                        "Install",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                        SizedBox(
                          height: 7.h,
                        ),
                        installController.native == false
                            ? Obx(
                                () => installController.isLoading == false
                                    ? Container(
                                        height: 340,
                                        child: AdWidget(
                                          ad: installController.nativeAd!,
                                        ),
                                      )
                                    : Container(),
                              )
                            : Container(
                                height: 40.h,
                                width: 90.w,
                                decoration:
                                    BoxDecoration(color: Colors.black12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 20.h,
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://www.groworbit.in/dynamic_admin/images/AD_/${controller.data!.data![controller.current.value].banner}"),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        ClipOval(
                                          child: Image.network(
                                            "https://www.groworbit.in/dynamic_admin/images/AD_/${controller.data!.data![controller.current.value].icon}",
                                            fit: BoxFit.fill,
                                            height: 7.h,
                                            width: 15.w,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${controller.data!.data![controller.current.value].addTitle}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                              width: 55.w,
                                              child: Text(
                                                "${controller.data!.data![controller.current.value].addDesc}",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 5.h,
                                          width: 80.w,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: InkWell(
                                            onTap: () async {
                                              await _launchUrl(context);
                                            },
                                            child: Center(
                                              child: Text(
                                                "Install",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer()
                                  ],
                                ),
                              ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.black)),
                                onPressed: () {
                                  countTotal();
                                },
                                child: Text(
                                  "Interstitial",
                                  style: TextStyle(color: Colors.white),
                                )),
                            Spacer(),
                            TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.black)),
                                onPressed: () {
                                  countTotal();
                                },
                                child: Text(
                                  "Interstitial",
                                  style: TextStyle(color: Colors.white),
                                )),
                            Spacer(),
                            TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.black)),
                                onPressed: () {
                                  countTotal();
                                },
                                child: Text(
                                  "Interstitial",
                                  style: TextStyle(color: Colors.white),
                                )),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.black)),
                                onPressed: () {
                                  countTotal();
                                },
                                child: Text(
                                  "Interstitial",
                                  style: TextStyle(color: Colors.white),
                                )),
                            Spacer(),
                            TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.black)),
                                onPressed: () {
                                  countTotal();
                                  // Navigator.pushNamed(context, 'inter');
                                },
                                child: Text(
                                  "Interstitial",
                                  style: TextStyle(color: Colors.white),
                                )),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            onPressed: () {
                              if(Ads_helper.ads_helper.openApp == false)
                                {
                                  Ads_helper.ads_helper.appOpenAd!.show();
                                  Ads_helper.ads_helper.loadAppOpenAd();
                                }
                             else{
                                Navigator.pushNamed(context, 'open');
                              }
                            },
                            child: Text(
                              "App Open",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    )
                  : Container(),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../controller/custom_controller.dart';

class Intertital_Custom extends StatefulWidget {
  const Intertital_Custom({super.key});

  @override
  State<Intertital_Custom> createState() => _Intertital_CustomState();
}

class _Intertital_CustomState extends State<Intertital_Custom> {
  Custom_Controller controller = Get.put(Custom_Controller());

  Future<void> _launchUrl(BuildContext context) async {
    final theme = Theme.of(context);
    try {
      await launchUrl(
        Uri.parse(
            '${controller.data!.data![controller.current.value].install}'),
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
            navigationBarColor: theme.colorScheme.background,
          ),
          shareState: CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: true,
        ),
        safariVCOptions: SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: InkWell(
            onTap: () {
              _launchUrl(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 4.h,
                      width: 8.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Icon(
                            Icons.clear,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://www.groworbit.in/dynamic_admin/images/AD_/${controller.data!.data![controller.current.value].banner}"),
                            fit: BoxFit.contain),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 7.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.groworbit.in/dynamic_admin/images/AD_/${controller.data!.data![controller.current.value].icon}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.data!.data![controller.current.value].addTitle}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            SizedBox(
                              height: 5.h,
                              width: 60.w,
                              child: Text(
                                "${controller.data!.data![controller.current.value].addDesc}",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${controller.data!.data![controller.current.value].rating}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              letterSpacing: 0.2,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "rating",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              letterSpacing: 0.2,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${controller.data!.data![controller.current.value].download}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "download",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${controller.data!.data![controller.current.value].review!.toLowerCase().replaceAll("reviews", "")}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "review",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 7.h,
                ),
                Container(
                  height: 5.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () async {
                      await _launchUrl(context);
                    },
                    child: Center(
                      child: Text(
                        "Install",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../controller/custom_controller.dart';

class OpenApp_Custom extends StatefulWidget {
  const OpenApp_Custom({super.key});

  @override
  State<OpenApp_Custom> createState() => _OpenApp_CustomState();
}

class _OpenApp_CustomState extends State<OpenApp_Custom> {
  Custom_Controller controller = Get.put(Custom_Controller());

  Future<void> _launchUrl(BuildContext context) async {
    final theme = Theme.of(context);
    try {
      await launchUrl(
        Uri.parse(
            '${controller.data!.data![controller.current.value].install}'),
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
            navigationBarColor: theme.colorScheme.background,
          ),
          shareState: CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: true,
        ),
        safariVCOptions: SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.4),
        body: Column(
          children: [
            SizedBox(height: 4.h,),
            Row(
              children: [
                Container(
                  height: 13.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 6.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    "${controller.data!.data![controller.current.value].addTitle}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Icon(
                                          Icons.clear,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h,),
            InkWell(
              onTap: () async {
                await _launchUrl(context);
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 2.h,),
                    Text(
                      "${controller.data!.data![controller.current.value].addTitle}",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Container(
                      height: 20.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://www.groworbit.in/dynamic_admin/images/AD_/${controller.data!.data![controller.current.value].icon}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 85.w,
                      child: Text(
                        "${controller.data!.data![controller.current.value].addDesc}",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 18.w,
                        ),
                        Text(
                          "${controller.data!.data![controller.current.value].rating}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              letterSpacing: 0.2,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        Text(
                          "${controller.data!.data![controller.current.value].download}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 23.w,
                        ),
                        Text(
                          "${controller.data!.data![controller.current.value].review!.toLowerCase().replaceAll("reviews", "")}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${controller.data!.data![controller.current.value].rating}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  letterSpacing: 0.2,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "rating",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  letterSpacing: 0.2,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${controller.data!.data![controller.current.value].download}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "download",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${controller.data!.data![controller.current.value].review!.toLowerCase().replaceAll("reviews", "")}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "review",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Container(
                      height: 5.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () async {
                          await _launchUrl(context);
                        },
                        child: Center(
                          child: Text(
                            "Install",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.7.h,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:gallary_app/utils/ads_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';

import '../../controller/instal_controller.dart';
import '../../controller/version_controller.dart';

class add_Screen extends StatefulWidget {
  const add_Screen({super.key});

  @override
  State<add_Screen> createState() => _add_ScreenState();
}

class _add_ScreenState extends State<add_Screen> {
  InstalController installController = Get.put(InstalController());

  Version_Controller vcontroller = Get.put(Version_Controller());
  @override
  void initState() {
    Ads_helper.ads_helper.loadBannerAd();
    Ads_helper.ads_helper.loadInterstitialAd();
    installController.loadNativeAd();
    Ads_helper.ads_helper.loadRewardAd();
    super.initState();
  }
  void countTotal()
  {
    vcontroller.count++;
    debugPrint("========== count plus ===================${vcontroller.count}");

    Navigator.pop(context);

    if (vcontroller.totalCount == vcontroller.count) {
      if(Ads_helper.ads_helper.intertital == false)
      {
        Ads_helper.ads_helper.interstitialAd!.show();
        Ads_helper.ads_helper.loadInterstitialAd();
      }
      else{
        Navigator.pushNamed(context, 'inter');
      }
    }

    if(vcontroller.count == 5)
    {
      vcontroller.count.value = 0;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(foregroundColor: Colors.white,
          leading: IconButton(onPressed: () {
            countTotal();
          },icon: Icon(Icons.arrow_back,color: Colors.white,),),
          title: Text(
            "Ads Screen",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "====== Google Ads ======",
                style: TextStyle(color: Colors.black),
              ),
              Container(
                height: 170,
                child: AdWidget(
                  ad: Ads_helper.ads_helper.bannerAd!,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Ads_helper.ads_helper.interstitialAd!.show();
                  Ads_helper.ads_helper.loadInterstitialAd();
                },
                child: Text(
                  "Interstitial Ads",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    Ads_helper.ads_helper.rewardedAd!.show(
                      onUserEarnedReward: (ad, reward) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("$reward"),
                          ),
                        );
                      },
                    );
                    Ads_helper.ads_helper.loadRewardAd();
                  },
                  child: Text(
                    "Reward Ads",
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => installController.isLoading.value == false
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        onPressed: () {
                          installController.loadNativeAd();
                        },
                        child: Text(
                          "NativeAd",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : Container(),
              ),
              Text(
                "=========== AppLovin ===========",
                style: TextStyle(color: Colors.black),
              ),
              // Container(
              //   height: 170,
              //   child: AdWidget(
              //     ad: Ads_helper.ads_helper.bannerAd!,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallary_app/controller/update_controller.dart';
import 'package:gallary_app/controller/version_controller.dart';
import 'package:gallary_app/utils/api_helper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/update_time_model.dart';

class UpdateTime_Screen extends StatefulWidget {
  const UpdateTime_Screen({super.key});

  @override
  State<UpdateTime_Screen> createState() => _UpdateTime_ScreenState();
}

class _UpdateTime_ScreenState extends State<UpdateTime_Screen> {
  Update_Controller controller = Get.put(Update_Controller());
  Version_Controller vcontroller = Get.put(Version_Controller());
  UpdateTimeModel? data;
  String? jsonData;
  Future<void> fetchAndUpdateData() async {
    //try {
      // Fetch data from the API

      controller.data = await Api_helper.api_helper.updateAPI();

      // Save fetched data to shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();

       jsonData = prefs.getString('updateTimeData');

    if(jsonData == null)
      {
        // print('================== same =======================');
        vcontroller.versionload();

        await prefs.setString('updateTimeData', updateTimeModelToJson(controller.data!));
      }
    else
      {
         data = updateTimeModelFromJson(jsonData!);
        if(data!.data![0].updatedAt == controller.data!.data![0].updatedAt)
          {
             print('================== same =======================');
          }
        else
          {
            print('================== called api =======================');
            vcontroller.versionload();
          }
      }
      controller.islodin.value = false;

  }

  @override
  void initState() {
    fetchAndUpdateData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.islodin.value
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text("${controller.data!.data![index].category}")
                            ],
                          );
                        },
                        itemCount: controller.data!.data!.length,
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallary_app/databse.dart';
import 'package:gallary_app/screen/view/add_screen.dart';
import 'package:gallary_app/screen/view/custom_ads.dart';
import 'package:gallary_app/screen/view/custom_intertitial.dart';
import 'package:gallary_app/screen/view/custom_openapp.dart';
import 'package:gallary_app/screen/view/updatetime_screen.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();


  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          routes:{
             // '/': (p0) => Splash_Screen(),
             // 'version': (p0) => Version_Scren(versionModelDao: versionModelDao),

             // '/': (p0) => Custom_Ads(),
             // 'inter': (p0) => Intertital_Custom(),
             // 'open': (p0) => OpenApp_Custom(),
             // 'add': (p0) => add_Screen(),

            '/':(p0) => UpdateTime_Screen(),

            // '/':(p0) => Floor_Screen(dao: dao, title: 'Employee',),
            // 'floor_add':(p0) => Floor_Add_Screen(dao: dao, title: 'Employee',),
          },
        );
      },
    ),
  );
}

flore database


controller
// import 'package:get/get.dart';
//
// import '../entity/employee.dart';
//
// class Floor_Controller extends GetxController{
//
//   RxList listEmployee =<Employee>[].obs;
// }

dao
import 'dart:async';
import 'package:floor/floor.dart';
import '../../model/version_model.dart';

@dao
abstract class VersionModelDao {

  @Query('SELECT * FROM AdChield')
  Future<List<AdChield>> getAllVersions();

  @insert
  Future<void> insertVersionModel(AdChield versionModel);

  @Query('DELETE FROM AdChield')
  Future<void> deleteVersionModel();

}
entity

//
// import 'package:floor/floor.dart';
// @entity
// class Employee
// {
//   @PrimaryKey(autoGenerate: true)
//   final int? id;
//
//   String? firstName,lastName,email;
//
//   Employee({this.id,this.email, this.lastName, this.firstName});
// }

database
import 'package:floor/floor.dart';
import 'package:gallary_app/flore_databse/dao/databaseDAO.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'model/version_model.dart';
part 'databse.g.dart';

@Database(version: 1, entities: [AdChield])
abstract class FlutterDatabase extends FloorDatabase {
  VersionModelDao get versionmodeldao;
}

view
import 'package:floor/floor.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../dao/databaseDAO.dart';
import '../entity/employee.dart';

class Floor_Add_Screen extends StatefulWidget {
  // final EmployeeDAO dao;
  final String title;
  const Floor_Add_Screen({Key? key, required this.title}) :  super(key: key);

  @override
  State<Floor_Add_Screen> createState() => _Floor_Add_ScreenState();
}

class _Floor_Add_ScreenState extends State<Floor_Add_Screen> {
  TextEditingController f_name = TextEditingController();
  TextEditingController l_name = TextEditingController();
  TextEditingController u_name = TextEditingController();
  TextEditingController email = TextEditingController();
  final fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Form(
      key: fromkey,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Add Data",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter First Name';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: f_name,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "First Name",
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Last Name';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: l_name,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Last Name",
                  hintStyle: const TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color:Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text,
                controller: email,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Email ID",
                  hintStyle: const TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color:Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Email";
                  }
                  RegExp emailregex =
                  RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                  if (!emailregex.hasMatch(value)) {
                    return "Please Enter Valid Email";
                  }
                  return null;
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black),
                onPressed: () async {
                  //  Navigator.pushNamed(context, 'login');
                },
                child: TextButton(
                  onPressed: () async {
                    if (fromkey.currentState!.validate()) {

                      // final employee = Employee(
                      //   firstName: f_name.text,
                      //   lastName: l_name.text,
                      //   email: email.text,
                      // );

                      // await widget.dao.insertEmployee(employee);

                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "add_employee",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    ),));
  }
}
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:gallary_app/flore_databse/controller/floor_controller.dart';
import 'package:gallary_app/flore_databse/dao/databaseDAO.dart';
import 'package:gallary_app/flore_databse/entity/employee.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class Floor_Screen extends StatefulWidget {
  // final EmployeeDAO dao;
  final String title;

  Floor_Screen({Key? key, required this.title,})
      : super(key: key);

  @override
  State<Floor_Screen> createState() => _Floor_ScreenState();
}

class _Floor_ScreenState extends State<Floor_Screen> {
  @override
  Widget build(BuildContext context) {
    // Floor_Controller controller = Get.put(Floor_Controller());
    final GlobalKey<ScaffoldState> scaffouldkey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () async {
                  Navigator.pushNamed(context, 'floor_add');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('A SnackBar has been shown.'),
                    ),
                  );
                },
                icon: Icon(Icons.add)),
            IconButton(
                onPressed: () async {
                  // widget.dao.deleteAllEmployee();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Clear Success'),
                    ),
                  );
                },
                icon: Icon(Icons.clear))
          ],
        ),
        // body: StreamBuilder(
        //   builder: (context, snapshot) {
        //     if (snapshot.hasError) {
        //       return Center(
        //         child: Text("${snapshot.error}"),
        //       );
        //     } else if (snapshot.hasData) {
        //       // controller.listEmployee.value = snapshot.data!;
        //       // return ListView.builder(
        //       //   itemBuilder: (context, index) {
        //       //     return Slidable(
        //       //       key: const ValueKey(0),
        //       //       child: ListTile(
        //       //         title: Text(
        //       //             "${controller.listEmployee![index].firstName} ${controller.listEmployee![index].lastName}"),
        //       //         subtitle: Text("${controller.listEmployee[index].email}"),
        //       //       ),
        //       //       startActionPane: ActionPane(
        //       //         motion: const ScrollMotion(),
        //       //         children: [
        //       //           SlidableAction(
        //       //             onPressed: (context) async {
        //       //               final deleteEmployee =
        //       //                   controller.listEmployee[index];
        //       //
        //       //               await widget.dao.deleteEmployee(deleteEmployee);
        //       //             },
        //       //             backgroundColor: Color(0xFFFE4A49),
        //       //             foregroundColor: Colors.white,
        //       //             icon: Icons.delete,
        //       //             label: 'Delete',
        //       //           ),
        //       //           SlidableAction(
        //       //             onPressed: (context) async {
        //       //               final updateEmployee =
        //       //                   controller.listEmployee[index];
        //       //
        //       //               Navigator.pushNamed(context, 'update',
        //       //                   arguments: controller.listEmployee[index]);
        //       //               updateEmployee.firstName =
        //       //                   Faker().person.firstName();
        //       //               updateEmployee.lastName = Faker().person.lastName();
        //       //               updateEmployee.email = Faker().internet.email();
        //       //
        //       //               await widget.dao.updateEmployee(updateEmployee);
        //       //             },
        //       //             backgroundColor: Color(0xFF21B7CA),
        //       //             foregroundColor: Colors.white,
        //       //             icon: Icons.update,
        //       //             label: 'update',
        //       //           ),
        //       //         ],
        //       //       ),
        //       //     );
        //       //   },
        //       //   itemCount: controller.listEmployee != null
        //       //       ? controller.listEmployee.length
        //       //       : 0,
        //       // );
        //     }
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   },
        //   // stream: widget.dao.getAllEmployee(),
        // ),
      ),
    );
  }
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'databse.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorFlutterDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder databaseBuilder(String name) =>
      _$FlutterDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FlutterDatabaseBuilder(null);
}

class _$FlutterDatabaseBuilder {
  _$FlutterDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FlutterDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FlutterDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FlutterDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FlutterDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FlutterDatabase extends FlutterDatabase {
  _$FlutterDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  VersionModelDao? _versionmodeldaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AdChield` (`sId` INTEGER PRIMARY KEY AUTOINCREMENT, `id` TEXT, `adToken` TEXT, `adKeyword` TEXT, `enable` INTEGER, `versionAdMastersId` TEXT, `versionId` INTEGER, `tag` TEXT, `adname` TEXT, `count` INTEGER, `admaenable` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  VersionModelDao get versionmodeldao {
    return _versionmodeldaoInstance ??=
        _$VersionModelDao(database, changeListener);
  }
}

class _$VersionModelDao extends VersionModelDao {
  _$VersionModelDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _adChieldInsertionAdapter = InsertionAdapter(
            database,
            'AdChield',
            (AdChield item) => <String, Object?>{
                  'sId': item.sId,
                  'id': item.id,
                  'adToken': item.adToken,
                  'adKeyword': item.adKeyword,
                  'enable': item.enable,
                  'versionAdMastersId': item.versionAdMastersId,
                  'versionId': item.versionId?.index,
                  'tag': item.tag,
                  'adname': item.adname,
                  'count': item.count,
                  'admaenable': item.admaenable
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AdChield> _adChieldInsertionAdapter;

  @override
  Future<List<AdChield>> getAllVersions() async {
    return _queryAdapter.queryList('SELECT * FROM AdChield',
        mapper: (Map<String, Object?> row) => AdChield(
            id: row['id'] as String?,
            adToken: row['adToken'] as String?,
            adKeyword: row['adKeyword'] as String?,
            enable: row['enable'] as int?,
            versionAdMastersId: row['versionAdMastersId'] as String?,
            versionId: row['versionId'] == null
                ? null
                : Id.values[row['versionId'] as int],
            tag: row['tag'] as String?,
            admaenable: row['admaenable'] as int?,
            adname: row['adname'] as String?,
            count: row['count'] as int?));
  }

  @override
  Future<void> deleteVersionModel() async {
    await _queryAdapter.queryNoReturn('DELETE FROM AdChield');
  }

  @override
  Future<void> insertVersionModel(AdChield versionModel) async {
    await _adChieldInsertionAdapter.insert(
        versionModel, OnConflictStrategy.abort);
  }
}







