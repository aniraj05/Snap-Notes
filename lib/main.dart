import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:snap_notes/views/login_view.dart';
import 'package:snap_notes/views/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      home: const HomePage(),
      routes: {
        '/login':(context) => const LoginView(),
        '/register':(context) => const RegisterView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyBBHwLieBH8mcpE95BI1840RnBX13RM6yI',
          appId: '1:201939672860:android:c25fa91fd8a5828f6424d9',
          messagingSenderId: '',
          projectId: 'snap-notes-e41db',
        ),
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState){
          case ConnectionState.done:
          // final user = FirebaseAuth.instance.currentUser;
          // if (user?.emailVerified ?? false) {
          //   return const Text('Done');
          // } else {
          //   return const VerifyEmailView();
          // }
            return const LoginView();
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}

