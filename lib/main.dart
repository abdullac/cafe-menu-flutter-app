import 'package:cafemenu_app/ui/pages/home_page/page_home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: FirebaseRealtimeDemoScreen(),
      home: Scaffold(
      // key: navigatorState,
        body: PageHome(),
      ),
    );
  }
}

// class Snapshotmodel {
//   String? description;
//   String? name;
//   Snapshotmodel({
//     required this.description,
//     required this.name,
//   });
// }

class FirebaseRealtimeDemoScreen extends StatelessWidget {
  // final ref = FirebaseDatabase.instance.reference();
  // FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref('flutterDevsTeam4');

  @override
  Widget build(BuildContext context) {
    // readData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Realtime Database Demo'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Create Data'),
              onPressed: () {
                createData();
              },
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: const Text('Read/View Data'),
              onPressed: () {
                readData();
              },
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: const Text('Update Data'),
              onPressed: () {
                updateData();
              },
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: const Text('Delete Data'),
              onPressed: () {
                deleteData();
              },
            ),
            // StreamBuilder(
            //   stream: ref.onChildAdded,
            //   builder: (context,AsyncSnapshot<DatabaseEvent> snapshot) {
            //     print("onAdded ${readData()}");
            //     return Container();
            //   },
            // ),
          ],
        ),
      )), //center
    );
  }

  void createData() {
    ref
        .child("flutterDevsTeam1")
        .set({'name': 'Deepak Nishad', 'description': 'Team Lead'});
    ref.child("flutterDevsTeam2").set(
        {'name': 'Yashwant Kumar', 'description': 'Senior Software Engineer'});
    ref
        .child("flutterDevsTeam3")
        .set({'name': 'Akshay', 'description': 'Software Engineer'});
    ref
        .child("flutterDevsTeam4")
        .set({'name': 'Aditya', 'description': 'Software Engineer'});
    ref
        .child("flutterDevsTeam5")
        .set({'name': 'Shaiq', 'description': 'Associate Software Engineer'});
    ref
        .child("flutterDevsTeam6")
        .set({'name': 'Mohit', 'description': 'Associate Software Engineer'});
    ref
        .child("flutterDevsTeam7")
        .set({'name': 'Naveen', 'description': 'Associate Software Engineer'});
  }
  // void readData(){
  //   ref.once().then((DataSnapshot snapshot) {
  //     print('Data : ${snapshot.value}');
  //   });
  // }

  Future<void> readData() async {
    final event = await ref.once(DatabaseEventType.value);
    final readDatasample = event.snapshot.value ?? " no readData Available ";
    print("readData $readDatasample");
  }

  void updateData() {
    ref.child('flutterDevsTeam1').update({'description': 'CEO'});
    ref.child('flutterDevsTeam2').update({'description': 'Team Lead'});
    ref
        .child('flutterDevsTeam3')
        .update({'description': 'Senior Software Engineer'});
  }

  void deleteData() {
    ref.child('flutterDevsTeam1').remove();
    ref.child('flutterDevsTeam2').remove();
    ref.child('flutterDevsTeam3').remove();
  }
}
