import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/screens/introduction/cubit/states.dart';

class IntroductionCubit extends Cubit<IntroductionStates> {
  IntroductionCubit() : super(IntroductionStateInitial());

  static get(BuildContext context) => BlocProvider.of(context);

  void change() {
    print("X");
  }
}
