import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_strucuture/features/login/data/model/country_model.dart';
import 'package:easy_localization/easy_localization.dart';


import '../data/login_repo.dart';
import 'state.dart';




class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginInitial()){
    setContury();
  }

  final List<CountryModel> countries = [
    CountryModel(
      name: 'Saudi_Arabia'.tr(),
      code: '+966',
      flag: '🇸🇦',
    ),
    CountryModel(
      name: 'Egypt'.tr(),
      code: '+20',
      flag: '🇪🇬',
    ),
  ];
  CountryModel? selectedCountry ;
  void setContury(){
  selectedCountry = countries[0];
  emit(LoginCountryChanged());

  }
    int phoneLength ()=>
          selectedCountry?.code == '+20' ? 10 : 9;
          



  void changeContury(CountryModel country){
  selectedCountry = country;
  emit(LoginCountryChanged());

  }

  String? phoneCode;
      changephoneCode( String value){
       phoneCode = value;
       emit(LoginLoading());
      }

  

    
      String? phone;
      changePhone( String value){
       phone = value;
       emit(LoginLoading());
      }

  Future<void> login({
    required String phone,
    required String phoneCode,
    required String name,
  }) async {
    emit(LoginLoading());

    final result = await loginRepo.login(
      phone,
      phoneCode,
      name,
    );

    result.fold(
      (failure) {
        emit(
          LoginError(
            message: failure.toString(),
          ),
        );
      },
      (loginModel) {
        // userName = loginModel.data?.user?.name;
        // emit(LoginSuccess());
      },
    );
  }
}