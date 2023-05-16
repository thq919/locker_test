import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/locker_list_state.dart';
import 'package:test/locker_model.dart';

class LockerListCubit extends Cubit<LockerListState> {
  LockerListCubit() : super(const LockerListState(items: []));

  void addLocker(LockerModel item) {
    var list = List<LockerModel>.from(state.items)..add(item);
    emit(LockerListState(items: list));
  }

  void removeLocker(LockerModel item) {
    var elements = List<LockerModel>.from(state.items)
      ..removeWhere((e) => e == item);
    emit(LockerListState(items: elements));
  }

  void clear() {
    emit(const LockerListState(items: []));
  }

  LockerModel? hasLocker(LockerModel item) {
    final index = state.items.indexWhere((e) => e == item);
    return index >= 0 ? state.items[index] : null;
  }

  void copyState(LockerListState state) {
    emit(state);
  }
}
