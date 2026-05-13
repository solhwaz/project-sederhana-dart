import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A styled code block widget that shows Dart source code
/// with a dark background, mimicking an IDE look.
class CodeBlock extends StatelessWidget {
  const CodeBlock({super.key, required this.children});

  final List<TextSpan> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: RichText(
          text: TextSpan(
            style: GoogleFonts.jetBrainsMono(
              fontSize: 14,
              height: 1.43,
              color: Colors.white,
            ),
            children: children,
          ),
        ),
      ),
    );
  }
}

/// Syntax highlight helper colors
class SyntaxColors {
  static const Color keyword = Color(0xFFA4C9FF); // primary-fixed-dim
  static const Color type = Color(0xFF5CADFE); // secondary-container
  static const Color functionName = Color(0xFF5AD4FF); // tertiary-fixed-dim
  static const Color string = Color(0xFFCE9178); // VS Code string color
  static const Color plain = Colors.white;
}
