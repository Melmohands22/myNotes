import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfButton extends StatefulWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Future<void> Function()? onPressed;

  const ConfButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    this.onPressed,
  });

  @override
  State<ConfButton> createState() => _ConfButtonState();
}

class _ConfButtonState extends State<ConfButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: TextButton(
        onPressed: _isLoading
            ? null 
            : () async {
                if (widget.onPressed != null) {
                  setState(() {
                    _isLoading = true;
                  });

                  try {
                    await widget.onPressed!(); 
                  } finally {
                    setState(() {
                      _isLoading = false; 
                    });
                  }
                }
              },
        child: _isLoading
            ? SizedBox(
                width: 20.w,
                height: 20.h,
                child: CircularProgressIndicator(
                  color: widget.textColor,
                  strokeWidth: 2.0,
                ),
              )
            : Text(
                widget.text,
                style: TextStyle(fontSize: 14.sp, color: widget.textColor),
              ),
      ),
    );
  }
}