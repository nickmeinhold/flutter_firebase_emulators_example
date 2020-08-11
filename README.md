# flutter_firebase_emulators_example

A simple app to document setting up and using the firebase emulator suite with a Flutter app.

Github Repo: [nickmeinhold/flutter_firebase_emulators_example](https://github.com/nickmeinhold/flutter_firebase_emulators_example)

Firebase Project: [firebase-emulators-flutter](https://console.firebase.google.com/u/0/project/fir-emulators-flutter/overview)

## Quickstart to run this repo 


1. `flutter pub get` 
1. get depencies for /functions and transpile typescript 
   1. `cd functions` 
   1. `npm install` 
   1. `npm run build` 
   1. `cd ..` 

## Relevant References 

- [Introduction to Firebase Local Emulator Suite](https://firebase.google.com/docs/emulator-suite) 
- [The Firebase Blog: Say hello to the helpful Firebase Emulator - a local first UI to boost your productivity](https://firebase.googleblog.com/2020/05/local-firebase-emulator-ui.html) 
- [Prototype Locally With Flutter and Firebase | by Jackson Zhou | Better Programming | Medium](https://medium.com/better-programming/prototype-locally-with-flutter-and-firebase-db8907222bea) 

## Steps 

### [Create a new firebase project](https://console.firebase.google.com/u/0/)

1. Select "New Project" and follow the prompts 
1. Create [database](https://console.firebase.google.com/u/0/project/fir-emulators-flutter/database)
   1. Choose "Start in production mode" (or whatever you prefer)
   1. Choose "nam5 (us-central)" (or whatever you prefer)

### [Connect the app to the firebase project](https://firebase.google.com/docs/emulator-suite/connect_and_prototype)
1. [install the CLI](https://firebase.google.com/docs/cli#install_the_firebase_cli) or [update to its latest version](https://firebase.google.com/docs/cli#update-cli).
1. initialize the current working directory as a Firebase project, following the onscreen prompts to specify you're using Cloud Functions and Cloud Firestore 
   1. ```firebase init```
   1. select Firestore 
   1. hit Enter to accept the defaults 
   1. ```firebase init```
   1. select Functions 
   1. select "Typescript" (or whatever you prefer)
   1. hit Enter to accept the defaults 

### Test the emulators 

1. Add the "makeUppercase" cloud function from the docs ([here](https://firebase.google.com/docs/emulator-suite/connect_and_prototype#prototype_interactively)) 
1. (if using typescript) Transpile to javascript by running `npm run build` from the `functions` directory
1. Launch the Local Emulator Suite with `firebase emulators:start`
1. View the UI in your browser at `http://localhost:4000` 
1. Check that the firestore and functions emulators are working 
   1. On the Firestore tab, click Start collection
   1. Create a new document in a messages collection 
   1. Use fieldname "original" and value "test". 
   1. Observe the cloud function was triggered and a new uppercase field appears

### Connect the app to the firestore emulator 

> :warning: **Update the firestore rules to allow access** but be careful if you deploy the live database!

1. Add firestore to the flutter app, see: [cloud_firestore | Flutter Package](https://pub.dev/packages/cloud_firestore)
   1. add `cloud_firestore:` to dependencies in `pubspec.yaml`) 
   1. Android 
      1. download the generated `google-services.json` file and place it inside `android/app` 
      1. Modify the `android/build.gradle` file and the `android/app/build.gradle` file to add the Google services plugin as described by the Firebase assistant (see also [Add Firebase to your Android project](https://firebase.google.com/docs/android/setup#add_the_sdk)) 
   1. iOS 
      1. download the generated `GoogleService-Info.plist` file
      1. Open `ios/Runner.xcworkspace` with Xcode, and within Xcode place the `GoogleService-Info.plist` file inside `ios/Runner`
   1. Web 
      1. modify `web/index.html` following the [Firebase setup instructions](https://firebase.google.com/docs/web/setup#from-the-cdn) 
1. Add code to the app to read from a collection, eg: the 'messages' collection (see `main.dart`) 
1. Set the firestore instance to connect to the local emulator 
   1. add `Firestore.instance.settings(host: 'localhost');` to `main()` 
