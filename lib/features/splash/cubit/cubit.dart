import 'package:new_strucuture/core/exports.dart';
import 'package:new_strucuture/features/splash/cubit/state.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    startSplash();
  
  }

  Future<void> startSplash() async {
    emit(Splashloading());

    await Future.delayed(
      const Duration(seconds: 8, milliseconds: 500),
    );

    await getStoreUser();
  }
 
  Future<void> getStoreUser() async {
    final prefs = await SharedPreferences.getInstance();

    final bool isOnboardingCompleted =
        prefs.getBool('onBoarding') ?? false;

    if (isOnboardingCompleted) {
      emit(SplashNavigateToLogin());
    } else {
      
      emit(SplashGoToOnboarding());
    }
  }

  Future<void> setShrouk({required String s}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppStrings.shroukValue, s);
  }

  Future<String?> getShrouk() async {
    final prefs = await SharedPreferences.getInstance();

    final String? shrouk2 =
        prefs.getString(AppStrings.shroukValue);

    print('shrouk = $shrouk2');

    return shrouk2;
  }

  Future<void> clearShrouk() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppStrings.shroukValue);
  }
}