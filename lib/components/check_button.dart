import 'package:flutter/material.dart';
import 'package:project_kel2_mfe/components/press_effect.dart';

class CheckButton extends StatefulWidget {
  final PressEffectNotifier pressEffectController;
  final bool buttonState;

  const CheckButton({
    super.key,
    required this.pressEffectController,
    required this.buttonState,
  });

  @override
  State<CheckButton> createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      widget.pressEffectController.changePressedState(!widget.buttonState);
      widget.pressEffectController.changeShadowColor(
        Color.fromRGBO(17, 117, 163, 1),
      );
    });
  }

  @override
  void didUpdateWidget(covariant CheckButton oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.buttonState != widget.buttonState) {
      Future.delayed(Duration.zero, () {
        widget.pressEffectController.changePressedState(!widget.buttonState);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          widget.buttonState
              ? () {
                widget.pressEffectController.press();
              }
              : null,
      style: TextButton.styleFrom(
        backgroundColor:
            widget.buttonState
                ? Color.fromRGBO(28, 176, 246, 1)
                : Color.fromRGBO(229, 229, 229, 1),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 18, 0, 18),

        child: Text(
          widget.buttonState ? "BERIKUTNYA" : "PERIKSA",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Jellee",
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
