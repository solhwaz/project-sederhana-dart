import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../functions/discount.dart';
import '../theme/app_theme.dart';
import '../widgets/code_block.dart';
import '../widgets/result_box.dart';

/// Card section for the Discount function (Topic C).
class DiscountSection extends StatefulWidget {
  const DiscountSection({super.key});

  @override
  State<DiscountSection> createState() => _DiscountSectionState();
}

class _DiscountSectionState extends State<DiscountSection> {
  final _priceController = TextEditingController();
  final _discountController = TextEditingController();
  String _result = '';

  void _onCalculate() {
    final price = double.tryParse(_priceController.text.trim());
    final discount = double.tryParse(_discountController.text.trim());
    if (price == null || discount == null) return;
    setState(() {
      final result = finalPrice(price, discount);
      _result = '\$${result.toStringAsFixed(2)}';
    });
  }

  @override
  void dispose() {
    _priceController.dispose();
    _discountController.dispose();
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
                  color: AppColors.secondaryFixed,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.percent,
                  color: AppColors.secondary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Discount',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Input fields (2 columns)
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _priceController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Price (\$)',
                    labelStyle: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      color: AppColors.secondary,
                    ),
                    hintText: '0.00',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.secondary,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: _discountController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Discount (%)',
                    labelStyle: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      color: AppColors.secondary,
                    ),
                    hintText: '0',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.secondary,
                        width: 2,
                      ),
                    ),
                  ),
                  onSubmitted: (_) => _onCalculate(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _onCalculate,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: AppColors.onSecondary,
                elevation: 2,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Calculate Price',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Result
          ResultBox(
            label: 'Final Price:',
            value: _result.isEmpty ? '-' : _result,
            valueColor: AppColors.secondary,
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
                text: 'finalPrice',
                style: TextStyle(color: SyntaxColors.functionName),
              ),
              const TextSpan(text: '('),
              TextSpan(
                text: 'double',
                style: TextStyle(color: SyntaxColors.type),
              ),
              const TextSpan(text: ' price, '),
              TextSpan(
                text: 'double',
                style: TextStyle(color: SyntaxColors.type),
              ),
              const TextSpan(text: ' pct) {\n  '),
              TextSpan(
                text: 'return',
                style: TextStyle(color: SyntaxColors.keyword),
              ),
              const TextSpan(text: ' price * (1 - pct / 100);\n}'),
            ],
          ),
        ],
      ),
    );
  }
}
