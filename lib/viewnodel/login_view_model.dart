import 'package:chat_uygulamasi/core/firebase_auth_service.dart';
import 'package:chat_uygulamasi/model/user_model.dart';
import 'package:flutter/material.dart';

enum LoginStatus { idle, loading, error }

class LoginViewModel extends ChangeNotifier {
  final AuthService firebaseAuth = AuthService();
  UserModel? _user;
  LoginStatus loginStatus = LoginStatus.idle;
  UserModel? get user => _user;
  String error = "";

  LoginViewModel();

  void createUser({
    required String email,
    required String password,
  }) {
    loginStatus = LoginStatus.loading;
    notifyListeners();
    firebaseAuth.createUserWithEmailAndPassword(email, password).then((value) {
      value.fold((userModel) {
        _user = userModel;
        loginStatus = LoginStatus.idle;
        error = ""; 
        notifyListeners();
      }, (failures) {
        error = failures.toString();
        loginStatus = LoginStatus.error;
        notifyListeners();
      });
    });
  }

  void signInUser({
    required String email,
    required String password,
  }) {
    loginStatus = LoginStatus.loading;
    notifyListeners();
    firebaseAuth.signInWithEmailPassword(email, password).then((value) {
      value.fold((userModel) {
        _user = userModel;
        loginStatus = LoginStatus.idle;
        error = ""; 
        notifyListeners();
      }, (failure) {
        error = failure.toString();
        loginStatus = LoginStatus.error;
        notifyListeners();
      });
    });
  }

  void signOut() async {
    bool result = await firebaseAuth.signOut();
    if (result) {
      _user = null;
      notifyListeners();
    } else {
      error = "Çıkış yapılırken bir hata oluştu";
      notifyListeners();
    }
  }
}
