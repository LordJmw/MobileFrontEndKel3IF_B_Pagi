import 'package:flutter/material.dart';

class PressEffectNotifier {
  final ValueNotifier<bool> pressed = ValueNotifier(false);
  final ValueNotifier<Color> shadowColor = ValueNotifier(
    Color.fromRGBO(229, 229, 229, 1),
  );

  void changePressedState(bool newState) {
    pressed.value = newState;
  }

  void changeShadowColor(Color newColor) {
    shadowColor.value = newColor;
  }

  void press() {
    pressed.value = !pressed.value;

    Future.delayed(Duration(milliseconds: 100), () {
      pressed.value = !pressed.value;
    });
  }
}

class PressEffect extends StatefulWidget {
  final double offset;
  final Widget Function(PressEffectNotifier toggleNotifier) child;

  const PressEffect({super.key, required this.offset, required this.child});

  @override
  State<PressEffect> createState() => _PressEffectState();
}

class _PressEffectState extends State<PressEffect> {
  late PressEffectNotifier toggleNotifier;
  late ValueNotifier<bool> pressed;
  late ValueNotifier<Color> shadowColor;

  @override
  void initState() {
    super.initState();
    toggleNotifier = PressEffectNotifier();
    pressed = toggleNotifier.pressed;
    shadowColor = toggleNotifier.shadowColor;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([pressed, shadowColor]),
      builder:
          (context, _) => Transform.translate(
            offset: Offset(0, pressed.value ? widget.offset : 0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow:
                    !pressed.value
                        ? [
                          BoxShadow(
                            color: shadowColor.value,
                            offset:
                                pressed.value
                                    ? Offset(0, 0)
                                    : Offset(0, widget.offset),
                          ),
                        ]
                        : [],
              ),
              child: Material(
                color: Colors.transparent,
                child: widget.child(toggleNotifier),
              ),
            ),
          ),
    );
  }
}
