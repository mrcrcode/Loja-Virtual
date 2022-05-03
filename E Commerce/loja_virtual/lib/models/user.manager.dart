import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_virtual/helpers/firebase_erros.dart';

class UserManager extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

  Future<void> signIn(
      {user, required Function onFail, required Function onSuccess}) async {
    setLoading(true);
    try {
      await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      onSuccess();
    } on FirebaseException catch (e) {
      onFail(getErrorString(e.code));
    }
    setLoading(false);
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }
}
