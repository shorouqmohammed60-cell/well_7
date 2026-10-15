import 'cubit.dart';


abstract class SplashState {}

class SplashInitial extends SplashState {}
final class SplashGoToOnboarding extends SplashState {}

class Splashloading extends SplashState{}
class SplashNavigateToLogin extends SplashState{}
class SplashNavigateToHome extends SplashState{}


