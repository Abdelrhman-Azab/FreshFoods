import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final String uid = user!.uid;

void getToken() async {
  user!.getIdToken().then((token) => print(token));
}
