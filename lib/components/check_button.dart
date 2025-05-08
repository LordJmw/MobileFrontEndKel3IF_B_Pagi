import 'package:flutter/material.dart';
import 'package:project_kel2_mfe/components/press_effect.dart';

class CheckButton extends StatefulWidget {
  final PressEffectNotifier pressEffectController;
  final bool buttonState;
  final VoidCallback? action;
  final String label;

  const CheckButton({
    super.key,
    required this.pressEffectController,
    required this.buttonState,
    this.action,
    required this.label,
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
                widget.action?.call();
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
          widget.label,
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
