import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
            'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
    if (defaultTargetPlatform case TargetPlatform.android) {
      return android;
    } else if (defaultTargetPlatform case TargetPlatform.iOS) {
      return ios;
    } else if (defaultTargetPlatform case TargetPlatform.macOS) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for macos - '
            'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBHwLieBH8mcpE95BI1840RnBX13RM6yI',
    appId: '1:201939672860:android:c25fa91fd8a5828f6424d9',
    messagingSenderId: '201939672860',
    projectId: 'snap-notes-e41db',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBHwLieBH8mcpE95BI1840RnBX13RM6yI',
    appId: '1:201939672860:ios:bb1e8327d435825e6424d9',
    messagingSenderId: '201939672860',
    projectId: 'snap-notes-e41db',
    iosBundleId: 'com.example.snapNotes',
  );
}
