import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_food/screens/settings/cubit/states.dart';
import 'package:fresh_food/shared/network/local/preferences_service.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsStateInitial());

  static SettingsCubit get(context) => BlocProvider.of(context);

  logOut() {
    CacheHelper().deleteUID().then((value) {
      emit(SettingsStateLogoutSuccess());
    });
  }
}
