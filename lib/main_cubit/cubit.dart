import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/main_cubit/cubit.dart';
import 'package:fresh_food/main_cubit/states.dart';
import 'package:fresh_food/shared/network/local/preferences_service.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainStateInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  bool dark = true;

  changeTheme({bool? fromShared}) {
    if (fromShared != null) {
      dark = fromShared;
      emit(MainStateChangeTheme());
    } else {
      dark = !dark;
      CacheHelper().putBool(key: "isDark", value: dark);
      emit(MainStateChangeTheme());
    }
  }
}
