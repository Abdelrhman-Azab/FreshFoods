import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/models/user_informations.dart';
import 'package:fresh_food/screens/signup/cubit/states.dart';
import 'package:fresh_food/shared/components/components.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterStateInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  //loading indicator
  bool loading = false;

  register(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    try {
      emit(RegisterStateLoading());

      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        UserInformations user =
            UserInformations(email: email, name: name, id: value.user!.uid);
        saveUserInformations(user);
        emit(RegisterStateSuccess());
      });
    } on FirebaseAuthException catch (e) {
      emit(RegisterStateFailed());

      if (e.code == 'weak-password') {
        showToast(
            context: context, message: 'The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast(
            context: context,
            message: 'The account already exists for that email.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  saveUserInformations(UserInformations user) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.id)
        .set({"email": user.email, "name": user.name, "id": user.id});
  }
}
