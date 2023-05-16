import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'locker_element.dart';
import 'locker_list_cubit.dart';
import 'locker_list_state.dart';

class LockerBuilder extends StatefulWidget {
  final LockerListCubit lockerListCubit;

  const LockerBuilder({super.key, required this.lockerListCubit});

  @override
  State<LockerBuilder> createState() => _LockerBuilderState();
}

class _LockerBuilderState extends State<LockerBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LockerListCubit, LockerListState>(
        bloc: widget.lockerListCubit,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(21),
            child: Column(
              children: List.generate(
                state.items.length,
                (index) {
                  final item = state.items[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 13),
                    child: LockerElement(
                      item: item,
                      onToggle: (_) {
                        final indexWhere = widget.lockerListCubit.state.items
                            .indexWhere((element) => element.id == item.id);
                        if (indexWhere > -1) {
                          widget.lockerListCubit.copyState(
                            widget.lockerListCubit.state.copyWith(
                                items: widget.lockerListCubit.state.items
                                  ..[indexWhere] = item.copyWith(enable: _)),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
