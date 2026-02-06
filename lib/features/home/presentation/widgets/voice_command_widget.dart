import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ui/tokens/colors.dart';
import '../../../../core/ui/tokens/spacing.dart';
import '../../../../core/ui/tokens/typography.dart';
import '../../../../core/agents/memory/memory_manager.dart';
import '../../../../core/providers/providers.dart';

/// Voice Command Widget - Quick voice input for common commands
/// 
/// Supports:
/// - "وزني 75.3" - log weight
/// - "خدت موونجارو" - mark medication taken
/// - "أكلت فول وبيض" - quick meal log
/// - "عملت تمرين" - quick workout log
class VoiceCommandWidget extends ConsumerStatefulWidget {
  const VoiceCommandWidget({super.key});

  @override
  ConsumerState<VoiceCommandWidget> createState() =>
      _VoiceCommandWidgetState();
}

class _VoiceCommandWidgetState extends ConsumerState<VoiceCommandWidget>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  bool _isProcessing = false;
  String? _response;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _processCommand() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _isProcessing = true;
      _response = null;
    });

    try {
      final db = ref.read(databaseProvider);
      final memoryManager = MemoryManager(db);

      final response = await memoryManager.processVoiceCommand(text);

      setState(() {
        _response = response;
        _isProcessing = false;
      });

      _controller.clear();

      // Auto-hide response after 3 seconds
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _response = null;
          });
        }
      });

      // Trigger animation
      _animationController.forward(from: 0.0);

      // Invalidate agent sync to refresh
      ref.invalidate(agentSyncStatusProvider);
    } catch (e) {
      setState(() {
        _response = 'خطأ: ${e.toString()}';
        _isProcessing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.lg),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.accent.withValues(alpha: 0.2),
            AppColors.primary.withValues(alpha: 0.15),
            AppColors.surfaceDark.withValues(alpha: 0.9),
          ],
        ),
        border: Border.all(
          color: AppColors.accent.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.lg),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.accent.withValues(alpha: 0.3),
                            AppColors.primary.withValues(alpha: 0.2),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.mic,
                        color: AppColors.accent,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quick Command',
                            style: AppTypography.titleSmall.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Log weight, meals, or medication',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),

                // Input field
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.backgroundDark,
                          borderRadius: BorderRadius.circular(AppSpacing.md),
                          border: Border.all(
                            color: AppColors.accent.withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: _controller,
                          enabled: !_isProcessing,
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.textPrimary,
                          ),
                          decoration: InputDecoration(
                            hintText: 'e.g., وزني 75.3',
                            hintStyle: AppTypography.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.sm,
                            ),
                          ),
                          onSubmitted: (_) => _processCommand(),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    GestureDetector(
                      onTap: _isProcessing ? null : _processCommand,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.accent,
                              AppColors.accent.withValues(alpha: 0.8),
                            ],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: _isProcessing
                            ? const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation(
                                    AppColors.textPrimary,
                                  ),
                                ),
                              )
                            : const Icon(
                                Icons.send,
                                color: AppColors.textPrimary,
                                size: 24,
                              ),
                      ),
                    ),
                  ],
                ),

                // Response
                if (_response != null) ...[
                  const SizedBox(height: AppSpacing.sm),
                  ScaleTransition(
                    scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeOutBack,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(AppSpacing.sm),
                        border: Border.all(
                          color: AppColors.success.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: AppColors.success,
                            size: 16,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Expanded(
                            child: Text(
                              _response!,
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

                // Quick examples
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.xs,
                  runSpacing: AppSpacing.xs,
                  children: [
                    _buildExampleChip('وزني 75.3'),
                    _buildExampleChip('خدت موونجارو'),
                    _buildExampleChip('أكلت فول وبيض'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExampleChip(String example) {
    return GestureDetector(
      onTap: () {
        _controller.text = example;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(AppSpacing.sm),
          border: Border.all(
            color: AppColors.accent.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Text(
          example,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
