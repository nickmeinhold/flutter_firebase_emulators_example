# flutter_firebase_emulators_example

A simple app to document setting up and using the firebase emulator suite with a Flutter app.

Github Repo: [nickmeinhold/flutter_firebase_emulators_example](https://github.com/nickmeinhold/flutter_firebase_emulators_example)

Firebase Project: [firebase-emulators-flutter](https://console.firebase.google.com/u/0/project/fir-emulators-flutter/overview)


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

### [Connect the app](https://firebase.google.com/docs/emulator-suite/connect_and_prototype)
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

1. Add the "makeUppercase" cloud function from the docs ([Prototype Interactively](https://firebase.google.com/docs/emulator-suite/connect_and_prototype#prototype_interactively)) 
1. (if using typescript) Transpile to javascript by running `npm run build` from the `functions` directory
1. Launch the Local Emulator Suite with `firebase emulators:start`
1. View the UI in your browser at `http://localhost:4000` 
1. Check that the firestore and functions emulators are working 
   1. On the Firestore tab, click Start collection
   1. Create a new document in a messages collection 
   1. Use fieldname "original" and value "test". 
   1. Observe the cloud function was triggered and a new uppercase field appears