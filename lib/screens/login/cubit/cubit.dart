import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fresh_food/models/user_informations.dart';
import 'package:fresh_food/screens/login/cubit/states.dart';
import 'package:fresh_food/shared/components/components.dart';
import 'package:fresh_food/shared/network/local/preferences_service.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStateInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      emit(LoginStateLoading());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        CacheHelper().saveUID(uid: value.user!.uid);
        emit(LoginStateSuccess());
      });
    } on FirebaseAuthException catch (e) {
      emit(LoginStateFailed());
      if (e.code == 'user-not-found') {
        showSnackBar(
            context: context, message: 'No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context: context, message: 'Wrong Password.');

        print('Wrong password provided for that user.');
      }
    }
  }
}
