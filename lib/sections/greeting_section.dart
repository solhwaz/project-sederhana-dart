import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../functions/greeting.dart';
import '../theme/app_theme.dart';
import '../widgets/code_block.dart';
import '../widgets/result_box.dart';

/// Card section for the Greeting function (Topic A).
class GreetingSection extends StatefulWidget {
  const GreetingSection({super.key});

  @override
  State<GreetingSection> createState() => _GreetingSectionState();
}

class _GreetingSectionState extends State<GreetingSection> {
  final _nameController = TextEditingController();
  String _result = '';

  void _onGreet() {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;
    setState(() {
      _result = greet(name);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryFixed,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.sentiment_satisfied_outlined,
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Greeting',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Input field
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                color: AppColors.primary,
              ),
              hintText: 'Enter name',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.secondaryContainer,
                  width: 2,
                ),
              ),
            ),
            onSubmitted: (_) => _onGreet(),
          ),
          const SizedBox(height: 16),

          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _onGreet,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryContainer,
                foregroundColor: AppColors.onPrimary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                shadowColor: AppColors.primaryContainer.withValues(alpha: 0.12),
              ),
              child: Text(
                'Greet',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Result
          ResultBox(
            label: 'Result:',
            value: _result.isEmpty ? '-' : _result,
            valueColor: AppColors.primary,
          ),
          const SizedBox(height: 16),

          // Code block
          CodeBlock(
            children: [
              TextSpan(
                text: 'String',
                style: TextStyle(color: SyntaxColors.type),
              ),
              const TextSpan(text: ' '),
              TextSpan(
                text: 'greet',
                style: TextStyle(color: SyntaxColors.functionName),
              ),
              const TextSpan(text: '('),
              TextSpan(
                text: 'String',
                style: TextStyle(color: SyntaxColors.type),
              ),
              const TextSpan(text: ' name) {\n  '),
              TextSpan(
                text: 'return',
                style: TextStyle(color: SyntaxColors.keyword),
              ),
              const TextSpan(text: ' '),
              TextSpan(
                text: "'Hello, \$name!'",
                style: TextStyle(color: SyntaxColors.string),
              ),
              const TextSpan(text: ';\n}'),
            ],
          ),
        ],
      ),
    );
  }
}
