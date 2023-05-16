import 'package:flutter_bloc/flutter_bloc.dart';

class BoolCubit extends Cubit<bool> {
  BoolCubit(super.initialState);

  void set(bool newValue) {
    emit(newValue);
  }
}