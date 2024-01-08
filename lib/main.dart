import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:snap_notes/constants/routes.dart';
import 'package:snap_notes/verify_email_views.dart';
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
        loginRoute:(context) => const LoginView(),
        registerRoute:(context) => const RegisterView(),
        notesRoute:(context) => const NotesView(),
      },
    ),
  );
}

enum MenuAction { logout }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyBBHwLieBH8mcpE95BI1840RnBX13RM6yI',
          appId: '1:201939672860:android:c25fa91fd8a5828f6424d9',
          messagingSenderId: '201939672860',
          projectId: 'snap-notes-e41db',
        ),
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState){
          case ConnectionState.done:
          final user = FirebaseAuth.instance.currentUser;
          if(user != null) {
            if(user.emailVerified) {
              return const NotesView();
            }else{
              return const VerifyEmailView();
            }
          }else {
            return const LoginView();
          }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main UI'),
        actions: [
          PopupMenuButton<MenuAction>( onSelected: (value) async {
            switch (value) {
              case MenuAction.logout:
                final shouldLogout = await showLogOutDialog(context);
                if (shouldLogout) {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil( loginRoute, (_) => false);
                }
            }
          },
            itemBuilder: (context) {
            return const[
              PopupMenuItem<MenuAction>(
                value: MenuAction.logout,
                child: Text('Log out'),
              ),
            ];
          },
          ),
        ],
      ),
      body: const Text('Hello world'),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
    return AlertDialog(
      title: const Text('Log out'),
      content: const Text('Are you sure want to Log out?'),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop(false);
          },
            child: const Text('Cancel'),
        ),
        TextButton(onPressed: () {
          Navigator.of(context).pop(true);
          },
            child: const Text('Log out'),
        ),
      ],
    );
    },
  ).then((value) => value ?? false);
}