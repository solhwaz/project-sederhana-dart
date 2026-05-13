import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../functions/square_area.dart';
import '../theme/app_theme.dart';
import '../widgets/code_block.dart';
import '../widgets/result_box.dart';

/// Card section for the Square Area function (Topic B).
class SquareAreaSection extends StatefulWidget {
  const SquareAreaSection({super.key});

  @override
  State<SquareAreaSection> createState() => _SquareAreaSectionState();
}

class _SquareAreaSectionState extends State<SquareAreaSection> {
  final _sideController = TextEditingController();
  String _result = '';

  void _onCalculate() {
    final side = double.tryParse(_sideController.text.trim());
    if (side == null) return;
    setState(() {
      _result = 'Area = ${calculateArea(side)}';
    });
  }

  @override
  void dispose() {
    _sideController.dispose();
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
                  color: AppColors.tertiaryFixed,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.square_foot,
                  color: AppColors.tertiary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Square Area',
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
            controller: _sideController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Side Length',
              labelStyle: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                color: AppColors.tertiary,
              ),
              hintText: 'Enter length',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.tertiary,
                  width: 2,
                ),
              ),
            ),
            onSubmitted: (_) => _onCalculate(),
          ),
          const SizedBox(height: 16),

          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _onCalculate,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.tertiary,
                foregroundColor: AppColors.onTertiary,
                elevation: 2,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Calculate',
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
            valueColor: AppColors.tertiary,
          ),
          const SizedBox(height: 16),

          // Code block
          CodeBlock(
            children: [
              TextSpan(
                text: 'double',
                style: TextStyle(color: SyntaxColors.type),
              ),
              const TextSpan(text: ' '),
              TextSpan(
                text: 'calculateArea',
                style: TextStyle(color: SyntaxColors.functionName),
              ),
              const TextSpan(text: '('),
              TextSpan(
                text: 'double',
                style: TextStyle(color: SyntaxColors.type),
              ),
              const TextSpan(text: ' side) {\n  '),
              TextSpan(
                text: 'return',
                style: TextStyle(color: SyntaxColors.keyword),
              ),
              const TextSpan(text: ' side * side;\n}'),
            ],
          ),
        ],
      ),
    );
  }
}
