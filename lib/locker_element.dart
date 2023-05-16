import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const_colors.dart';
import 'locker_model.dart';

class LockerElement extends StatelessWidget {
  const LockerElement({
    super.key,
    required this.item,
    required this.onToggle,
  });

  final LockerModel item;
  final void Function(bool) onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 118,
        decoration: const BoxDecoration(
          color: ConstColors.appBarColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(21),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.enable
                      ? ConstColors.mainColor
                      : const Color(0xFFC7772E)),
              child: Icon(
                item.enable ? Icons.lock : Icons.lock_open,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: GoogleFonts.inter(
                    fontSize: 17,
                    color: const Color(0xFF051A15),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  "id: ${item.id.characters.getRange(0, 13)}",
                  style: const TextStyle(
                      color: Color(0xFF233833),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: item.enable
                        ? ConstColors.mainColor
                        : const Color(0xFFC7772E),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  child: Text(
                    item.enable ? "LOCKED" : "UNLOCKED",
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: FlutterSwitch(
                toggleSize: 35,
                padding: 2,
                activeColor: ConstColors.mainColor,
                inactiveColor: const Color(0xFFD2DBD8),
                value: item.enable,
                onToggle: onToggle,
              ),
            )
          ],
        ));
  }
}
