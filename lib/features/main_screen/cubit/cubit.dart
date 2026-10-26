import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/main_repo.dart';
import 'state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  void changeBottomNav(int index){
    emit(
      _MainState(selectedIndex: index),
    );
  }

 // MainRepo api;
}

class _MainState extends MainState {
  _MainState({required super.selectedIndex});
}
