import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/add_locker_button.dart';
import 'package:test/const_colors.dart';
import 'package:test/locker_list_cubit.dart';
import 'package:test/locker_model.dart';
import 'package:test/svg_pictures.dart';
import 'package:uuid/uuid.dart';

import 'locker_builder.dart';

class LockersPage extends StatefulWidget {
  const LockersPage({super.key});

  @override
  State<LockersPage> createState() => _LockersPageState();
}

class _LockersPageState extends State<LockersPage> {
  final horizontalPadding = const EdgeInsets.symmetric(horizontal: 24);
  final LockerListCubit lockerListCubit = LockerListCubit();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(minHeight: MediaQuery.of(context).size.height),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ColoredBox(
              color: ConstColors.appBarColor,
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: horizontalPadding,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My lockers',
                        style: GoogleFonts.manrope(
                          color: const Color(0xFF051A15),
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: SvgPicture.asset(SvgPictures.exit),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            LockerBuilder(lockerListCubit: lockerListCubit),
            const SizedBox(
              height: 37,
            ),
            Padding(
              padding: horizontalPadding,
              child: Align(
                alignment: AlignmentDirectional.bottomStart,
                child: AddLockerButton(
                  onPressed: () {
                    final uuid = const Uuid().v4();
                    lockerListCubit.addLocker(LockerModel(
                        name: "Locker ${uuid.characters.getRange(0, 3)}",
                        id: uuid,
                        enable: false));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
