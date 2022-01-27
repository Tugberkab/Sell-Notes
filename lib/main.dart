import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const FirebaseInit(),
  );
}

class FirebaseInit extends StatefulWidget {
  const FirebaseInit({Key? key}) : super(key: key);

  @override
  _FirebaseInitState createState() => _FirebaseInitState();
}

class _FirebaseInitState extends State<FirebaseInit> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: _initialization,
      builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
        if (snapshot.hasError) {
          return NoFirebaseConnection(errorMessage: snapshot.error.toString());
        } else if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        return WaitingFirebase();
      },
    );
  }
}

class WaitingFirebase extends StatelessWidget {
  const WaitingFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Text(
                'Trying to connect with Firebase...',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoFirebaseConnection extends StatelessWidget {
  final String errorMessage;
  const NoFirebaseConnection({Key? key, required this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'No Firebase Connection\n' + errorMessage,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  AppRouter appRouter = AppRouter();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
