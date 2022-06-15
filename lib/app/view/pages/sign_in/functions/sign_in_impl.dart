import 'package:firebase_auth/firebase_auth.dart';
import 'package:productivejournal/infrastructure/infrastructure.dart';
import 'package:productivejournal/locator.dart';

class LoginService {
  final auth = FirebaseAuth.instance;
  final logs = locator<LoggerRepository>();

  Future<UserCredential?> loginUser(Map<String, dynamic>? userData) async {
    try {
      if (userData?['user'] == null && userData?['password'] == null) {
        throw Error();
      }

      final credentials = await auth.signInWithEmailAndPassword(
        email: userData?['user'] as String,
        password: userData?['password'] as String,
      );
      return credentials;
    } on FirebaseAuthException catch (error, stack) {
      logs.error(error: error, stack: stack);
      switch (error.message) {
        case '401':
          throw Error();
        default:
          throw Error();
      }
    }
  }
}
