import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Home'),
      ),
      body: FutureBuilder(
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
              final user = FirebaseAuth.instance.currentUser;
              if (user!.emailVerified) {
                print('You are a verified user');
              } else {
                print('You need to verify your email first');
              }
              return const Text('Done');
              default:
                return const Text('Loading...');
          }
          },
      ),
    );
  }
}
