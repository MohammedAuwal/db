class AppConstants {
  AppConstants._();

  // === APP INFO ===
  static const String appName = 'DubBridge';
  static const String appTagline = 'Translate. Transcribe. Dub. Instantly.';
  static const String appVersion = '1.0.0';

  // === SUPPORTED FORMATS ===
  static const List<String> supportedAudioFormats = [
    'mp3', 'wav', 'm4a', 'aac', 'ogg', 'flac'
  ];
  static const List<String> supportedVideoFormats = [
    'mp4', 'mov', 'avi', 'mkv', 'webm'
  ];

  // === FILE LIMITS ===
  static const int maxFileSizeMB = 200;
  static const int maxFileSizeBytes = 200 * 1024 * 1024;

  // === CHUNK SETTINGS ===
  static const int chunkDurationSeconds = 20;
  static const int maxRetries = 3;

  // === SUPPORTED LANGUAGES ===
  static const List<Map<String, String>> supportedLanguages = [
    {'code': 'en', 'name': 'English', 'flag': '🇬🇧'},
    {'code': 'ha', 'name': 'Hausa', 'flag': '🇳🇬'},
    {'code': 'yo', 'name': 'Yoruba', 'flag': '🇳🇬'},
    {'code': 'ig', 'name': 'Igbo', 'flag': '🇳🇬'},
    {'code': 'pcm', 'name': 'Pidgin English', 'flag': '🇳🇬'},
    {'code': 'sw', 'name': 'Swahili', 'flag': '🇰🇪'},
    {'code': 'fr', 'name': 'French', 'flag': '🇫🇷'},
    {'code': 'ar', 'name': 'Arabic', 'flag': '🇸🇦'},
  ];

  // === EXPORT FORMATS ===
  static const List<String> exportFormats = ['TXT', 'SRT', 'VTT'];

  // === PROCESSING STATUS ===
  static const String statusUploading = 'uploading';
  static const String statusProcessing = 'processing';
  static const String statusCompleted = 'completed';
  static const String statusFailed = 'failed';

  // === STORAGE KEYS ===
  static const String keyOnboardingDone = 'onboarding_done';
  static const String keyUserId = 'user_id';
  static const String keyThemeMode = 'theme_mode';
  static const String keySelectedLanguage = 'selected_language';

  // === SUPABASE TABLES ===
  static const String tableProjects = 'projects';
  static const String tableTranscripts = 'transcripts';
  static const String tableTranslations = 'translations';
  static const String tableProfiles = 'profiles';

  // === CLOUDFLARE ===
  static const String cloudflareWorkerBase = 'YOUR_CLOUDFLARE_WORKER_URL';

  // === CLOUDINARY ===
  static const String cloudinaryCloudName = 'YOUR_CLOUD_NAME';
  static const String cloudinaryUploadPreset = 'dubbridge_preset';
}
