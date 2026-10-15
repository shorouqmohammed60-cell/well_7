
import 'package:new_strucuture/core/exports.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  

Future <void> register ({
  required String facillityName,
  required String email,
  required String vatNumber,
})
async {
  emit(RegisterLoading());

try {

  //api call 
  emit (RegisterSuccess());

}catch (e){
  emit (RegisterError(msg: e.toString()));


}}}
