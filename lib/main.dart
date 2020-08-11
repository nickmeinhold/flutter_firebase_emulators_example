import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // uncomment to connect to local firestore emulator
  // await Firestore.instance.settings(host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emulators Example'),
      ),
      body: Center(
          child: StreamBuilder(
        stream: Firestore.instance.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return Container();
          }

          final querySnapshot = snapshot.data as QuerySnapshot;
          _count = querySnapshot.documents.length;

          return ListView.builder(
            itemCount: querySnapshot.documents.length,
            itemBuilder: (context, index) {
              final docSnapshot = querySnapshot.documents[index];
              return ListTile(
                title: Text(docSnapshot.data['original'] ?? 'null'),
              );
            },
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Firestore.instance
              .collection('messages')
              .add({'original': 'test_$_count'});
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
