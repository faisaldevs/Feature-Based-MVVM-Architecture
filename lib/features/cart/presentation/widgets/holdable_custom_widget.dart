import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoldableIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Duration holdDelay;
  final double size;

  const HoldableIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.holdDelay = const Duration(milliseconds: 100),
    this.size = 24.0,
  });

  @override
  State<HoldableIconButton> createState() => _HoldableIconButtonState();
}

class _HoldableIconButtonState extends State<HoldableIconButton> {
  Timer? _timer;

  void _startHolding() {
    widget.onPressed(); // trigger immediately
    _timer = Timer.periodic(widget.holdDelay, (_) {
      widget.onPressed();
    });
  }

  void _stopHolding() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onLongPressStart: (_) => _startHolding(),
      onLongPressEnd: (_) => _stopHolding(),
      child: Icon(
        widget.icon,
        size: widget.size.sp,
      ),
    );
  }

  @override
  void dispose() {
    _stopHolding();
    super.dispose();
  }
}
