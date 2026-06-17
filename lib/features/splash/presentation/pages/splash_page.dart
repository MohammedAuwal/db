import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../config/app_router.dart';
import '../widgets/animated_logo.dart';
import '../widgets/waveform_animation.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _taglineController;
  late final Animation<double> _fadeAnim;
  late final Animation<double> _taglineFade;
  late final Animation<Offset> _taglineSlide;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _navigate();
  }

  void _setupAnimations() {
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _taglineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeAnim = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );

    _taglineFade = CurvedAnimation(
      parent: _taglineController,
      curve: Curves.easeOut,
    );

    _taglineSlide = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _taglineController,
      curve: Curves.easeOut,
    ));

    // sequence: logo fades in → tagline slides in
    _fadeController.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted) _taglineController.forward();
      });
    });
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(milliseconds: 3500));
    if (!mounted) return;

    final prefs = await SharedPreferences.getInstance();
    final onboardingDone =
        prefs.getBool(AppConstants.keyOnboardingDone) ?? false;

    if (!mounted) return;

    if (onboardingDone) {
      context.go(AppRouter.authEntry);
    } else {
      context.go(AppRouter.onboarding);
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _taglineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // === BACKGROUND PARTICLES ===
          const _BackgroundParticles(),

          // === MAIN CONTENT ===
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 2),

                // LOGO
                FadeTransition(
                  opacity: _fadeAnim,
                  child: const AnimatedSplashLogo(),
                ),

                const SizedBox(height: AppSizes.xl),

                // TAGLINE
                SlideTransition(
                  position: _taglineSlide,
                  child: FadeTransition(
                    opacity: _taglineFade,
                    child: const _TaglineWidget(),
                  ),
                ),

                const Spacer(flex: 2),

                // BOTTOM LOADER
                FadeTransition(
                  opacity: _taglineFade,
                  child: const _BottomLoader(),
                ),

                const SizedBox(height: AppSizes.xl),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TaglineWidget extends StatelessWidget {
  const _TaglineWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Translate. Transcribe. Dub.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: AppSizes.fontXl,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: AppSizes.xs),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.accent, AppColors.secondary],
          ).createShader(bounds),
          child: const Text(
            'Instantly.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: AppSizes.fontXxl,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -0.3,
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomLoader extends StatefulWidget {
  const _BottomLoader();

  @override
  State<_BottomLoader> createState() => _BottomLoaderState();
}

class _BottomLoaderState extends State<_BottomLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _anim = Tween<double>(begin: 0, end: 1).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 120,
          child: AnimatedBuilder(
            animation: _anim,
            builder: (context, _) {
              return LinearProgressIndicator(
                value: null,
                backgroundColor:
                    AppColors.surfaceLight,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(
                  AppSizes.radiusFull,
                ),
                minHeight: 3,
              );
            },
          ),
        ),
        const SizedBox(height: AppSizes.sm),
        const Text(
          'AI Studio Loading...',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: AppSizes.fontSm,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}

class _BackgroundParticles extends StatefulWidget {
  const _BackgroundParticles();

  @override
  State<_BackgroundParticles> createState() =>
      _BackgroundParticlesState();
}

class _BackgroundParticlesState extends State<_BackgroundParticles>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, _) {
        return CustomPaint(
          size: MediaQuery.of(context).size,
          painter: _ParticlePainter(animValue: _ctrl.value),
        );
      },
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final double animValue;

  const _ParticlePainter({required this.animValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final particles = [
      _Particle(0.1, 0.2, 3, AppColors.primary.withOpacity(0.15)),
      _Particle(0.8, 0.1, 4, AppColors.secondary.withOpacity(0.12)),
      _Particle(0.2, 0.7, 2.5, AppColors.accent.withOpacity(0.1)),
      _Particle(0.9, 0.6, 3.5, AppColors.primary.withOpacity(0.08)),
      _Particle(0.5, 0.9, 2, AppColors.secondary.withOpacity(0.1)),
      _Particle(0.7, 0.4, 4, AppColors.accent.withOpacity(0.08)),
    ];

    for (final p in particles) {
      paint.color = p.color;
      final dx = sin(animValue * 2 * pi + p.x * 10) * 10;
      final dy = cos(animValue * 2 * pi + p.y * 10) * 10;
      canvas.drawCircle(
        Offset(
          p.x * size.width + dx,
          p.y * size.height + dy,
        ),
        p.radius * (1 + sin(animValue * 2 * pi) * 0.3),
        paint,
      );
    }
  }

  double sin(double x) => (x - x * x * x / 6);
  double cos(double x) => (1 - x * x / 2);

  @override
  bool shouldRepaint(_ParticlePainter old) =>
      old.animValue != animValue;
}

class _Particle {
  final double x;
  final double y;
  final double radius;
  final Color color;

  const _Particle(this.x, this.y, this.radius, this.color);
}
