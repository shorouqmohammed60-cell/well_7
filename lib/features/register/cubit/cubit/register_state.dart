part of 'register_cubit.dart';
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {
  
}
class RegisterError extends RegisterState {
  final String? msg;
  RegisterError({required this.msg});
  
}
class RegisterImagePicked extends RegisterState {}
class RegisterImageDeleted extends RegisterState {}
