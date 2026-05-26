import 'package:flutter/material.dart';

class ButtonCreate extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final double height;  
  final double borderRadius;

  const ButtonCreate({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.height = 52,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1D61E7),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: loading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(label),
                ],
              ),
      ),
    );
  }
}