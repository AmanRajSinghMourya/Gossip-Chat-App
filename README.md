
## Gossip-Chat-App

This is a flutter based modern messaging app where users can sign up and log in to chat with their friends, family, colleagues among groups with enriched User-Experience.

It uses Firebase Cloud Firestore as well as the Firebase authentication package which equips this app with a cloud-based NoSQL database and secure authentication methods.

One of the first simple apps I created while on my journey to learn flutter.
## Note

This repository is still under development and I will continue to add new updates to it.
## Features

1. 1-1 chat.
2. Share Pic with Gallery/Camera
3. Firebase authentication with email verification for secure sign-ins.
4. Real-time messaging using Firebase Realtime Database for instant message delivery.
5. Firebase Storage integration for sharing images.
6. Supports both Android and iOS platforms.
## Future Scope
1. Notification
2. Group Chat
3. User acceptance on chat request
4. share location on chat
## Firebase Setup Instructions

1. Clone the repository to your local machine
2. Set up Firebase:

+ Create a new Firebase project in the [Firebase Console](https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwij8vuj6vqEAxV6ploFHRe3DeYYABAAGgJ2dQ&ase=2&gclid=Cj0KCQjwqdqvBhCPARIsANrmZhNxiIVvm0mR3qdcnxP0wATr4ANgS3FnnX5ADRCTCwckpeqj9iO8tlEaAirSEALw_wcB&ei=P6P2ZevLK4DjseMPycCxuAw&ohost=www.google.com&cid=CAESVeD2fIqJnog99560b2cycb6quZZyV9NgmhyzT-iR9nhlIYeR9xwtnqxJIibnhIkp_JmZ4qqmaqQFihCd3vGqZdd-LZauKBrSrU2IxaIoYyhr47pdxH0&sig=AOD64_0mABBJQBaRVkRWp0hY0CQ-S9vbKw&q&sqi=2&nis=4&adurl&ved=2ahUKEwir5-uj6vqEAxWAcWwGHUlgDMcQ0Qx6BAgJEAE).

+ Enable Firebase Authentication with email-password verification, Firebase Realtime Database, and Firebase Storage for your project.

+ Download the google-services.json file from Firebase and place it in the android/app/ directory of this Flutter project.

+ Install Flutter: Ensure you have Flutter installed on your machine. If not, follow the instructions on the official [Flutter website](https://docs.flutter.dev/get-started/install/windows/desktop) to set it up.

+ Get Dependencies: Run the following command in the project directory to fetch all the required dependencies:

+ Connect to Firebase: Open the android/app/build.gradle file and ensure that the Firebase dependencies and configuration are correctly set up.

+ Run the App: Connect a physical device or use an emulator, then run the app using the following command in your code editor terminal:
```bash
    flutter run
```

+ Test the App: Verify that Firebase authentication, real-time database, and image storage are working as intended. Test the app's functionalities by sending and receiving messages and images.
## Dependencies
The following packages were used to develop this app:

[firebase_core](https://pub.dev/packages/firebase_core): Provides Firebase core functionality and initialization for Flutter apps.

[firebase_auth](https://pub.dev/packages/firebase_auth): A Flutter plugin to use Firebase Authentication, enabling easy user authentication.

[cloud_firestore](https://pub.dev/packages/cloud_firestore): A Flutter plugin to use Firebase Cloud Firestore, a NoSQL cloud database for storing and syncing data.

[image_picker](https://pub.dev/packages/image_picker): Allows users to pick images and videos from the device's gallery or camera.

[firebase_storage](https://pub.dev/packages/firebase_storage):  A Flutter plugin to use Firebase Cloud Storage, which allows uploading and downloading files.

[flutter_svg](https://pub.dev/packages/flutter_svg): An SVG rendering and widget library for Flutter, which allows painting and displaying Scalable Vector Graphics.

[slide_to_act](https://pub.dev/packages/slide_to_act/versions): A simple slide-to-action widget for Flutter. It's really customizable and it adapts to your theme. 

[uuid](https://pub.dev/packages/uuid): Generate unique Id for user.

[intl](https://pub.dev/packages/intl): Provides internationalization and localization support for Flutter apps.

[cached_network_image](https://pub.dev/packages/cached_network_image): Caches network images to improve performance when loading images from the internet.

[get](https://pub.dev/packages/get): A state management library for Flutter that simplifies the process of managing app states.

## State Management
GetX

Benefits of using GETX route management
1. Named routes: GETX uses named routes, which makes it easier to navigate between screens and manage your routing logic.

2. Simplicity: GETX route management is very easy to use. You can define your routes in a single routes list and navigate between them using the Get.to() or Get.toNamed() methods.

3. Performance: GETX route management is very performant. It is built on top of the Flutter navigation system, so it is as fast and efficient as possible.
## Clone the repository
```bash
 git clone https://github.com/AmanRajSinghMourya/Gossip-Chat-App
```
Move to the desired folder
```bash
 cd Gossip
```
To run the app, simply write
```bash
 flutter run
```
## How to make Pull request
1. Fork [this](https://github.com/AmanRajSinghMourya/Gossip-Chat-App) repository.

2. Clone the forked repository.
```bash
  https://github.com/AmanRajSinghMourya/Gossip-Chat-App
```
3. Navigate to the project directory.
```bash
  cd  Gossip
```
4. Checkout from master to development branch.
```bash
  git checkout development
```
4. Checkout from master to development branch.
```bash
  git checkout development
```
5. Make changes in source code.

6. Commit your changes.
```bash
  git add .
  git commit -m "<your_commit_message>"
```
7. Push your local branch to the remote repository.  
```bash
  git push -u origin development
```
8. Create a Pull Request!
## Contact

[LinkedIn](https://www.linkedin.com/in/aman-raj-singh-mourya-3140ab279?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app)

[Email](https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox)